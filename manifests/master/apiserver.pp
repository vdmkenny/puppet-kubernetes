# == Class: kubernetes::master::apiserver
# http://kubernetes.io/docs/admin/kube-apiserver/
#
# [*ensure*]
#   Whether you want the apiserver daemon to start up
#   Defaults to running
#
# [*journald_forward_enable*]
#   Fix for SIGPIPE sent to registry daemon during journald restart
#   Defaults to false
#
# [*enable*]
#   Whether you want the apiserver daemon to start up at boot
#   Defaults to true
#
## Parameters ##
#
# [*admission_control*]
#   Ordered list of plug-ins to do admission control of resources into cluster.
#   Comma-delimited list of: LimitRanger, AlwaysAdmit, ServiceAccount, ResourceQuota,
#   NamespaceExists, NamespaceAutoProvision, DenyExecOnPrivileged, AlwaysDeny, SecurityContextDeny, NamespaceLifecycle
#   Defaults to AlwaysAdmit
#
# [*admission_control_config_file*]
#   File with admission control configuration.
#   Defaults to undef
#
# [*advertise_address*]
#   The IP address on which to advertise the apiserver to members of the cluster.
#    This address must be reachable by the rest of the cluster. If blank, the --bind-address
#    will be used. If --bind-address is unspecified, the host's default interface will be used.
#   Defaults to undef
#
# [*allow_privileged*]
#   If true, allow privileged containers.
#   Defaults to false.
#
# [*apiserver_count*]
#   The number of apiservers running in the cluster
#   Defaults to 1.
#
# [*authorization_mode*]
#   Ordered list of plug-ins to do authorization on secure port. Comma-delimited list of: AlwaysAllow,AlwaysDeny,ABAC
#   Default AlwaysAllow.
#
# [*authorization_policy_file*]
#   File with authorization policy in csv format, used with --authorization-mode=ABAC, on the secure port.
#   Default undef.
#
# [*authorization_webhook_config*]
#   File with webhook configuration in kubeconfig format, used with --authorization-mode=Webhook. The API server will query
#   the remote service to determine access on the API server's secure port.
#   Default undef
#
# [*basic_auth_file*]
#   If set, the file that will be used to admit requests to the secure port of the API server via http basic authentication.
#   Deafaul undef
#
# [*bind_address*]
#   The IP address on which to serve the --read-only-port and --secure-port ports.
#    The associated interface(s) must be reachable by the rest of the cluster, and
#    by CLI/web clients. If blank, all interfaces will be used (0.0.0.0).
#   Deafaul 0.0.0.0
#
# [*cert_dir*]
#   The directory where the TLS certs are located (by default /var/run/kubernetes).
#    If --tls-cert-file and --tls-private-key-file are provided, this flag will be ignored.
#   Default /var/run/kubernetes
#
# [*client_ca_file*]
#   If set, any request presenting a client certificate signed by one of the authorities
#    in the client-ca-file is authenticated with an identity corresponding to the CommonName of the client certificate.
#   Default undef
#
# [*delete_collection_workers*]
#   Number of workers spawned for DeleteCollection call. These are used to speed up namespace cleanup.
#   Default 1
#
# [*etcd_cafile*]
#   List of ca certificates
#   Default undef
#
# [*etcd_certfile*]
#   Public key to connect to etcd servers
#   Default undef
#
# [*etcd_keyfile*]
#   Private key to connect to etcd servers
#   Default undef
#
# [*etcd_prefix*]
#   The prefix for all resource paths in etcd.
#   Default /registry
#
# [*etcd_quorum_read*]
#   If true, enable quorum read
#   Default false
#
# [*etcd_servers*]
#   List of etcd servers to watch (http://ip:port), comma separated.
#   Default http://127.0.0.1:2379
#
# [*etcd_servers_overrides*]
#   Per-resource etcd servers overrides, comma separated.
#    The individual override format: group/resource#servers,
#    where servers are http://ip:port, semicolon separated.
#   Default []
#
# [*event_ttl*]
#   Amount of time to retain events. Default 1 hour.
#   Default 1h0m0s
#
# [*external_hostname*]
#   The hostname to use when generating externalized URLs for this master (e.g. Swagger API Docs.)
#   Default undef
#
# [*google_json_key*]
#   The Google Cloud Platform Service Account JSON Key to use for authentication.
#   Default undef
#
# [*insecure_bind_address*]
#   The IP address on which to serve the --insecure-port (set to 0.0.0.0 for all interfaces). Defaults to localhost.
#   Default 127.0.0.1
#
# [*insecure_port*]
#   The port on which to serve unsecured, unauthenticated access. Default 8080.
#     It is assumed that firewall rules are set up such that this port is not
#     reachable from outside of the cluster and that port 443 on the cluster's
#     public address is proxied to this port. This is performed by nginx in the default setup.
#   Default 8080
#
# [*kubelet_certificate_authority*]
#   Path to a cert. file for the certificate authority.
#   Default undef
#
# [*kubelet_client_certificate*]
#   Path to a client cert file for TLS.
#   Default undef
#
# [*kubelet_client_key*]
#   Path to a client key file for TLS.
#   Default undef
#
# [*kubelet_https*]
#   Use https for kubelet connections
#   Default true
#
# [*kubelet_timeout*]
#   Timeout for kubelet operations
#   Default 5s
#
# [*kubernetes_service_node_port*]
#   If non-zero, the Kubernetes master service (which apiserver creates/maintains) will be of type NodePort, using this as
#   the value of the port. If zero, the Kubernetes master service will be of type ClusterIP.
#   Default 0
#
# [*log_flush_frequency*]
#   Maximum number of seconds between log flushes
#   Default 5s
#
# [*long_running_request_regexp*]
#   A regular expression matching long running requests which should be excluded from maximum inflight request handling.
#      Default to "(/|^)((watch|proxy)(/|$)|(logs?|portforward|exec|attach)/?$)"
#   Default undef
#
# [*master_service_namespace*]
#   The namespace from which the kubernetes master services should be injected into pods
#   Default "default"
#
# [*max_connection_bytes_per_sec*]
#   If non-zero, throttle each user connection to this number of bytes/sec.  Currently only
#      applies to long-running requests
#   Default 0
#
# [*max_requests_inflight*]
#   The maximum number of requests in flight at a given time.  When the server exceeds this, it
#      rejects requests.  Zero for no limit.
#   Default 400
#
# [*min_request_timeout*]
#   An optional field indicating the minimum number of seconds a handler must keep a request open
#      before timing it out. Currently only honored by the watch request handler, which picks a randomized value above this number
#      as the connection timeout, to spread out load.
#   Default 1800
#
# [*profiling*]
#   Enable profiling via web interface host:port/debug/pprof/
#   Default true
#
# [*repair_malformed_updates*]
#   If true, server will do its best to fix the update request to pass the validation, e.g., setting empty UID in update request
#   to its existing value. This flag can be turned off after we fix all the clients that send malformed updates.
#   Default true
#
# [*runtime_config*]
#   A set of key=value pairs that describe runtime configuration that may be passed to apiserver.
#      apis/<groupVersion> key can be used to turn on/off specific api versions. apis/<groupVersion>/<resource> can be used to turn
#      on/off specific resources. api/all and api/legacy are special keys to control all and legacy api versions respectively.
#   Default undef
#
# [*secure_port*]
#   The port on which to serve HTTPS with authentication and authorization. If 0, don't serve HTTPS at all.
#   Default 6443
#
# [*service_account_key_file*]
#   File containing PEM-encoded x509 RSA private or public key, used to verify ServiceAccount
#      tokens. If unspecified, --tls-private-key-file is used.
#   Default undef
#
# [*service_account_lookup*]
#   If true, validate ServiceAccount tokens exist in etcd as part of authentication.
#   Default false
#
# [*service_cluster_ip_range*]
#   A CIDR notation IP range from which to assign service cluster IPs. This must not overlap
#      with any IP ranges assigned to nodes for pods.
#   Default undef
#
# [*service_node_port_range*]
#   A port range to reserve for services with NodePort visibility.  Example: '30000-32767'.
#      Inclusive at both ends of the range.
#   Default undef
#
# [*ssh_keyfile*]
#   If non-empty, use secure SSH proxy to the nodes, using this user keyfile
#   Default undef
#
# [*ssh_user*]
#   If non-empty, use secure SSH proxy to the nodes, using this user name
#   Default undef
#
# [*tls_cert_file*]
#   File containing x509 Certificate for HTTPS.  (CA cert, if any, concatenated after server cert). If HTTPS
#      serving is enabled, and --tls-cert-file and --tls-private-key-file are not provided, a self-signed certificate and key are
#      generated for the public address and saved to /var/run/kubernetes.
#   Default undef
#
# [*tls_private_key_file*]
#   File containing x509 private key matching --tls-cert-file.
#   Default undef
#
# [*token_auth_file*]
#   If set, the file that will be used to secure the secure port of the API server via token authentication.
#   Default undef
#
# [*watch_cache*]
#   Enable watch caching in the apiserver
#   Default true
#
# [*watch_cache_sizes*]
#   List of watch cache sizes for every resource (pods, nodes, etc.), comma separated. The individual override format: resource#size,
#   where size is a number. It takes effect when watch-cache is enabled.
#   Default undef
#
class kubernetes::master::apiserver (
  $service_cluster_ip_range,
  $ensure                        = $kubernetes::master::params::kube_api_service_ensure,
  $journald_forward_enable       = $kubernetes::master::params::kube_api_journald_forward_enable,
  $enable                        = $kubernetes::master::params::kube_api_service_enable,
  $admission_control             = $kubernetes::master::params::kube_api_admission_control,
  $admission_control_config_file = $kubernetes::master::params::kube_api_admission_control_config_file,
  $advertise_address             = $kubernetes::master::params::kube_api_advertise_address,
  $allow_privileged              = $kubernetes::master::params::kube_api_allow_privileged,
  $apiserver_count               = $kubernetes::master::params::kube_api_server_count,
  $authorization_mode            = $kubernetes::master::params::kube_api_authorization_mode,
  $authorization_policy_file     = $kubernetes::master::params::kube_api_authorization_policy_file,
  $authorization_webhook_config  = $kubernetes::master::params::kube_api_authorization_webhook_config,
  $basic_auth_file               = $kubernetes::master::params::kube_api_basic_auth_file,
  $bind_address                  = $kubernetes::master::params::kube_api_bind_address,
  $cert_dir                      = $kubernetes::master::params::kube_api_cert_dir,
  $client_ca_file                = $kubernetes::master::params::kube_api_client_ca_file,
  $delete_collection_workers     = $kubernetes::master::params::kube_api_delete_collection_workers,
  $etcd_cafile                   = $kubernetes::master::params::kube_api_etcd_cafile,
  $etcd_certfile                 = $kubernetes::master::params::kube_api_etcd_certfile,
  $etcd_keyfile                  = $kubernetes::master::params::kube_api_etcd_keyfile,
  $etcd_prefix                   = $kubernetes::master::params::kube_api_etcd_prefix,
  $etcd_quorum_read              = $kubernetes::master::params::kube_api_etcd_quorum_read,
  $etcd_servers                  = $kubernetes::master::params::kube_api_etcd_servers,
  $etcd_servers_overrides        = $kubernetes::master::params::kube_api_etcd_servers_overrides,
  $event_ttl                     = $kubernetes::master::params::kube_api_event_ttl,
  $external_hostname             = $kubernetes::master::params::kube_api_external_hostname,
  $google_json_key               = $kubernetes::master::params::kube_api_google_json_key,
  $insecure_bind_address         = $kubernetes::master::params::kube_api_insecure_bind_address,
  $insecure_port                 = $kubernetes::master::params::kube_api_insecure_port,
  $kubelet_certificate_authority = $kubernetes::master::params::kube_api_kubelet_certificate_authority,
  $kubelet_client_certificate    = $kubernetes::master::params::kube_api_kubelet_client_certificate,
  $kubelet_client_key            = $kubernetes::master::params::kube_api_kubelet_client_key,
  $kubelet_https                 = $kubernetes::master::params::kube_api_kubelet_https,
  $kubelet_timeout               = $kubernetes::master::params::kube_api_kubelet_timeout,
  $kubernetes_service_node_port  = $kubernetes::master::params::kube_api_kubernetes_service_node_port,
  $log_flush_frequency           = $kubernetes::master::params::kube_api_log_flush_frequency,
  $long_running_request_regexp   = $kubernetes::master::params::kube_api_long_running_request_regexp,
  $master_service_namespace      = $kubernetes::master::params::kube_api_master_service_namespace,
  $max_connection_bytes_per_sec  = $kubernetes::master::params::kube_api_max_connection_bytes_per_sec,
  $max_requests_inflight         = $kubernetes::master::params::kube_api_max_requests_inflight,
  $min_request_timeout           = $kubernetes::master::params::kube_api_min_request_timeout,
  $profiling                     = $kubernetes::master::params::kube_api_profiling,
  $repair_malformed_updates      = $kubernetes::master::params::kube_api_repair_malformed_updates,
  $runtime_config                = $kubernetes::master::params::kube_api_runtime_config,
  $secure_port                   = $kubernetes::master::params::kube_api_secure_port,
  $service_account_key_file      = $kubernetes::master::params::kube_api_service_account_key_file,
  $service_account_lookup        = $kubernetes::master::params::kube_api_service_account_lookup,
  $service_node_port_range       = $kubernetes::master::params::kube_api_service_node_port_range,
  $ssh_keyfile                   = $kubernetes::master::params::kube_api_ssh_keyfile,
  $ssh_user                      = $kubernetes::master::params::kube_api_ssh_user,
  $tls_cert_file                 = $kubernetes::master::params::kube_api_tls_cert_file,
  $tls_private_key_file          = $kubernetes::master::params::kube_api_tls_private_key_file,
  $token_auth_file               = $kubernetes::master::params::kube_api_token_auth_file,
  $watch_cache                   = $kubernetes::master::params::kube_api_watch_cache,
  $watch_cache_sizes             = $kubernetes::master::params::kube_api_watch_cache_sizes,
  $verbosity                     = $kubernetes::master::params::kube_api_verbosity,
  $extra_args                    = $kubernetes::master::params::kube_api_extra_args,
) inherits kubernetes::master::params {
  validate_re($ensure, '^(running|stopped)$')
  validate_bool($enable)

  include ::kubernetes::master

  if $journald_forward_enable and $::operatingsystemmajrelease == 7 {
    file { '/etc/systemd/system/kube-apiserver.service.d':
      ensure => 'directory',
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
    }
    file { '/etc/systemd/system/kube-apiserver.service.d/journald.conf':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template("${module_name}/systemd/apiserver_journald.conf.erb"),
    } ~>
    exec { 'reload systemctl daemon for kube-apiserver':
      command     => '/bin/systemctl daemon-reload',
      refreshonly => true,
    } ~> Service['kube-apiserver']
  }

  case $::osfamily {
    'redhat' : {
    }
    'debian' : {
      file { '/etc/default/kube-apiserver':
        ensure  => 'file',
        force   => true,
        content => template("${module_name}/etc/default/api-server.erb"),
      } ~> Service['kube-apiserver']
    }
    default  : {
      fail("Unsupport OS: ${::osfamily}")
    }
  }

  file { '/etc/kubernetes/apiserver':
    ensure  => 'file',
    force   => true,
    content => template("${module_name}/etc/kubernetes/apiserver.erb"),
  } ~> Service['kube-apiserver']

  service { 'kube-apiserver':
    ensure => $ensure,
    enable => $enable,
  }
}
