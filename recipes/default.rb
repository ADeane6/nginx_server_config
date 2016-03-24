include_recipe 'nginx_server::default'

nginx_server_vhost 'proxy' do
  server_name [
    'www.example.org',
    'example.org'
  ]
  listen [
    {
      'ipaddress' => '0.0.0.0',
      'port' => 80
    }
  ]
  config ({
    'location /' => {
      'proxy_pass' => 'http://127.0.0.1:8080'
    }
  })
end

nginx_server_upstream 'simple upstream' do
  upstream_name 'simple'
  servers [
    ['127.0.0.1:8080']
  ]
end