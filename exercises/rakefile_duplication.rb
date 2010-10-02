require 'rake/contrib/sshpublisher'

# Original
file '.published' => ['sparky.html', 'sparky.rb'] do
  Rake::SshFilePublisher.new('www.ruby-refactoring.com', '/var/www/tools', '.', 'sparky.html').upload
  Rake::SshFilePublisher.new('www.ruby-refactoring.com', '/usr/lib/cgi-bin', '.', 'sparky.rb').upload
  touch '.published'
end

desc "copy all files to the live deploy locations"
task :deploy => '.published'

# Refactored
PUBLISHED_MARKER = '.published'

PUBLICATIONS = {
  'sparky.html' => '/var/www/tools',
  'sparky.rb' => '/usr/lib/cgi-bin'
}

def ssh_upload(url, remote_dir, local_dir, file_name)
  Rake::SshFilePublisher.new(url, remote_dir, local_dir, file_name).upload
end

PUBLICATIONS.each do |src, dest|
  file PUBLISHED_MARKER => src { publish(src, dest) }
end

desc "copy all files to the live deploy locations"
task :deploy => PUBLISHED_MARKER
