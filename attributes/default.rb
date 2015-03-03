#default['rpi_base']['packages'] = %w(less ant git tomcat7 htop vim mc curl zip unzip ncdu telnet)

default['devops_jenkins'].tap do |it|

  it['master']['jdk_version']            = '7'
  it['master']['jdk_type']               = 'openjdk'
  it['master']['capabilities']           = %w(git)
  it['master']['jenkins_install_method'] = 'war'
  it['master']['jenkins_version']        = '1.557'
  it['master']['plugins']                = {
    'git' => '2.3.4',
    'greenballs' => '1.14',
    'swarm' => '1.22',
    'xunit' => '1.94',
    'copyartifact' => '1.35',
    'build-pipeline-plugin' => '1.4.5',
    'scm-sync-configuration' => '0.0.8',
    'deploy' => '1.10',
    'ws-cleanup' => '0.25',
    'doclinks' => '0.6',
    'violations' => '0.7.11',
    'join' => '1.15'
  }
  it['master']['scm_sync']['plugin_url']  = 'https://github.com/hybris/scm-sync-configuration-plugin/releases/download/scm-sync-configuration-0.0.8.2hybris/scm-sync-configuration-0.0.8.2hybris.hpi'
  it['master']['scm_sync']['user']  = 'Stash readonly'
  it['master']['scm_sync']['email'] = 'beegees1@hybris.com'
  it['master']['scm_sync']['repo']  = 'https://github.com/krzysztofkaluzny/test'
end
