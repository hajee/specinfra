class Specinfra::Command::Linux::Base::Selinux < Specinfra::Command::Base::Selinux
  def check_mode(mode)
    cmd =  ""
    cmd += "test ! -f /etc/selinux/config || (" if mode == "disabled"
    cmd += "getenforce | grep -i -- #{escape(mode)} "
    cmd += "&& grep -i -- ^SELINUX=#{escape(mode)}$ /etc/selinux/config"
    cmd += ")" if mode == "disabled"
    cmd
  end
end