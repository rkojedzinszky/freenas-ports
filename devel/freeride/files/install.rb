require 'rbconfig'
require 'find'
require 'ftools'

Dir.chdir ".." if Dir.pwd =~ /bin.?$/

include Config

FREERIDE = "freeride"
$srcdir = CONFIG["srcdir"]
$version = CONFIG["MAJOR"]+"."+CONFIG["MINOR"]
$libdir = File.join(CONFIG["libdir"], "ruby", $version)
$archdir = File.join($libdir, CONFIG["arch"])
$site_libdir = CONFIG["sitelibdir"]

$libdir = ["config", "plugins", "redist"]
$libdir_excl = [ /i[36]86-mswin32/ ]
$libdir_subst = [ [/i686-linux/, CONFIG["arch"] ] ]

class Array
  def contains?
	return false unless defined?( yield )
	each { |e| return true if yield( e ) }
	return false
  end

  def include_like?( pattern )
    return include?( pattern ) unless pattern.kind_of?( Regexp )
    return contains? { |v| ( v.kind_of?( String ) and (v =~ pattern) ) }
  end
end

class File
  def File.libdirPath( f )
    ofn = File.join($site_libdir, FREERIDE, f)
    $libdir_subst.each { |p, s| ofn.gsub!( p, s ) }
    ofn
  end
end

def install_rb(noharm = false, srcdir = nil)
  libdir = $libdir
  libdir_excl = $libdir_excl
  libdir.collect! { |ld|
    File.join(srcdir, ld)
  } if srcdir
  path = ["freeride.rb"]
  dir = [ "" ]
  libdir.each { |ld|
    Find.find(ld) do |f|
      next unless FileTest.file?(f)
      next if (f = f[ld.length+1..-1]) == nil
      next if (/CVS$/ =~ File.dirname(f))
      next if libdir_excl.contains? { |p| (f =~ p) }
      path.push File.join( ld, f )
      dir |= [File.join( ld, File.dirname(f) )]
    end
  }
  for f in dir
    next if f == "."
    next if f == "CVS"
    odn = File.libdirPath( f )
    if noharm then
      $stderr << "mkdir #{odn}\n"
    else
      File::makedirs( odn )
    end
  end
  for f in path
    ofn = File.libdirPath( f )
    if noharm then
      $stderr << "install #{f} #{ofn}\n"
    else
      File::install( f, ofn, 0644, true)
    end
    $stderr.flush
  end
end

no_harm = (ARGV.include_like?(/\A^-[a-zA-Z0-9]*n/) or ARGV.include?("--no-harm"))
$stderr << "No-harm install\n" if no_harm
$stderr.flush
install_rb( no_harm )

