# Set up the broker
class pulp::broker {

  if $pulp::messaging_transport == 'qpid' {
    $broker_service = 'qpidd'
  } elsif $pulp::messaging_transport == 'rabbitmq' {
    $broker_service = 'rabbitmq-server'
  }

  Service <| title == $broker_service |> -> Class['pulp::service']
  Service <| title == $broker_service |> -> Exec['migrate_pulp_db']
}
