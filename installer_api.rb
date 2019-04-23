require 'safe_yaml'


def yamlOpen(filename)
    the_file          = File.open("./info.yaml")
    file_content_copy = the_file.read
    the_file.close
    return YAML.load(file_content_copy, :safe => true)
end



module OS
    def OS.windows?
        (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    end

    def OS.mac?
        (/darwin/ =~ RUBY_PLATFORM) != nil
    end

    def OS.hasHomebrew?
        return `which brew` != ""
    end

    def OS.linux?
        OS.unix? and not OS.mac?
    end
end