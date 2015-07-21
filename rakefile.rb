exclude_files = ['.','..','.DS_Store']

task :install do
  Dir.entries("to_be_aliased").each do |file|
     next if exclude_files.include? file
     system "ln -nfs #{File.dirname(__FILE__) + '/to_be_aliased/'  + file} ~/.#{file}"
  end
end
