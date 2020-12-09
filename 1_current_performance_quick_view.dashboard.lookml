- dashboard: 1__current_performance_quick_view
  title: 1 - Current Performance Quick View
  layout: newspaper
  elements:
  - title: Performance Pulse
    name: Performance Pulse
    model: looker_internal
    explore: history
    type: looker_line
    fields:
    - history.source
    - history.created_minute
    - history.average_runtime
    pivots:
    - history.source
    fill_fields:
    - history.created_minute
    filters:
      history.created_minute: 120 minutes
      history.source: Dashboard,Explore,Scheduled Task,Saved Look,Renderer
    sorts:
    - history.created_minute desc
    - history.source
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
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
    hidden_series:
    - Renderer
    focus_on_hover: true
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
    y_axes:
    - label: Avg. Runtime
      maxValue: 200
      minValue: 0
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: Dashboard
        name: Dashboard
        __FILE: custom_i_looker/1_current_performance.dashboard.lookml
        __LINE_NUM: 72
      - id: Explore
        name: Explore
        __FILE: custom_i_looker/1_current_performance.dashboard.lookml
        __LINE_NUM: 74
      - id: Renderer
        name: Renderer
        __FILE: custom_i_looker/1_current_performance.dashboard.lookml
        __LINE_NUM: 76
      - id: Saved Look
        name: Saved Look
        __FILE: custom_i_looker/1_current_performance.dashboard.lookml
        __LINE_NUM: 78
      - id: Scheduled Task
        name: Scheduled Task
        __FILE: custom_i_looker/1_current_performance.dashboard.lookml
        __LINE_NUM: 80
      __FILE: custom_i_looker/1_current_performance.dashboard.lookml
      __LINE_NUM: 60
    reference_lines:
    - reference_type: range
      line_value: mean
      range_start: '0'
      range_end: '30'
      margin_top: deviation
      margin_value: mean
      margin_bottom: deviation
      label_position: left
      color: "#4ac90e"
      label: A
      __FILE: custom_i_looker/1_current_performance.dashboard.lookml
      __LINE_NUM: 83
    - reference_type: range
      line_value: mean
      range_start: '30'
      range_end: '60'
      margin_top: deviation
      margin_value: mean
      margin_bottom: deviation
      label_position: left
      color: "#faec05"
      label: B
      __FILE: custom_i_looker/1_current_performance.dashboard.lookml
      __LINE_NUM: 93
    - reference_type: range
      line_value: mean
      range_start: '60'
      range_end: '90'
      margin_top: deviation
      margin_value: mean
      margin_bottom: deviation
      label_position: left
      color: "#ec2323"
      label: C
      __FILE: custom_i_looker/1_current_performance.dashboard.lookml
      __LINE_NUM: 103
    - reference_type: line
      line_value: median
      range_start: max
      range_end: min
      margin_top: deviation
      margin_value: mean
      margin_bottom: deviation
      label_position: right
      color: "#000000"
      label: 'Median: {{median}}'
    listen:
      Model: query.model
      Explore: query.view
    row: 2
    col: 0
    width: 12
    height: 8
  - title: Percentage of Queries returning under 30 seconds, last 24 Hours
    name: Percentage of Queries returning under 30 seconds, last 24 Hours
    model: looker_internal
    explore: history
    type: looker_column
    fields:
    - history.query_run_count
    - history.runtime_tiers
    - history.created_hour
    pivots:
    - history.runtime_tiers
    fill_fields:
    - history.created_hour
    filters:
      history.created_time: 24 hours
      history.runtime_tiers: "-Below 0,-Undefined"
    sorts:
    - history.runtime_tiers 0
    - history.created_hour desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: queries_under_30_seconds
      label: Queries under 30 seconds
      expression: "pivot_index(${history.query_run_count},1) + \npivot_index(${history.query_run_count},2)\
        \ +\npivot_index(${history.query_run_count},3)"
      value_format:
      value_format_name:
      _kind_hint: supermeasure
    - table_calculation: queries_over_30_seconds
      label: Queries over 30 seconds
      expression: "pivot_index(${history.query_run_count},4) + \npivot_index(${history.query_run_count},5)\
        \ +\npivot_index(${history.query_run_count},6)"
      value_format:
      value_format_name:
      _kind_hint: supermeasure
    - table_calculation: percentage_of_queries_returning_under_30_seconds
      label: Percentage of Queries returning under 30 seconds
      expression: "${queries_under_30_seconds}/(${queries_over_30_seconds}+${queries_under_30_seconds})"
      value_format:
      value_format_name: percent_1
      _kind_hint: supermeasure
    query_timezone: America/Los_Angeles
    stacking: percent
    show_value_labels: true
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
    x_axis_scale: time
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    colors:
    - 'palette: Default'
    series_colors:
      queries_under_30_seconds: "#3d9c2d"
      percentage_of_queries_returning_under_30_seconds: "#7d0b26"
      queries_over_30_seconds: "#d6293c"
    hidden_fields:
    - history.query_run_count
    hidden_series:
    - percentage_of_queries_returning_under_30_seconds
    series_types: {}
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
      valueFormat: ''
      series:
      - id: queries_under_30_seconds
        name: Queries under 30 seconds
        __FILE: custom_i_looker/1_current_performance.dashboard.lookml
        __LINE_NUM: 212
      - id: queries_over_30_seconds
        name: Queries over 30 seconds
        __FILE: custom_i_looker/1_current_performance.dashboard.lookml
        __LINE_NUM: 214
      - id: percentage_of_queries_returning_under_30_seconds
        name: Percentage of Queries returning under 30 seconds
        __FILE: custom_i_looker/1_current_performance.dashboard.lookml
        __LINE_NUM: 216
      __FILE: custom_i_looker/1_current_performance.dashboard.lookml
      __LINE_NUM: 200
    column_spacing_ratio:
    x_axis_datetime_tick_count: 30
    font_size: ''
    listen:
      Model: query.model
      Explore: query.view
    row: 2
    col: 12
    width: 12
    height: 8
  - title: Recent Queries
    name: Recent Queries
    model: looker_internal
    explore: history
    type: looker_timeline
    fields:
    - history.created_time
    - history.runtime
    - history.id
    - query.id
    - history.source
    - history.query_run_count
    filters:
      query.created_time: 4 hours ago for 1 hour
    sorts:
    - history.created_time desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: query_start_time
      label: Query Start Time
      expression: add_seconds(${history.query_run_count}*0,${history.created_time})
      value_format:
      value_format_name:
      _kind_hint: measure
    - table_calculation: query_end_time
      label: Query End Time
      expression: 'add_seconds((${history.runtime}+${history.query_run_count}*0),${history.created_time})

        '
      value_format:
      value_format_name:
      _kind_hint: measure
    - table_calculation: query_id
      label: Query ID
      expression: "${history.query_run_count}*0+${query.id}"
      value_format:
      value_format_name:
      _kind_hint: measure
    query_timezone: America/Los_Angeles
    barColors:
    - 'palette: Looker Classic'
    labelSize: 10pt
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
    series_types: {}
    hidden_fields:
    - history.query_run_count
    - history.id
    - history.runtime
    - history.created_time
    valueFormat: HH:MM:SS
    groupBars: false
    showLegend: true
    listen:
      Model: query.model
      Explore: query.view
    row: 10
    col: 0
    width: 24
    height: 9
  - name: Snapshot of Current Performance
    type: text
    title_text: Snapshot of Current Performance
    subtitle_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: Model
    title: Model
    type: field_filter
    default_value: ''
    model: looker_internal
    explore: look
    field: query.model
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Explore
    title: Explore
    type: field_filter
    default_value: ''
    model: looker_internal
    explore: look
    field: query.view
    listens_to_filters: []
    allow_multiple_values: true
    required: false
