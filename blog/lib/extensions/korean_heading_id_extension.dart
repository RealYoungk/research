import 'package:jaspr_content/jaspr_content.dart';

/// Extension that fixes heading IDs for Korean text and smooth anchor scrolling.
/// Must be applied BEFORE HeadingAnchorsExtension and TableOfContentsExtension.
class KoreanHeadingIdExtension implements PageExtension {
  const KoreanHeadingIdExtension();

  static final _headerRegex = RegExp(r'^h[1-6]$', caseSensitive: false);

  @override
  Future<List<Node>> apply(Page page, List<Node> nodes) async {
    final usedIds = <String>{};
    final processed = _processNodes(nodes, usedIds);
    // Inject client-side script that intercepts TOC anchor clicks
    // to use smooth scrolling instead of full page navigation
    return [
      ElementNode('script', {}, [
        TextNode(
          'document.addEventListener("click",function(e){'
          'var a=e.target.closest(".toc a[href*=\'#\']");'
          'if(!a)return;'
          'var h=a.getAttribute("href");'
          'var i=h.indexOf("#");'
          'if(i<0)return;'
          'var id=decodeURIComponent(h.substring(i+1));'
          'var el=document.getElementById(id);'
          'if(el){'
          'e.preventDefault();'
          'el.scrollIntoView({behavior:"smooth"});'
          'history.replaceState(null,null,h.substring(i));'
          '}'
          '});',
          raw: true,
        ),
      ]),
      ...processed,
    ];
  }

  List<Node> _processNodes(List<Node> nodes, Set<String> usedIds) {
    return nodes.map((node) {
      if (node is! ElementNode) return node;

      // Check if this is a heading element
      if (_headerRegex.hasMatch(node.tag)) {
        final currentId = node.attributes['id'];
        if (currentId != null) {
          // Generate a new unique ID based on the heading text
          final newId = _generateUniqueId(node.innerText, usedIds);

          // Create a new ElementNode with the updated id attribute
          return ElementNode(
            node.tag,
            {...node.attributes, 'id': newId},
            node.children != null ? _processNodes(node.children!, usedIds) : null,
          );
        }
      }

      // Recursively process children if they exist
      if (node.children != null) {
        return ElementNode(
          node.tag,
          node.attributes,
          _processNodes(node.children!, usedIds),
        );
      }

      return node;
    }).toList();
  }

  String _generateUniqueId(String text, Set<String> usedIds) {
    // Generate slug: keep alphanumeric and Korean characters
    var slug = text
        .toLowerCase()
        .trim()
        // Keep Korean (가-힣), alphanumeric, and hyphens
        .replaceAll(RegExp(r'[^\w\s가-힣a-z0-9-]'), '')
        // Replace whitespace with hyphens
        .replaceAll(RegExp(r'\s+'), '-')
        // Collapse multiple hyphens
        .replaceAll(RegExp(r'-+'), '-')
        // Trim leading/trailing hyphens
        .replaceAll(RegExp(r'^-|-$'), '');

    // If slug is empty or only hyphens after processing, use generic prefix
    if (slug.isEmpty || slug == '-') {
      slug = 'section';
    }

    // Ensure uniqueness by appending counter if needed
    var finalId = slug;
    var counter = 1;
    while (usedIds.contains(finalId)) {
      finalId = '$slug-$counter';
      counter++;
    }
    usedIds.add(finalId);
    return finalId;
  }
}
