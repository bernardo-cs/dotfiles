@files = ["Rprofile", "bash_aliases", "rspec", "tmux.conf", "vimrc", "zshrc"]
task :install do
  @files.each do |file|
    `ln -nfs #{file} ~/.#{file}`
  end
end
