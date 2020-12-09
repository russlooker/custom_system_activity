- dashboard: 2__performance_overview
  title: 2 - Performance Overview
  layout: newspaper
  elements:
  - title: Distribution of Query Runtime over Time
    name: Distribution of Query Runtime over Time
    model: looker_internal
    explore: history
    type: looker_column
    fields:
    - history.query_run_count
    - history.runtime_tiers
    - history.created_date
    pivots:
    - history.runtime_tiers
    fill_fields:
    - history.created_date
    filters:
      history.runtime_tiers: "-Below 0,-Undefined"
    sorts:
    - history.created_date
    - history.runtime_tiers 0
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
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
    colors:
    - "#31b045"
    - "#7DD389"
    - "#CADF79"
    - "#E2DF78"
    - "#E7AF75"
    - "#EE7772"
    - "#CADF79"
    - "#E2DF78"
    - "#E5C877"
    - "#E7AF75"
    - "#EE7772"
    - "#EE7772"
    series_colors:
      Undefined - 7 - history.query_run_count: "#f50715"
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: log
      unpinAxis: false
      valueFormat:
      series:
      - id: 0 to 4
        name: 0 to 4
      - id: 5 to 9
        name: 5 to 9
      - id: 10 to 29
        name: 10 to 29
      - id: 30 to 119
        name: 30 to 119
      - id: 120 to 299
        name: 120 to 299
      - id: 300 or Above
        name: 300 or Above
    hidden_series: []
    listen:
      Date: history.created_date
      Model: query.model
    row: 27
    col: 0
    width: 24
    height: 8
  - title: Runtime & Views by Source
    name: Runtime & Views by Source
    model: looker_internal
    explore: history
    type: looker_column
    fields:
    - history.average_runtime
    - history.query_run_count
    - history.source
    filters:
      history.source: Saved Look,Dashboard,Explore,Renderer,Scheduled Task
    sorts:
    - history.average_runtime desc
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
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    font_size: '12'
    show_null_points: true
    point_style: circle
    interpolation: linear
    hidden_fields: []
    series_types: {}
    hidden_series: []
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: history.average_runtime
        name: History Average Runtime
        __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
        __LINE_NUM: 514
      __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
      __LINE_NUM: 502
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: history.query_run_count
        name: History Query Run Count
        __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
        __LINE_NUM: 528
      __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
      __LINE_NUM: 516
    reference_lines: []
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
      Date: history.created_date
      Model: query.model
    row: 9
    col: 0
    width: 9
    height: 8
  - title: Query Count by Explore
    name: Query Count by Explore
    model: looker_internal
    explore: history
    type: looker_bar
    fields:
    - history.average_runtime
    - query.view
    - history.query_run_count
    - history.source
    pivots:
    - history.source
    filters:
      history.source: Scheduled Task,Renderer,Dashboard,Explore,Saved Look
    sorts:
    - history.query_run_count desc 0
    - history.source
    limit: 20
    column_limit: 50
    query_timezone: America/Los_Angeles
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
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: true
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    conditional_formatting: []
    hidden_fields:
    - history.average_runtime
    note_state: collapsed
    note_display: above
    note_text: Top 20
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
      Date: history.created_date
      Model: query.model
    row: 37
    col: 13
    width: 11
    height: 12
  - name: Queries by Source
    type: text
    title_text: Queries by Source
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Queries over Time
    type: text
    title_text: Queries over Time
    row: 17
    col: 0
    width: 24
    height: 2
  - name: Queries by Explore
    type: text
    title_text: Queries by Explore
    row: 35
    col: 0
    width: 24
    height: 2
  - title: Runtime Performance by Explore
    name: Runtime Performance by Explore
    model: looker_internal
    explore: history
    type: table
    fields:
    - history.average_runtime
    - query.view
    - history.query_run_count
    - history.source
    pivots:
    - history.source
    filters:
      history.source: Scheduled Task,Renderer,Dashboard,Explore,Saved Look
    sorts:
    - history.query_run_count desc 0
    - history.source
    limit: 200
    column_limit: 50
    dynamic_fields:
    - table_calculation: total_queries
      label: Total Queries
      expression: |-
        sum(
          pivot_row(${history.query_run_count})
        )
      value_format:
      value_format_name: decimal_0
      _kind_hint: supermeasure
      _type_hint: number
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_ignored_fields:
    - total_queries
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
    conditional_formatting:
    - type: greater than
      value: 60
      background_color: "#ed2418"
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
        __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
        __LINE_NUM: 408
      bold: false
      italic: false
      strikethrough: false
      __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
      __LINE_NUM: 403
    - type: greater than
      value: 30
      background_color: "#ede713"
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
        __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
        __LINE_NUM: 421
      bold: false
      italic: false
      strikethrough: false
      __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
      __LINE_NUM: 416
    - type: greater than
      value: 0
      background_color: "#23c23c"
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
        __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
        __LINE_NUM: 434
      bold: false
      italic: false
      strikethrough: false
      __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
      __LINE_NUM: 429
    hidden_fields:
    - history.query_run_count
    listen:
      Date: history.created_date
      Model: query.model
    row: 37
    col: 0
    width: 13
    height: 12
  - title: Queries returning over / under 30 seconds
    name: Queries returning over / under 30 seconds
    model: looker_internal
    explore: history
    type: looker_column
    fields:
    - history.query_run_count
    - history.runtime_tiers
    - history.created_date
    pivots:
    - history.runtime_tiers
    fill_fields:
    - history.created_date
    filters:
      history.runtime_tiers: "-Below 0,-Undefined"
      query.view: ''
    sorts:
    - history.created_date
    - history.runtime_tiers 0
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
    x_axis_scale: auto
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
      maxValue: 1
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
        __FILE: custom_i_looker/2b_explore_performance.dashboard.lookml
        __LINE_NUM: 559
      - id: queries_over_30_seconds
        name: Queries over 30 seconds
        __FILE: custom_i_looker/2b_explore_performance.dashboard.lookml
        __LINE_NUM: 561
      - id: percentage_of_queries_returning_under_30_seconds
        name: Percentage of Queries returning under 30 seconds
        __FILE: custom_i_looker/2b_explore_performance.dashboard.lookml
        __LINE_NUM: 563
      __FILE: custom_i_looker/2b_explore_performance.dashboard.lookml
      __LINE_NUM: 547
    column_spacing_ratio:
    x_axis_datetime_tick_count: 30
    listen:
      Date: history.created_date
      Model: query.model
    row: 19
    col: 0
    width: 24
    height: 8
  - title: Runtime by Source
    name: Runtime by Source
    model: looker_internal
    explore: history
    type: looker_pie
    fields:
    - history.query_run_count
    - history.average_runtime
    - history.source
    filters:
      history.source: Dashboard,Explore,Scheduled Task,Saved Look
      query.view: ''
    sorts:
    - history.query_run_count desc
    limit: 100
    column_limit: 50
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
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
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    - history.real_dash_id
    - history.query_run_count
    series_types: {}
    y_axes:
    - label:
      maxValue:
      minValue:
      orientation: top
      showLabels: true
      showValues: true
      tickDensity: custom
      tickDensityCustom: '4'
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: history.query_run_count
        name: Total Query Run Count
        __FILE: custom_i_looker/2b_explore_performance.dashboard.lookml
        __LINE_NUM: 166
      __FILE: custom_i_looker/2b_explore_performance.dashboard.lookml
      __LINE_NUM: 154
    - label: ''
      maxValue:
      minValue:
      orientation: bottom
      showLabels: true
      showValues: true
      tickDensity: custom
      tickDensityCustom: 3
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: history.average_runtime
        name: Average Runtime
        __FILE: custom_i_looker/2b_explore_performance.dashboard.lookml
        __LINE_NUM: 180
      __FILE: custom_i_looker/2b_explore_performance.dashboard.lookml
      __LINE_NUM: 168
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
      Date: history.created_date
      Model: query.model
    row: 2
    col: 0
    width: 9
    height: 7
  - title: Query Count by Source
    name: Query Count by Source
    model: looker_internal
    explore: history
    type: looker_bar
    fields:
    - history.query_run_count
    - history.average_runtime
    - history.source
    filters:
      history.source: Dashboard,Explore,Scheduled Task,Saved Look
      query.view: ''
    sorts:
    - history.query_run_count desc
    limit: 100
    column_limit: 50
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
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    - history.real_dash_id
    - history.average_runtime
    series_types: {}
    y_axes:
    - label:
      maxValue:
      minValue:
      orientation: top
      showLabels: true
      showValues: true
      tickDensity: custom
      tickDensityCustom: '4'
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: history.query_run_count
        name: Total Query Run Count
        __FILE: custom_i_looker/2b_explore_performance.dashboard.lookml
        __LINE_NUM: 166
        axisId: history.query_run_count
      __FILE: custom_i_looker/2b_explore_performance.dashboard.lookml
      __LINE_NUM: 154
    - label: ''
      maxValue:
      minValue:
      orientation: bottom
      showLabels: true
      showValues: true
      tickDensity: custom
      tickDensityCustom: 3
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: history.average_runtime
        name: Average Runtime
        __FILE: custom_i_looker/2b_explore_performance.dashboard.lookml
        __LINE_NUM: 180
        axisId: history.average_runtime
      __FILE: custom_i_looker/2b_explore_performance.dashboard.lookml
      __LINE_NUM: 168
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
      Date: history.created_date
      Model: query.model
    row: 2
    col: 9
    width: 15
    height: 7
  - title: Avg Runtime by Source
    name: Avg Runtime by Source
    model: looker_internal
    explore: history
    type: looker_line
    fields:
    - history.average_runtime
    - history.source
    - history.created_date
    pivots:
    - history.source
    fill_fields:
    - history.created_date
    filters:
      history.source: Dashboard,Explore,Scheduled Task,Saved Look
    sorts:
    - history.source 0
    - history.created_date desc
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
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
    show_null_points: false
    point_style: circle
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    series_types: {}
    hidden_series:
    - Dashboard - History Total Query Run Count
    - Explore - History Total Query Run Count
    - Saved Look - History Total Query Run Count
    - Scheduled Task - History Total Query Run Count
    y_axes:
    - label: Average Runtime
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: log
      unpinAxis: false
      valueFormat:
      series:
      - id: Dashboard - History Average Runtime
        name: Dashboard - History Average Runtime
        __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
        __LINE_NUM: 165
        axisId: history.average_runtime
      - id: Explore - History Average Runtime
        name: Explore - History Average Runtime
        __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
        __LINE_NUM: 167
        axisId: history.average_runtime
      - id: Saved Look - History Average Runtime
        name: Saved Look - History Average Runtime
        __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
        __LINE_NUM: 169
        axisId: history.average_runtime
      - id: Scheduled Task - History Average Runtime
        name: Scheduled Task - History Average Runtime
        __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
        __LINE_NUM: 171
        axisId: history.average_runtime
      __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
      __LINE_NUM: 153
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: log
      unpinAxis: false
      valueFormat:
      series:
      - id: Dashboard - History Total Query Run Count
        name: Dashboard - History Total Query Run Count
        __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
        __LINE_NUM: 185
      - id: Explore - History Total Query Run Count
        name: Explore - History Total Query Run Count
        __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
        __LINE_NUM: 187
      - id: Saved Look - History Total Query Run Count
        name: Saved Look - History Total Query Run Count
        __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
        __LINE_NUM: 189
      - id: Scheduled Task - History Total Query Run Count
        name: Scheduled Task - History Total Query Run Count
        __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
        __LINE_NUM: 191
      __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
      __LINE_NUM: 173
    reference_lines:
    - reference_type: range
      line_value: mean
      range_start: '0'
      range_end: '30'
      margin_top: deviation
      margin_value: mean
      margin_bottom: deviation
      label_position: left
      color: "#0ef01a"
      value_format: "#0"
      __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
      __LINE_NUM: 194
    - reference_type: range
      line_value: mean
      range_start: '30'
      range_end: '60'
      margin_top: deviation
      margin_value: mean
      margin_bottom: deviation
      label_position: left
      color: "#f0f80a"
      value_format: "#"
      __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
      __LINE_NUM: 204
    - reference_type: range
      line_value: mean
      range_start: '60'
      range_end: '90'
      margin_top: deviation
      margin_value: mean
      margin_bottom: deviation
      label_position: left
      color: "#f02b2b"
      label: ''
      value_format: "#,##0"
      __FILE: custom_i_looker/2_performance_overview.dashboard.lookml
      __LINE_NUM: 214
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
      Date: history.created_date
      Model: query.model
    row: 9
    col: 9
    width: 15
    height: 8
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 30 days
    model: looker_internal
    explore: history
    field: history.created_date
    listens_to_filters: []
    allow_multiple_values: true
    required: false
  - name: Model
    title: Model
    type: field_filter
    default_value: ''
    model: looker_internal
    explore: history
    field: query.model
    listens_to_filters: []
    allow_multiple_values: true
    required: false
