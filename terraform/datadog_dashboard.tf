resource "datadog_monitor" "CPU_Load" {
  include_tags        = false
  require_full_window = false
  monitor_thresholds {
    critical = 5
    warning  = 1
  }

  name    = "CPU Load"
  type    = "process alert"
  query   = <<EOT
processes('').over('command:agent').rollup('count').last('5m') > 5
EOT
  message = <<EOT
{{#is_alert}}
  1. CPU load is very high on {{host.name}}
{{/is_alert}}
EOT
}
