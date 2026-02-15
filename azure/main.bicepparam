using 'main.bicep'

param dbAdminUsername = 'voteradmin'
param dbAdminPassword = 'Password12345!'
param serverName = 'voter-db-gio-${uniqueString('voter-db-gio')}'
