@files = ["Rprofile", "bash_aliases", "rspec", "tmux.conf", "vimrc", "zshrc"]
task :install do
  @files.each do |file|
    puts `ln -nfs #{File.dirname(__FILE__) + '/'  + file} ~/.#{file}`
  end
end
