default['mono']['install_method'] = "packages"
default['mono']['repo'] = "git://github.com/mono/mono.git"
default['mono']['monolite-url'] = "http://storage.bos.xamarin.com/mono-dist-master/latest/monolite-111-latest.tar.gz"

if platform_family?('debian')
  default['mono']['prefix']	=	"/usr/local"
  default['mono']['branch']	=	"mono-3.2.8"
end

if platform_family?('rhel')
  default['mono']['yum_repository'] = "http://download.mono-project.com/repo/centos/"
  default['mono']['yum_repository_key'] = "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
end
