# Set up the broker
class pulp::broker {

  $broker_service = 'rabbitmq-server'

  if $pulp::manage_broker {
    include ::rabbitmq
  }

  Class['pulp::service']

  Service <| title == $broker_service |> -> Class['pulp::service']
  Service <| title == $broker_service |> -> Exec['migrate_pulp_db']
}
