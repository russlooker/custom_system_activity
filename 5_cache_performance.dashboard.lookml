- dashboard: 5__cache_performance
  title: 5 - Cache Performance
  layout: newspaper
  elements:
  - title: Overall Distribution
    name: Overall Distribution
    model: looker_internal
    explore: history
    type: looker_pie
    fields:
    - history.result_source
    - history.query_run_count
    sorts:
    - history.query_run_count desc
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    colors:
    - "#1D98D3"
    - "#3B4260"
    - "#39A736"
    - "#F3BF0E"
    - "#E57200"
    - "#5DCCCC"
    - "#7e64e0"
    - "#F663D6"
    - "#603535"
    - "#A5C740"
    - "#B54B4B"
    - "#B1B0B0"
    series_colors: {}
    listen:
      History Date: history.created_date
      Dashboard: history.dashboard_id
      Source: history.source
    row: 0
    col: 0
    width: 7
    height: 7
  - title: Dashboard Cache Ratio, by Hit Volume
    name: Dashboard Cache Ratio, by Hit Volume
    model: looker_internal
    explore: history
    type: looker_column
    fields:
    - history.dashboard_id
    - history.query_run_count_cache
    - history.query_run_count_no_cache
    - history.query_run_count
    filters:
      history.result_source: "-NULL"
    sorts:
    - history.query_run_count desc
    limit: 1000
    column_limit: 50
    dynamic_fields:
    - table_calculation: percent_cached
      label: Percent Cached
      expression: |-
        ${history.query_run_count_cache}
        /
        ${history.query_run_count}
      value_format:
      value_format_name: percent_2
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: left
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    font_size: '12'
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types:
      percent_cached: line
    colors:
    - "#1D98D3"
    - "#3B4260"
    - "#39A736"
    - "#F3BF0E"
    - "#E57200"
    - "#5DCCCC"
    - "#7e64e0"
    - "#F663D6"
    - "#603535"
    - "#A5C740"
    - "#B54B4B"
    - "#B1B0B0"
    series_colors: {}
    hidden_fields:
    - history.query_run_count
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: history.query_run_count_cache
        name: History Query Run Count From Cache
        axisId: history.query_run_count_cache
      - id: history.query_run_count_no_cache
        name: History Query Run Count Without Cache
        axisId: history.query_run_count_no_cache
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: percent_cached
        name: Percent Cached
        axisId: percent_cached
    listen:
      History Date: history.created_date
      Dashboard: history.dashboard_id
      Source: history.source
    row: 0
    col: 7
    width: 9
    height: 12
  - title: Cache Runtime Distribution
    name: Cache Runtime Distribution
    model: looker_internal
    explore: history
    type: looker_column
    fields:
    - history.runtime_tiers
    - history.query_run_count
    fill_fields:
    - history.runtime_tiers
    filters:
      history.result_source: cache
    sorts:
    - history.runtime_tiers
    limit: 50
    column_limit: 50
    dynamic_fields:
    - table_calculation: cumulative_distribution
      label: Cumulative Distribution
      expression: |-
        sum(
          offset_list(
            ${history.query_run_count}
            , 1-row(),row()
          )
        )
        /
        sum(${history.query_run_count})
      value_format:
      value_format_name: percent_1
    - table_calculation: distribution
      label: Distribution
      expression: "${history.query_run_count}"
      value_format:
      value_format_name: decimal_0
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types:
      cumulative_distribution: line
    hidden_fields:
    - history.query_run_count
    series_colors: {}
    y_axes:
    - label:
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: distribution
        name: Distribution
        axisId: distribution
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: cumulative_distribution
        name: Cumulative Distribution
        axisId: cumulative_distribution
    colors:
    - "#EA0B8C"
    - "#29ABE2"
    - "#33D9C1"
    - "#9DACB9"
    - "#7560AA"
    - "#2D5584"
    - "#831C4A"
    - "#333D47"
    - "#AC2077"
    listen:
      History Date: history.created_date
      Dashboard: history.dashboard_id
      Source: history.source
    row: 0
    col: 16
    width: 8
    height: 12
  - title: Cache Rate Over Time
    name: Cache Rate Over Time
    model: looker_internal
    explore: history
    type: looker_line
    fields:
    - history.query_run_count_cache
    - history.query_run_count_no_cache
    - history.created_week
    fill_fields:
    - history.created_week
    filters:
      history.created_week: 90 days
    sorts:
    - history.created_week
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: cache_rate
      label: Cache Rate
      expression: |-
        ${history.query_run_count_cache}
        /
        (${history.query_run_count_cache}
          +${history.query_run_count_no_cache})
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: time
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - history.query_run_count_cache
    - history.query_run_count_no_cache
    series_types: {}
    listen:
      Dashboard: history.dashboard_id
      Source: history.source
    row: 7
    col: 0
    width: 7
    height: 5
  filters:
  - name: History Date
    title: History Date
    type: field_filter
    default_value: 7 days
    model: looker_internal
    explore: history
    field: history.created_date
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Dashboard
    title: Dashboard
    type: field_filter
    default_value: ''
    model: looker_internal
    explore: history
    field: history.dashboard_id
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Source
    title: Source
    type: field_filter
    default_value: Dashboard
    model: looker_internal
    explore: history
    field: history.source
    listens_to_filters: []
    allow_multiple_values: true
    required: false
