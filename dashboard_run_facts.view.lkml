view: dashboard_run_history_facts {
  derived_table: {
    #persist_for: 2 hours
    sql: SELECT
        dashboard_session as dashboard_run_session_id
        ,dashboard_id
        ,MIN(created_at) as first_history_created_at
        ,MAX(created_at) as last_history_created_at
        ,MAX(runtime) as longest_runtime
        ,COUNT(*) as num_all_tiles
        ,COUNT(CASE WHEN result_source = 'cache'       THEN 1 END) as num_cache_tiles
        ,COUNT(CASE WHEN result_source = 'stale_cache' THEN 1 END) as num_stale_cache_tiles
        ,COUNT(CASE WHEN result_source = 'query'       THEN 1 END) as num_query_tiles
        ,COUNT(CASE WHEN result_source IS NULL AND status = 'killed' THEN 1 END) as num_killed_tiles
        ,COUNT(CASE WHEN result_source IS NULL AND status = 'error'  THEN 1 END) as num_error_tiles
      FROM history
      WHERE dashboard_session IS NOT NULL
      GROUP BY 1,2
       ;;
  }

  dimension: dashboard_id {
    label: "_Dashboard ID"
    description: "Includes LookML and UDD"
    type: string
    sql: {% if _dialect._name == 'hypersql' %}
        CONVERT(${TABLE}.dashboard_id, SQL_VARCHAR)
      {% else %}
        CAST(${TABLE}.dashboard_id AS CHAR(256))
      {% endif %}
       ;;

      link: {
        label: "View Dashboard"
        url: "/dashboards/{{ value }}"
        icon_url: "http://www.looker.com/favicon.ico"
      }

      link: {
        label: "Go to Dashboard Performance Lookup"
        url: "/dashboards/1142?Dashboard={{ value }}"
        icon_url: "http://www.looker.com/favicon.ico"
      }
    }

    dimension: dashboard_run_session_id {}

    dimension_group: first_history_created_at {
      type: time
    }

    dimension: seconds_between_first_and_last_history_created_at {
      type: number
      sql: ${TABLE}.last_history_created_at - ${TABLE}.first_history_created_at ;;
    }

    dimension: num_all_tiles {
      type: number
    }

    dimension: num_cache_tiles {
      type: number
    }

    dimension: num_stale_cache_tiles {
      type: number
    }

    dimension: num_query_tiles {
      type: number
    }

    dimension: num_killed_tiles {
      type: number
    }

    dimension: num_error_tiles {
      type: number
    }

    dimension: has_incomplete_tiles {
      type: yesno
      sql: ${num_killed_tiles} > 0 OR ${num_error_tiles} > 0 ;;
    }

    dimension: is_all_cache {
      type: yesno
      sql: ${num_cache_tiles} = ${num_all_tiles} ;;
    }

    dimension: is_all_query {
      type: yesno
      sql: ${num_query_tiles} = ${num_all_tiles} ;;
    }

    dimension: percent_tiles_cached {
      type: number
      sql: 100.0 * ${num_cache_tiles} / ${num_all_tiles} ;;
    }

    measure: count_runs {
      type: count_distinct
      sql: ${dashboard_run_session_id} ;;
    }

    measure: count_incomplete {
      type: count_distinct
      sql: ${dashboard_run_session_id} ;;

      filters: {
        field: has_incomplete_tiles
        value: "yes"
      }
    }

    measure: count_all_cache {
      type: count_distinct
      sql: ${dashboard_run_session_id} ;;

      filters: {
        field: is_all_cache
        value: "yes"
      }
    }

    measure: count_all_query {
      type: count_distinct
      sql: ${dashboard_run_session_id} ;;

      filters: {
        field: is_all_query
        value: "yes"
      }
    }
  }
