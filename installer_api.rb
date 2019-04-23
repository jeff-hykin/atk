require 'safe_yaml'


# 
# info.yaml tools
# 
    # project info (specific to operating sytem)
    # setting/getting values via an object (instead of opening/closing a file)

    def yamlOpen(filename)
        the_file          = File.open("./info.yaml")
        file_content_copy = the_file.read
        the_file.close
        return YAML.load(file_content_copy, :safe => true)
    end

# 
# OS
# 
module OS
    #
    # TODO: create an official heirarchy/listing of versions
    #
        # create a method on each for
            # setting aliases (save them to info.yaml)
            # setting environment variables
    def OS.windows?
        (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    end

    def OS.mac?
        (/darwin/ =~ RUBY_PLATFORM) != nil
    end

    def OS.linux?
        !(OS.windows?) and not OS.mac?
    end
    
    def OS.hasHomebrew?
        return `which brew` != ""
    end
end