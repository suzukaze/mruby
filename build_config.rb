MRuby::Build.new do |conf|
  # load specific toolchain settings

  # Gets set by the VS command prompts.
  if ENV['VisualStudioVersion']
    toolchain :visualcpp
  else
    toolchain :gcc
  end

  # Use mrbgems
  # conf.gem 'examples/mrbgems/ruby_extension_example'
  # conf.gem 'examples/mrbgems/c_extension_example' do |g|
  #   g.cc.flags << '-g' # append cflags in this gem
  # end
  # conf.gem 'examples/mrbgems/c_and_ruby_extension_example'
  # conf.gem :github => 'masuidrive/mrbgems-example', :branch => 'master'
  # conf.gem :git => 'git@github.com:masuidrive/mrbgems-example.git', :branch => 'master', :options => '-v'
  conf.gem '/Users/hiroejun/work/mruby-minigame/fork/mruby-minigame'

  # include the default GEMs
  conf.gembox 'default'

  # C compiler settings
  # conf.cc do |cc|
  #   cc.command = ENV['CC'] || 'gcc'
  #   cc.flags = [ENV['CFLAGS'] || %w()]
  #   cc.include_paths = ["#{root}/include"]
  #   cc.defines = %w(DISABLE_GEMS)
  #   cc.option_include_path = '-I%s'
  #   cc.option_define = '-D%s'
  #   cc.compile_options = "%{flags} -MMD -o %{outfile} -c %{infile}"
  # end
  conf.cc.include_paths << '/usr/local/Cellar/allegro5/HEAD/include/'
  #linker.library_paths << '/usr/local/Cellar/allegro5/HEAD/lib/'
  #arregro5_libs = %w(liballegro.5.1.8.dylib liballegro_acodec.5.1.8.dylib liballegro_audio.5.1.8.dylib liballegro_color.5.1.8.dylib liballegro_dialog.5.1.8.dylib liballegro_font.5.1.8.dylib liballegro_image.5.1.8.dylib liballegro_main.5.1.8.dylib liballegro_memfile.5.1.8.dylib liballegro_primitives.5.1.8.dylib)
  #arregro5_libs = %w(liballegro.5.1.8.dylib liballegro_acodec.5.1.8.dylib liballegro_audio.5.1.8.dylib liballegro_color.5.1.8.dylib liballegro_dialog.5.1.8.dylib liballegro_font.5.1.8.dylib liballegro_image.5.1.8.dylib liballegro_main.5.1.8.dylib liballegro_memfile.5.1.8.dylib liballegro_primitives.5.1.8.dylib)
  arregro5_libs = %w(liballegro.dylib liballegro_acodec.dylib liballegro_audio.dylib liballegro_color.dylib liballegro_dialog.dylib liballegro_font.dylib liballegro_image.dylib liballegro_main.dylib liballegro_memfile.dylib liballegro_primitives.dylib)

  ALLEGRO5_LIB = '/usr/local/Cellar/allegro5/HEAD/lib'
  #ALLEGRO5_LIB = '/usr/local/lib'
  arregro5_libs.map! { |lib| "m #{ALLEGRO5_LIB}/#{lib}" }
  arregro5_libs.each do |name|
    puts name
  end

  conf.linker.libraries << arregro5_libs

  # mrbc settings
  # conf.mrbc do |mrbc|
  #   mrbc.compile_options = "-g -B%{funcname} -o-" # The -g option is required for line numbers
  # end

  # Linker settings
  # conf.linker do |linker|
  #   linker.command = ENV['LD'] || 'gcc'
  #   linker.flags = [ENV['LDFLAGS'] || []]
  #   linker.flags_before_libraries = []
  #   linker.libraries = %w()
  #   linker.flags_after_libraries = []
  #   linker.library_paths = []
  #   linker.option_library = '-l%s'
  #   linker.option_library_path = '-L%s'
  #   linker.link_options = "%{flags} -o %{outfile} %{objs} %{libs}"
  # end

  # Archiver settings
  # conf.archiver do |archiver|
  #   archiver.command = ENV['AR'] || 'ar'
  #   archiver.archive_options = 'rs %{outfile} %{objs}'
  # end

  # Parser generator settings
  # conf.yacc do |yacc|
  #   yacc.command = ENV['YACC'] || 'bison'
  #   yacc.compile_options = '-o %{outfile} %{infile}'
  # end

  # gperf settings
  # conf.gperf do |gperf|
  #   gperf.command = 'gperf'
  #   gperf.compile_options = '-L ANSI-C -C -p -j1 -i 1 -g -o -t -N mrb_reserved_word -k"1,3,$" %{infile} > %{outfile}'
  # end

  # file extensions
  # conf.exts do |exts|
  #   exts.object = '.o'
  #   exts.executable = '' # '.exe' if Windows
  #   exts.library = '.a'
  # end

  # file separetor
  # conf.file_separator = '/'
end

# Define cross build settings
# MRuby::CrossBuild.new('32bit') do |conf|
#   toolchain :gcc
#
#   conf.cc.flags << "-m32"
#   conf.linker.flags << "-m32"
#
#   conf.build_mrbtest_lib_only
#
#   conf.gem 'examples/mrbgems/c_and_ruby_extension_example'
#
#   conf.test_runner.command = 'env'
#
# end
