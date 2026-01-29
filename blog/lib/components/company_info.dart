import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr_content/jaspr_content.dart';

class CompanyInfo extends StatelessComponent {
  const CompanyInfo({super.key});

  @override
  Component build(BuildContext context) {
    final page = context.page;
    final pageData = page?.data.page;

    if (pageData == null) {
      return div([]);
    }

    final company = pageData['company'] as Map<String, dynamic>?;
    final market = pageData['market'] as String?;
    final sector = pageData['sector'] as String?;

    if (company == null) {
      return div([]);
    }

    final nameEn = company['nameEn'] as String? ?? '';
    final ticker = company['ticker'] as String? ?? '';
    final industry = company['industry'] as String? ?? '';
    final marketCap = company['marketCap'] as String? ?? '';
    final founded = company['founded'] as String? ?? '';
    final ceo = company['ceo'] as String? ?? '';
    final employees = company['employees']?.toString() ?? '';

    return div([
      Style(styles: _styles),
      div(classes: 'company-info-card', [
        // Badges
        div(classes: 'company-badges', [
          if (ticker.isNotEmpty)
            span(classes: 'badge badge-ticker', [Component.text(ticker)]),
          if (market != null && market.isNotEmpty)
            span(classes: 'badge badge-market', [Component.text(market.toUpperCase())]),
          if (industry.isNotEmpty)
            span(classes: 'badge badge-industry', [Component.text(industry)]),
          if (nameEn.isNotEmpty)
            span(classes: 'badge badge-name-en', [Component.text(nameEn)]),
        ]),
        // Info table
        div(classes: 'company-details', [
          if (marketCap.isNotEmpty)
            _buildDetailRow('시가총액', marketCap),
          if (founded.isNotEmpty)
            _buildDetailRow('설립', founded),
          if (ceo.isNotEmpty)
            _buildDetailRow('대표이사', ceo),
          if (employees.isNotEmpty)
            _buildDetailRow('임직원 수', '$employees명'),
          if (sector != null && sector.isNotEmpty)
            _buildDetailRow('섹터', sector),
        ]),
      ]),
    ]);
  }

  Component _buildDetailRow(String label, String value) {
    return div(classes: 'detail-row', [
      span(classes: 'detail-label', [Component.text(label)]),
      span(classes: 'detail-value', [Component.text(value)]),
    ]);
  }

  static List<StyleRule> get _styles => [
    css('.company-info-card', [
      css('&').styles(
        border: Border.all(width: 1.px, color: Color('#e2e8f0')),
        radius: BorderRadius.circular(12.px),
        padding: Padding.all(1.5.rem),
        backgroundColor: Color('#ffffff'),
        raw: {'box-shadow': '0 1px 3px rgba(0, 0, 0, 0.1)'},
        margin: Margin.only(bottom: 1.25.rem),
      ),
    ]),
    css('.company-badges', [
      css('&').styles(
        display: Display.flex,
        flexWrap: FlexWrap.wrap,
        raw: {'gap': '0.5rem'},
        margin: Margin.only(bottom: 1.rem),
      ),
    ]),
    css('.badge-name-en').styles(
      backgroundColor: Color('#f8fafc'),
      color: Color('#64748b'),
      fontWeight: FontWeight.normal,
    ),
    css('.badge').styles(
      display: Display.inlineBlock,
      padding: Padding.symmetric(vertical: 0.25.rem, horizontal: 0.75.rem),
      radius: BorderRadius.circular(4.px),
      fontSize: 0.85.rem,
      fontWeight: FontWeight.w500,
    ),
    css('.badge-ticker').styles(
      backgroundColor: Color('#fef3c7'),
      color: Color('#92400e'),
    ),
    css('.badge-market').styles(
      backgroundColor: Color('#dbeafe'),
      color: Color('#1e40af'),
    ),
    css('.badge-industry').styles(
      backgroundColor: Color('#f3e8ff'),
      color: Color('#6b21a8'),
    ),
    css('.company-details', [
      css('&').styles(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        raw: {'gap': '0.75rem'},
      ),
    ]),
    css('.detail-row', [
      css('&').styles(
        display: Display.grid,
        raw: {
          'grid-template-columns': '120px 1fr',
          'gap': '1rem',
          'align-items': 'center',
        },
      ),
      css('.detail-label').styles(
        fontWeight: FontWeight.w600,
        color: Color('#64748b'),
        fontSize: 0.9.rem,
      ),
      css('.detail-value').styles(
        color: Color('#1e293b'),
        fontSize: 0.95.rem,
      ),
    ]),
  ];
}
