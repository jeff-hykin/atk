require_relative './installer_api'

if OS.mac?
    # check settings
    data = {}
    begin
        # TODO: abstract this out into an API
        data = yamlOpen(Dir.home+'/info.yaml')
    rescue => exception
        
    end
    
    if data && data["settings"] && data["settings"]["global_commands"]
        puts "You've already got things saved in settings"
    else
        # setup the colon command
        # TODO: create a standard way of doing this
        `touch ~/.bash_profile`
        `echo "alias ::='project '" >> ~/.bash_profile`
        # record the setup in info.yaml
        data ||= {}
        data["settings"] ||= {}
        data["settings"]["global_commands"] ||= {}
        data["settings"]["global_commands"]["::"] = true
        # TODO: abstract this out into an API
        File.write(Dir.home+'/info.yaml', data.to_yaml)
    end
end