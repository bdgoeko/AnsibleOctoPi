
https://github.com/bdgoeko/AnsibleOctoPi

My Ansible and scripts to setup my OctoPi machine with mjpg_streamer

I have to "playbooks", one for mjpeg-streamer and one for octoprint

# How I execute the playbooks
$ ansible-playbook -i hosts mjpg-streamer.yml -u pi -b -become-method=sudo

I am using Ansible verions, 
  
$ ansible --version
/usr/lib/python2.7/dist-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 2 is no longer supported by the Python core team. Support for it is now deprecated in cryptography, and will be removed in the next release.
  from cryptography.exceptions import InvalidSignature
ansible 2.5.1
  config file = /etc/ansible/ansible.cfg
  configured module search path = [u'/home/goeko/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python2.7/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 2.7.17 (default, Feb 27 2021, 15:10:58) [GCC 7.5.0]



