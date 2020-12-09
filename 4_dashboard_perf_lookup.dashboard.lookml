- dashboard: 4__dashboard_perf_lookup
  title: 4 - Dashboard Perf Lookup
  layout: newspaper
  elements:
  - name: Query Runtimes by Explore
    title: Query Runtimes by Explore
    model: looker_internal
    explore: history
    type: table
    fields:
    - query.model
    - query.view
    - history.query_run_count
    - history.average_runtime
    filters:
      history.result_source: query
    sorts:
    - history.query_run_count desc
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_ignored_fields:
    - history.query_run_count
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting:
    - type: high to low
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
    listen:
      History Date: history.created_date
      Dashboard: history.dashboard_id
      Source: history.source
    row: 8
    col: 6
    width: 8
    height: 6
  - name: Uncached Query Runtimes
    title: Uncached Query Runtimes
    model: looker_internal
    explore: history
    type: table
    fields:
    - query.view
    - query.formatted_fields
    - query.formatted_pivots
    - history.average_runtime
    - query.count
    - history.dashboard_id
    filters:
    sorts:
    - query.count desc
    limit: 20
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_ignored_fields:
    - query.count
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting:
    - type: high to low
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
    listen:
      History Date: history.created_date
      Dashboard: history.dashboard_id
      Source: history.source
    row: 27
    col: 0
    width: 24
    height: 21
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
    width: 12
    height: 8
  - title: Cache Ratio Comparison
    name: Cache Ratio Comparison
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
      _kind_hint: measure
      _type_hint: number
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
      Source: history.source
    row: 0
    col: 12
    width: 12
    height: 8
  - title: Query Runtimes by Model
    name: Query Runtimes by Model
    model: looker_internal
    explore: history
    type: table
    fields:
    - query.model
    - history.query_run_count
    - history.average_runtime
    filters:
    sorts:
    - history.query_run_count desc
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      History Date: history.created_date
      Dashboard: history.dashboard_id
      Source: history.source
    row: 8
    col: 0
    width: 6
    height: 6
  - title: Filter Values
    name: Filter Values
    model: looker_internal
    explore: history
    type: table
    fields:
    - dashboard_filters.filter_json
    - history.query_run_count_no_cache
    - history.query_run_count_cache
    - history.cache_ratio
    - history.average_runtime
    filters:
    sorts:
    - history.query_run_count_no_cache desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: filters_used
      label: Filters Used
      expression: |-
        if(
          is_null(${dashboard_filters.filter_json})
          , "Unfiltered"
          , replace(${dashboard_filters.filter_json}," ","")
        )
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_ignored_fields:
    - history.query_run_count_no_cache
    - history.query_run_count_cache
    - history.average_runtime
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    series_labels:
      history.query_run_count_no_cache: Uncached
      history.query_run_count_cache: Cached
    hidden_fields:
    - dashboard_filters.filter_json
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
    listen:
      History Date: history.created_date
      Dashboard: history.dashboard_id
      Source: history.source
    row: 19
    col: 0
    width: 24
    height: 8
  - title: Cache Rate
    name: Cache Rate
    model: looker_internal
    explore: history
    type: looker_line
    fields:
    - history.created_date
    - history.query_run_count_cache
    - history.query_run_count_no_cache
    fill_fields:
    - history.created_date
    sorts:
    - history.created_date desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: cache_rate
      label: Cache Rate
      expression: |-
        ${history.query_run_count_cache}
        /
        (${history.query_run_count_cache}
          + ${history.query_run_count_no_cache})
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
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - history.query_run_count_cache
    - history.query_run_count_no_cache
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: cache_rate
        name: Cache Rate
        axisId: cache_rate
    listen:
      Dashboard: history.dashboard_id
      Source: history.source
    row: 8
    col: 14
    width: 5
    height: 6
  - title: Caching by Hour of Day
    name: Caching by Hour of Day
    model: looker_internal
    explore: history
    type: looker_line
    fields:
    - history.query_run_count_cache
    - history.query_run_count_no_cache
    - history.created_hour_of_day
    fill_fields:
    - history.created_hour_of_day
    filters:
    sorts:
    - hour
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: cache_rate
      label: Cache Rate
      expression: |-
        ${history.query_run_count_cache}
        /
        (${history.query_run_count_cache}
          + ${history.query_run_count_no_cache})
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    - table_calculation: hour
      label: Hour
      expression: mod(${history.created_hour_of_day}+24-8,24)
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: number
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
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
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - history.query_run_count_cache
    - history.query_run_count_no_cache
    - history.created_hour_of_day
    trend_lines: []
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: false
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: cache_rate
        name: Cache Rate
        axisId: cache_rate
    listen:
      History Date: history.created_date
      Dashboard: history.dashboard_id
      Source: history.source
    row: 8
    col: 19
    width: 5
    height: 6
  - title: Render Metrics
    name: Render Metrics
    model: looker_internal
    explore: dashboard_performance
    type: table
    fields:
    - dashboard_run_history_facts.dashboard_id
    - dashboard_page_event_stats.average_time_to_metadata_loaded
    - dashboard_performance.average_time_until_first_data_received
    - dashboard_performance.diff_between_first_data_and_first_render
    - dashboard_performance.count
    - dashboard_filters.count_filter_combinations
    filters:
      dashboard_performance.raw_data_timeframe: 2 hours ago for 2 hours
    sorts:
    - dashboard_performance.count desc
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    listen:
      Dashboard: dashboard_run_history_facts.dashboard_id
    row: 14
    col: 10
    width: 14
    height: 5
  - title: Render Time Distribution
    name: Render Time Distribution
    model: looker_internal
    explore: dashboard_performance
    type: looker_line
    fields:
    - dashboard_performance.dashboard_run_session
    - dashboard_performance.average_time_until_first_tile_finished_rendering
    - dashboard_page_event_stats.average_time_to_metadata_loaded
    filters:
      dashboard_performance.raw_data_timeframe: 2 hours
    sorts:
    - dashboard_performance.average_time_until_first_tile_finished_rendering desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: row_number
      label: Row Number
      expression: row()
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: number
    - table_calculation: total_rows
      label: Total Rows
      expression: count(${row_number})
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: number
    - table_calculation: percentile
      label: Percentile
      expression: 100 * ${row_number} / ${total_rows}
      value_format:
      value_format_name: decimal_3
      _kind_hint: dimension
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
    show_x_axis_label: true
    show_x_axis_ticks: false
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    colors:
    - 'palette: Default'
    series_colors: {}
    hidden_fields:
    - row_number
    - dashboard_performance.dashboard_run_session
    - total_rows
    listen:
      Dashboard: dashboard_run_history_facts.dashboard_id
    row: 14
    col: 0
    width: 10
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
    default_value: DASHBOARD
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
