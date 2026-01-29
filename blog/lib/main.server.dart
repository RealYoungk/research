/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

// Server-specific Jaspr import.
import 'package:jaspr/server.dart';
import 'package:jaspr/dom.dart';

import 'package:jaspr_content/components/callout.dart';
import 'package:jaspr_content/components/code_block.dart';
import 'package:jaspr_content/components/header.dart';
import 'package:jaspr_content/components/image.dart';
import 'package:jaspr_content/components/sidebar.dart';
import 'package:jaspr_content/components/theme_toggle.dart';
import 'package:jaspr_content/jaspr_content.dart';
import 'package:jaspr_content/theme.dart';

import 'components/company_info.dart';
import 'components/post_list.dart';
import 'extensions/korean_heading_id_extension.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

class ScrollMarginExtension extends ThemeExtension<ScrollMarginExtension> {
  const ScrollMarginExtension();

  @override
  ThemeExtension<ScrollMarginExtension> copyWith() => this;

  @override
  List<StyleRule> buildStyles(ContentTheme theme) => [
    css('[anchor]').styles(
      raw: {'scroll-margin-top': '5rem'},
    ),
  ];
}

void main() {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  // Starts the app.
  //
  // [ContentApp] spins up the content rendering pipeline from jaspr_content to render
  // your markdown files in the content/ directory to a beautiful documentation site.
  runApp(
    ContentApp(
      // Eagerly load all pages so PostList can access them
      eagerlyLoadAllPages: true,
      // Enables mustache templating inside the markdown files.
      templateEngine: MustacheTemplateEngine(),
      parsers: [
        MarkdownParser(),
      ],
      extensions: [
        // Fixes heading IDs for Korean text (must be first!)
        KoreanHeadingIdExtension(),
        // Adds heading anchors to each heading.
        HeadingAnchorsExtension(),
        // Generates a table of contents for each page.
        TableOfContentsExtension(),
      ],
      components: [
        Callout(),
        CodeBlock(),
        Image(zoom: true),
        CustomComponent(pattern: 'PostList', builder: (_, _, _) => const PostList()),
        CustomComponent(pattern: 'CompanyInfo', builder: (_, _, _) => const CompanyInfo()),
      ],
      layouts: [
        // Out-of-the-box layout for documentation sites.
        DocsLayout(
          header: Header(
            title: '기업 분석 노트',
            logo: '/images/logo.svg',
            items: [
              ThemeToggle(),
            ],
          ),
          sidebar: Sidebar(
            groups: [
              SidebarGroup(
                links: [
                  SidebarLink(text: "홈", href: '/'),
                ],
              ),
              SidebarGroup(
                title: '기업분석',
                links: [
                  SidebarLink(text: "큐라클", href: '/posts/365270'),
                ],
              ),
              SidebarGroup(
                title: '기타',
                links: [
                  SidebarLink(text: "소개", href: '/about'),
                ],
              ),
            ],
          ),
        ),
      ],
      theme: ContentTheme(
        extensions: [const ScrollMarginExtension()],
        // Customizes the default theme colors.
        primary: ThemeColor(ThemeColors.blue.$500, dark: ThemeColors.blue.$300),
        background: ThemeColor(ThemeColors.slate.$50, dark: ThemeColors.zinc.$950),
        colors: [
          ContentColors.quoteBorders.apply(ThemeColors.blue.$400),
        ],
      ),
    ),
  );
}
