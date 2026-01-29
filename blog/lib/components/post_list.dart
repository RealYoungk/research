import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr_content/jaspr_content.dart';

class PostList extends StatelessComponent {
  const PostList({super.key});

  @override
  Component build(BuildContext context) {
    final allPages = context.pages;

    final posts = allPages
        .where((page) => page.url.startsWith('/posts/'))
        .toList()
      ..sort((a, b) {
        final dateA = a.data.page['date']?.toString() ?? '';
        final dateB = b.data.page['date']?.toString() ?? '';
        return dateB.compareTo(dateA);
      });

    if (posts.isEmpty) {
      return p([Component.text('아직 작성된 분석이 없습니다.')]);
    }

    return div([
      Style(styles: _styles),
      div(classes: 'post-list', [
        for (final post in posts) _buildPostItem(post),
      ]),
    ]);
  }

  Component _buildPostItem(Page post) {
    final pageData = post.data.page;
    final title = pageData['title'] as String? ?? 'Untitled';
    final description = pageData['description'] as String? ?? '';
    final market = pageData['market'] as String? ?? '';
    final sector = pageData['sector'] as String? ?? '';
    final date = pageData['date']?.toString() ?? '';
    final tags = pageData['tags'] as List<dynamic>? ?? [];

    return article(classes: 'post-item', [
      div(classes: 'post-header', [
        h3([
          a(href: '/research${post.url}', [Component.text(title)]),
        ]),
        span(classes: 'post-date', [Component.text(date)]),
      ]),
      if (description.isNotEmpty)
        p(classes: 'post-description', [Component.text(description)]),
      div(classes: 'post-meta', [
        if (market.isNotEmpty)
          span(classes: 'badge badge-market', [Component.text(market.toUpperCase())]),
        if (sector.isNotEmpty)
          span(classes: 'badge badge-sector', [Component.text(sector)]),
        for (final tag in tags)
          span(classes: 'badge badge-tag', [Component.text(tag.toString())]),
      ]),
    ]);
  }

  static List<StyleRule> get _styles => [
    css('.post-list', [
      css('&').styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        raw: {'gap': '1.5rem'},
      ),
      css('.post-item', [
        css('&').styles(
          padding: Padding.all(1.25.rem),
          border: Border.all(width: 1.px, color: Color('#e2e8f0')),
          radius: BorderRadius.circular(8.px),
          transition: Transition('border-color', duration: Duration(milliseconds: 200)),
        ),
        css('&:hover').styles(
          border: Border.all(width: 1.px, color: Color('#3b82f6')),
        ),
      ]),
      css('.post-header', [
        css('&').styles(
          display: Display.flex,
          justifyContent: JustifyContent.spaceBetween,
          alignItems: AlignItems.baseline,
          raw: {'gap': '1rem'},
        ),
        css('h3').styles(margin: Margin.zero, fontSize: 1.2.rem),
        css('h3 a').styles(textDecoration: TextDecoration.none, color: Color.inherit),
        css('h3 a:hover').styles(color: Color('#3b82f6')),
      ]),
      css('.post-date').styles(
        fontSize: 0.85.rem,
        opacity: 0.6,
        whiteSpace: WhiteSpace.noWrap,
      ),
      css('.post-description').styles(
        margin: Margin.symmetric(vertical: 0.5.rem),
        fontSize: 0.95.rem,
        opacity: 0.7,
      ),
      css('.post-meta', [
        css('&').styles(
          display: Display.flex,
          flexWrap: FlexWrap.wrap,
          raw: {'gap': '0.5rem'},
          margin: Margin.only(top: 0.75.rem),
        ),
      ]),
      css('.badge').styles(
        display: Display.inlineBlock,
        padding: Padding.symmetric(vertical: 0.2.rem, horizontal: 0.6.rem),
        radius: BorderRadius.circular(4.px),
        fontSize: 0.8.rem,
        fontWeight: FontWeight.w500,
      ),
      css('.badge-market').styles(
        backgroundColor: Color('#dbeafe'),
        color: Color('#1e40af'),
      ),
      css('.badge-sector').styles(
        backgroundColor: Color('#dcfce7'),
        color: Color('#166534'),
      ),
      css('.badge-tag').styles(
        backgroundColor: Color('#f1f5f9'),
        color: Color('#475569'),
      ),
    ]),
  ];
}
