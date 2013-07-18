cassandra_version = "1.2.3"

default[:cassandra] = {
  :cluster_name => "Test Cluster",
  :initial_token => "",
  :version => cassandra_version,
  :tarball => {
    :url => "http://www.eu.apache.org/dist/cassandra/#{cassandra_version}/apache-cassandra-#{cassandra_version}-bin.tar.gz",
    :md5 => "8e02796b43e4d09a763f15758210519b"
  },
  :user => "cassandra",
  :jvm  => {
    :xms => 32,
    :xmx => 512
  },
  :limits => {
    :memlock => 'unlimited',
    :nofile  => 48000
  },
  :installation_dir => "/usr/local/cassandra",
  :bin_dir          => "/usr/local/cassandra/bin",
  :lib_dir          => "/usr/local/cassandra/lib",
  :conf_dir         => "/etc/cassandra/",
  # commit log, data directory, saved caches and so on are all stored under the data root. MK.
  :data_root_dir    => "/var/lib/cassandra/",
  :commitlog_dir    => "/var/lib/cassandra/",
  :log_dir          => "/var/log/cassandra/",
  :listen_address   => node[:ipaddress],
  :rpc_address      => node[:ipaddress],
  :max_heap_size    => nil,
  :heap_new_size    => nil,
  :vnodes           => false,
  :seeds            => [],
  :concurrent_reads => 32,
  :concurrent_writes => 32,
  :snitch           => 'SimpleSnitch',
  :key_cache_size_in_mb => '',
  :row_cache_size_in_mb => 0,
  :rpc_server_type => 'sync',
  :multithreaded_compaction => false,
  :compaction_throughput_mb_per_sec => 16,
  :memtable_flush_writers => 1,
  :stream_throughput_outbound_megabits_per_sec => 400,
  :thrift_framed_transport_size_in_mb => 15,
  :thrift_max_message_length_in_mb => 16,
  :authenticator => "AllowAllAuthenticator",
  :topology => {
    :default => {
      :dc => "DC1",
      :rack => "r1"
    },
    :servers => [{
      :ip => "129.168.1.100",
      :dc => "DC1",
      :rack => "RAC1"
    }]
  }
}
