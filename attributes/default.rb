case platform
when "debian","ubuntu"
	default[:mono][:prefix]	=	"/usr/local"
	default[:mono][:branch]	=	"master"
end
