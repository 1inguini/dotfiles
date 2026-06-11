# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_pijul_global_optspecs
	string join \n config= no-prompt h/help V/version
end

function __fish_pijul_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_pijul_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_pijul_using_subcommand
	set -l cmd (__fish_pijul_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c pijul -n "__fish_pijul_needs_command" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_needs_command" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_needs_command" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_needs_command" -s V -l version -d 'Print version'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "init" -d 'Initializes an empty pijul repository'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "clone" -d 'Clones an existing pijul repository'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "record" -d 'Creates a new change'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "diff" -d 'Shows difference between two channels/changes'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "status" -d 'Shows a brief overview of changes'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "log" -d 'Show the entire log of changes'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "push" -d 'Pushes changes to a remote upstream'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "pull" -d 'Pulls changes from a remote upstream'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "change" -d 'Shows information about a particular change'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "dependents" -d 'Lists the transitive closure of the reverse dependency relation'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "channel" -d 'Manages different channels'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "protocol" -d 'This command is not meant to be run by the user, instead it is called over SSH'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "move" -d 'Moves a file in the working copy and the tree'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "list" -d 'Lists files tracked by pijul'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "add" -d 'Adds a path to the tree'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "remove" -d 'Removes a file from the tree of tracked files (`pijul record` will then record this as a deletion)'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "reset" -d 'Resets the working copy to the last recorded change'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "debug"
complete -c pijul -n "__fish_pijul_needs_command" -f -a "fork" -d 'Create a new channel'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "unrecord" -d 'Unrecords a list of changes'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "apply" -d 'Applies changes to a channel'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "remote" -d 'Manages remote repositories'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "archive" -d 'Creates an archive of the repository'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "credit" -d 'Shows which change last affected each line of the given file(s)'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "tag" -d 'Manage tags (create tags, check out a tag)'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "identity" -d 'A collection of tools for interactively managing the user\'s identities. This may be useful if you use Pijul in multiple contexts, for example both work & personal projects'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "client" -d 'Authenticates with a HTTP server'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "completion" -d 'Shell completion script generation'
complete -c pijul -n "__fish_pijul_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_pijul_using_subcommand init" -l channel -d 'Set the name of the current channel (defaults to "main")' -r
complete -c pijul -n "__fish_pijul_using_subcommand init" -s k -l kind -d 'Project kind; if Pijul knows about your project kind, the .ignore file will be populated with a conservative list of commonly ignored entries. Example: `pijul init --kind=rust`' -r
complete -c pijul -n "__fish_pijul_using_subcommand init" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand init" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand init" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand clone" -l channel -d 'Set the remote channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand clone" -l change -d 'Clone this change and its dependencies' -r
complete -c pijul -n "__fish_pijul_using_subcommand clone" -l state -d 'Clone this state' -r
complete -c pijul -n "__fish_pijul_using_subcommand clone" -l path -d 'Clone this path only' -r
complete -c pijul -n "__fish_pijul_using_subcommand clone" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand clone" -s k -d 'Do not check certificates (HTTPS remotes only, this option might be dangerous)'
complete -c pijul -n "__fish_pijul_using_subcommand clone" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand clone" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand record" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand record" -l channel -d 'Work with CHANNEL instead of the current channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand record" -s m -l message -d 'Set the change message' -r
complete -c pijul -n "__fish_pijul_using_subcommand record" -l description -d 'Set the description field' -r
complete -c pijul -n "__fish_pijul_using_subcommand record" -l author -d 'Set the author field' -r
complete -c pijul -n "__fish_pijul_using_subcommand record" -l timestamp -d 'Set the timestamp field' -r
complete -c pijul -n "__fish_pijul_using_subcommand record" -l working-copy -r
complete -c pijul -n "__fish_pijul_using_subcommand record" -l amend -d 'Amend this change instead of creating a new change' -r
complete -c pijul -n "__fish_pijul_using_subcommand record" -l identity -d 'Identity to sign changes with' -r
complete -c pijul -n "__fish_pijul_using_subcommand record" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand record" -s a -l all -d 'Record all paths that have changed'
complete -c pijul -n "__fish_pijul_using_subcommand record" -l ignore-missing -d 'Ignore missing (deleted) files'
complete -c pijul -n "__fish_pijul_using_subcommand record" -l patience -d 'Use Patience diff instead of the default Myers diff'
complete -c pijul -n "__fish_pijul_using_subcommand record" -l histogram -d 'Use Histogram diff algorithm instead of the default'
complete -c pijul -n "__fish_pijul_using_subcommand record" -l no-keyring -d 'Use Histogram diff algorithm instead of the default'
complete -c pijul -n "__fish_pijul_using_subcommand record" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand record" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand diff" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand diff" -l channel -d 'Work with CHANNEL instead of the current channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand diff" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand diff" -l json -d 'Output the diff in JSON format instead of the default change text format'
complete -c pijul -n "__fish_pijul_using_subcommand diff" -l tag -d 'Add all the changes of this channel as dependencies (except changes implied transitively), instead of the minimal dependencies'
complete -c pijul -n "__fish_pijul_using_subcommand diff" -s s -l short -d 'Show a short version of the diff'
complete -c pijul -n "__fish_pijul_using_subcommand diff" -s u -l untracked -d 'Include the untracked files'
complete -c pijul -n "__fish_pijul_using_subcommand diff" -l patience -d 'Use Patience diff instead of the default Myers diff'
complete -c pijul -n "__fish_pijul_using_subcommand diff" -l histogram -d 'Use Histogram diff algorithm instead of the default'
complete -c pijul -n "__fish_pijul_using_subcommand diff" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand diff" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand status" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand status" -l channel -d 'Work with CHANNEL instead of the current channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand status" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand status" -l tag -d 'Add all the changes of this channel as dependencies (except changes implied transitively), instead of the minimal dependencies'
complete -c pijul -n "__fish_pijul_using_subcommand status" -s u -l untracked -d 'Include the untracked files'
complete -c pijul -n "__fish_pijul_using_subcommand status" -s U -l only-untracked -d 'Show only untracked files'
complete -c pijul -n "__fish_pijul_using_subcommand status" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand status" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand log" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand log" -l channel -d 'Work with CHANNEL instead of the current channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand log" -l offset -d 'Start after this many changes' -r
complete -c pijul -n "__fish_pijul_using_subcommand log" -l limit -d 'Output at most this many changes' -r
complete -c pijul -n "__fish_pijul_using_subcommand log" -l output-format -r -f -a "plaintext\t''
json\t''"
complete -c pijul -n "__fish_pijul_using_subcommand log" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand log" -l hash-only -d 'Only show the change hashes'
complete -c pijul -n "__fish_pijul_using_subcommand log" -l state -d 'Include state identifiers in the output'
complete -c pijul -n "__fish_pijul_using_subcommand log" -l description -d 'Include full change description in the output'
complete -c pijul -n "__fish_pijul_using_subcommand log" -l files -d 'Include files changed in the output'
complete -c pijul -n "__fish_pijul_using_subcommand log" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand log" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand push" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand push" -l from-channel -d 'Push from this channel instead of the default channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand push" -l path -d 'Push changes only relating to these paths' -r -F
complete -c pijul -n "__fish_pijul_using_subcommand push" -l to-channel -d 'Push to this remote channel instead of the remote\'s default channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand push" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand push" -s a -l all -d 'Push all changes'
complete -c pijul -n "__fish_pijul_using_subcommand push" -s f -l force-cache -d 'Force an update of the local remote cache. May effect some reporting of unrecords/concurrent changes in the remote'
complete -c pijul -n "__fish_pijul_using_subcommand push" -s k -d 'Do not check certificates (HTTPS remotes only, this option might be dangerous)'
complete -c pijul -n "__fish_pijul_using_subcommand push" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand push" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand pull" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand pull" -l to-channel -d 'Pull into this channel instead of the current channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand pull" -l path -d 'Only pull to these paths' -r -F
complete -c pijul -n "__fish_pijul_using_subcommand pull" -l from-channel -d 'Pull from this remote channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand pull" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand pull" -s a -l all -d 'Pull all changes'
complete -c pijul -n "__fish_pijul_using_subcommand pull" -s f -l force-cache -d 'Force an update of the local remote cache. May effect some reporting of unrecords/concurrent changes in the remote'
complete -c pijul -n "__fish_pijul_using_subcommand pull" -s k -d 'Do not check certificates (HTTPS remotes only, this option might be dangerous)'
complete -c pijul -n "__fish_pijul_using_subcommand pull" -l full -d 'Download full changes, even when not necessary'
complete -c pijul -n "__fish_pijul_using_subcommand pull" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand pull" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand change" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand change" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand change" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand change" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand dependents" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand dependents" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand dependents" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand dependents" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and not __fish_seen_subcommand_from delete rename switch new help" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand channel; and not __fish_seen_subcommand_from delete rename switch new help" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand channel; and not __fish_seen_subcommand_from delete rename switch new help" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and not __fish_seen_subcommand_from delete rename switch new help" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and not __fish_seen_subcommand_from delete rename switch new help" -f -a "delete" -d 'Delete a channel. The channel must not be the current channel'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and not __fish_seen_subcommand_from delete rename switch new help" -f -a "rename" -d 'Rename a channel'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and not __fish_seen_subcommand_from delete rename switch new help" -f -a "switch" -d 'Switch to a channel. There must not be unrecorded changes in the working copy'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and not __fish_seen_subcommand_from delete rename switch new help" -f -a "new" -d 'Create a new, empty channel'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and not __fish_seen_subcommand_from delete rename switch new help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from delete" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from delete" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from rename" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from rename" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from rename" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from switch" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from switch" -s f -l force
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from switch" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from switch" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from new" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from new" -l empty
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from new" -s f -l force
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from new" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from new" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a channel. The channel must not be the current channel'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from help" -f -a "rename" -d 'Rename a channel'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from help" -f -a "switch" -d 'Switch to a channel. There must not be unrecorded changes in the working copy'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from help" -f -a "new" -d 'Create a new, empty channel'
complete -c pijul -n "__fish_pijul_using_subcommand channel; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_pijul_using_subcommand protocol" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand protocol" -l version -d 'Use this protocol version' -r
complete -c pijul -n "__fish_pijul_using_subcommand protocol" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand protocol" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand protocol" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand move" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand move" -l salt -r
complete -c pijul -n "__fish_pijul_using_subcommand move" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand move" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand move" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pijul -n "__fish_pijul_using_subcommand list" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand list" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand list" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand list" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand add" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand add" -l salt -r
complete -c pijul -n "__fish_pijul_using_subcommand add" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand add" -s r -l recursive
complete -c pijul -n "__fish_pijul_using_subcommand add" -s f -l force
complete -c pijul -n "__fish_pijul_using_subcommand add" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pijul -n "__fish_pijul_using_subcommand remove" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand remove" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand remove" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand remove" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand reset" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand reset" -l channel -d 'Reset the working copy to this channel, and change the current channel to this channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand reset" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand reset" -l dry-run -d 'Print this file to the standard output, without modifying the repository (works for a single file only)'
complete -c pijul -n "__fish_pijul_using_subcommand reset" -s f -l force -d 'Reset even if there are unrecorded changes'
complete -c pijul -n "__fish_pijul_using_subcommand reset" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand reset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pijul -n "__fish_pijul_using_subcommand debug" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand debug" -l channel -d 'Work with CHANNEL instead of the current channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand debug" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand debug" -l sanakirja-only
complete -c pijul -n "__fish_pijul_using_subcommand debug" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand debug" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand fork" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand fork" -l state -d 'Make the new channel from this state instead of the current channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand fork" -l channel -d 'Make the new channel from this channel instead of the current channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand fork" -l change -d 'Apply this change after creating the channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand fork" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand fork" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand fork" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand unrecord" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand unrecord" -l channel -d 'Unrecord changes from this channel instead of the current channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand unrecord" -l show-changes -d 'Show N changes in a text editor if no <change-id>s were given. Defaults to the value of `unrecord_changes` in your global configuration' -r
complete -c pijul -n "__fish_pijul_using_subcommand unrecord" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand unrecord" -l reset -d 'Also undo the changes in the working copy (preserving unrecorded changes if there are any)'
complete -c pijul -n "__fish_pijul_using_subcommand unrecord" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand unrecord" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c pijul -n "__fish_pijul_using_subcommand apply" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand apply" -l channel -d 'Work with CHANNEL instead of the current channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand apply" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand apply" -l deps-only -d 'Only apply the dependencies of the change, not the change itself. Only applicable for a single change'
complete -c pijul -n "__fish_pijul_using_subcommand apply" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand apply" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand remote; and not __fish_seen_subcommand_from default delete help" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand remote; and not __fish_seen_subcommand_from default delete help" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand remote; and not __fish_seen_subcommand_from default delete help" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand remote; and not __fish_seen_subcommand_from default delete help" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand remote; and not __fish_seen_subcommand_from default delete help" -f -a "default" -d 'Set the default remote'
complete -c pijul -n "__fish_pijul_using_subcommand remote; and not __fish_seen_subcommand_from default delete help" -f -a "delete" -d 'Deletes the remote'
complete -c pijul -n "__fish_pijul_using_subcommand remote; and not __fish_seen_subcommand_from default delete help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_pijul_using_subcommand remote; and __fish_seen_subcommand_from default" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand remote; and __fish_seen_subcommand_from default" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand remote; and __fish_seen_subcommand_from default" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand remote; and __fish_seen_subcommand_from delete" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand remote; and __fish_seen_subcommand_from delete" -s 1 -l exact -d 'Delete only the specified datum, i.e. database ID or remote name. If this isn\'t specified and there is at most one of each kind of data linked to a remote, the entire remote is deleted'
complete -c pijul -n "__fish_pijul_using_subcommand remote; and __fish_seen_subcommand_from delete" -l flood -d 'Delete all the linked data of the remote, i.e. all names and all database IDs'
complete -c pijul -n "__fish_pijul_using_subcommand remote; and __fish_seen_subcommand_from delete" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand remote; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand remote; and __fish_seen_subcommand_from help" -f -a "default" -d 'Set the default remote'
complete -c pijul -n "__fish_pijul_using_subcommand remote; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Deletes the remote'
complete -c pijul -n "__fish_pijul_using_subcommand remote; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_pijul_using_subcommand archive" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand archive" -l channel -d 'Work with CHANNEL instead of the current channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand archive" -l remote -d 'Ask the remote to send an archive' -r
complete -c pijul -n "__fish_pijul_using_subcommand archive" -l state -d 'Archive in this state' -r
complete -c pijul -n "__fish_pijul_using_subcommand archive" -l change -d 'Apply these changes after switching to the channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand archive" -l prefix -d 'Append this path in front of each path inside the archive' -r
complete -c pijul -n "__fish_pijul_using_subcommand archive" -l umask -d 'Append this path in front of each path inside the archive' -r
complete -c pijul -n "__fish_pijul_using_subcommand archive" -s o -d 'Name of the output file' -r -F
complete -c pijul -n "__fish_pijul_using_subcommand archive" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand archive" -s k -d 'Do not check certificates (HTTPS remotes only, this option might be dangerous)'
complete -c pijul -n "__fish_pijul_using_subcommand archive" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand archive" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand credit" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand credit" -l channel -d 'Work with CHANNEL instead of the current channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand credit" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand credit" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand credit" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and not __fish_seen_subcommand_from create checkout reset delete help" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand tag; and not __fish_seen_subcommand_from create checkout reset delete help" -l channel -r
complete -c pijul -n "__fish_pijul_using_subcommand tag; and not __fish_seen_subcommand_from create checkout reset delete help" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand tag; and not __fish_seen_subcommand_from create checkout reset delete help" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and not __fish_seen_subcommand_from create checkout reset delete help" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and not __fish_seen_subcommand_from create checkout reset delete help" -f -a "create" -d 'Create a tag, which are compressed channels. Note that tags are not independent from the changes they contain'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and not __fish_seen_subcommand_from create checkout reset delete help" -f -a "checkout" -d 'Restore a tag into a new channel'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and not __fish_seen_subcommand_from create checkout reset delete help" -f -a "reset" -d 'Reset the working copy to a tag'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and not __fish_seen_subcommand_from create checkout reset delete help" -f -a "delete" -d 'Delete a tag from a channel. If the same state isn\'t tagged in other channels, delete the tag file'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and not __fish_seen_subcommand_from create checkout reset delete help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from create" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from create" -s m -l message -r
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from create" -l author -d 'Set the author field' -r
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from create" -l channel -d 'Tag the current state of this channel instead of the current channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from create" -l timestamp -r
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from create" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from create" -l no-keyring
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from create" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from checkout" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from checkout" -l to-channel -d 'Optional new channel name. If not given, the base32 representation of the tag hash is used' -r
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from checkout" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from checkout" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from checkout" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from reset" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from reset" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from reset" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from reset" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from delete" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from delete" -l channel -d 'Delete the tag in this channel instead of the current channel' -r
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from delete" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from delete" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a tag, which are compressed channels. Note that tags are not independent from the changes they contain'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from help" -f -a "checkout" -d 'Restore a tag into a new channel'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from help" -f -a "reset" -d 'Reset the working copy to a tag'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a tag from a channel. If the same state isn\'t tagged in other channels, delete the tag file'
complete -c pijul -n "__fish_pijul_using_subcommand tag; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and not __fish_seen_subcommand_from new repair prove list edit remove help" -l repository -d 'Work with the repository at PATH instead of the one containing the current directory' -r -f -a "(__fish_complete_directories)"
complete -c pijul -n "__fish_pijul_using_subcommand identity; and not __fish_seen_subcommand_from new repair prove list edit remove help" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and not __fish_seen_subcommand_from new repair prove list edit remove help" -s k -l no-cert-check -d 'Do not verify certificates (use with caution)'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and not __fish_seen_subcommand_from new repair prove list edit remove help" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and not __fish_seen_subcommand_from new repair prove list edit remove help" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and not __fish_seen_subcommand_from new repair prove list edit remove help" -f -a "new" -d 'Create a new identity'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and not __fish_seen_subcommand_from new repair prove list edit remove help" -f -a "repair" -d 'Repair the identity state on disk, including migration from older versions of Pijul'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and not __fish_seen_subcommand_from new repair prove list edit remove help" -f -a "prove" -d 'Prove an identity to the server'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and not __fish_seen_subcommand_from new repair prove list edit remove help" -f -a "list" -d 'Pretty-print all valid identities on disk'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and not __fish_seen_subcommand_from new repair prove list edit remove help" -f -a "edit" -d 'Edit an existing identity'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and not __fish_seen_subcommand_from new repair prove list edit remove help" -f -a "remove" -d 'Remove an existing identity'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and not __fish_seen_subcommand_from new repair prove list edit remove help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from new" -l username -d 'Set the username' -r -f -a "(__fish_complete_users)"
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from new" -l remote -d 'Set the default remote' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from new" -l display-name -d 'Set the display name' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from new" -l email -d 'Set the email' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from new" -l expiry -d 'Set the expiry' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from new" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from new" -l no-link -d 'Do not automatically link keys with the remote'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from new" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from new" -l read-password -d 'Encrypt using a password from standard input. Requires --no-prompt'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from new" -l no-keyring -d 'Disable the use of the system keyring'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from new" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from repair" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from repair" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from repair" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from prove" -l name -d 'Set the name used to prove the identity' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from prove" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from prove" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from prove" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from list" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from list" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from edit" -l username -d 'Set the username' -r -f -a "(__fish_complete_users)"
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from edit" -l remote -d 'Set the default remote' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from edit" -l display-name -d 'Set the display name' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from edit" -l email -d 'Set the email' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from edit" -l new-name -d 'Set the identity name' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from edit" -l expiry -d 'Set the expiry' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from edit" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from edit" -l no-link -d 'Do not automatically link keys with the remote'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from edit" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from edit" -l read-password -d 'Encrypt using a password from standard input. Requires --no-prompt'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from edit" -l no-keyring -d 'Disable the use of the system keyring'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from remove" -l name -d 'Set the name of the identity to remove' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from remove" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from remove" -l no-confirm -d 'Remove the matching identity without confirmation'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from remove" -l no-keyring -d 'Disable the use of the system keyring'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from remove" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from remove" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from help" -f -a "new" -d 'Create a new identity'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from help" -f -a "repair" -d 'Repair the identity state on disk, including migration from older versions of Pijul'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from help" -f -a "prove" -d 'Prove an identity to the server'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from help" -f -a "list" -d 'Pretty-print all valid identities on disk'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from help" -f -a "edit" -d 'Edit an existing identity'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from help" -f -a "remove" -d 'Remove an existing identity'
complete -c pijul -n "__fish_pijul_using_subcommand identity; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_pijul_using_subcommand client" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand client" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand client" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand completion; and not __fish_seen_subcommand_from bash elvish fish power-shell zsh help" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand completion; and not __fish_seen_subcommand_from bash elvish fish power-shell zsh help" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand completion; and not __fish_seen_subcommand_from bash elvish fish power-shell zsh help" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand completion; and not __fish_seen_subcommand_from bash elvish fish power-shell zsh help" -f -a "bash"
complete -c pijul -n "__fish_pijul_using_subcommand completion; and not __fish_seen_subcommand_from bash elvish fish power-shell zsh help" -f -a "elvish"
complete -c pijul -n "__fish_pijul_using_subcommand completion; and not __fish_seen_subcommand_from bash elvish fish power-shell zsh help" -f -a "fish"
complete -c pijul -n "__fish_pijul_using_subcommand completion; and not __fish_seen_subcommand_from bash elvish fish power-shell zsh help" -f -a "power-shell"
complete -c pijul -n "__fish_pijul_using_subcommand completion; and not __fish_seen_subcommand_from bash elvish fish power-shell zsh help" -f -a "zsh"
complete -c pijul -n "__fish_pijul_using_subcommand completion; and not __fish_seen_subcommand_from bash elvish fish power-shell zsh help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from bash" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from bash" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from bash" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from elvish" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from elvish" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from elvish" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from fish" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from fish" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from fish" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from power-shell" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from power-shell" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from power-shell" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from zsh" -l config -d 'Override a configuration value, in the form `--config key=value`' -r
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from zsh" -l no-prompt -d 'Abort rather than prompt for input'
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from zsh" -s h -l help -d 'Print help'
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from help" -f -a "bash"
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from help" -f -a "elvish"
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from help" -f -a "fish"
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from help" -f -a "power-shell"
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from help" -f -a "zsh"
complete -c pijul -n "__fish_pijul_using_subcommand completion; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "init" -d 'Initializes an empty pijul repository'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "clone" -d 'Clones an existing pijul repository'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "record" -d 'Creates a new change'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "diff" -d 'Shows difference between two channels/changes'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "status" -d 'Shows a brief overview of changes'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "log" -d 'Show the entire log of changes'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "push" -d 'Pushes changes to a remote upstream'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "pull" -d 'Pulls changes from a remote upstream'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "change" -d 'Shows information about a particular change'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "dependents" -d 'Lists the transitive closure of the reverse dependency relation'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "channel" -d 'Manages different channels'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "protocol" -d 'This command is not meant to be run by the user, instead it is called over SSH'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "move" -d 'Moves a file in the working copy and the tree'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "list" -d 'Lists files tracked by pijul'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "add" -d 'Adds a path to the tree'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "remove" -d 'Removes a file from the tree of tracked files (`pijul record` will then record this as a deletion)'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "reset" -d 'Resets the working copy to the last recorded change'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "debug"
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "fork" -d 'Create a new channel'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "unrecord" -d 'Unrecords a list of changes'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "apply" -d 'Applies changes to a channel'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "remote" -d 'Manages remote repositories'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "archive" -d 'Creates an archive of the repository'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "credit" -d 'Shows which change last affected each line of the given file(s)'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "tag" -d 'Manage tags (create tags, check out a tag)'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "identity" -d 'A collection of tools for interactively managing the user\'s identities. This may be useful if you use Pijul in multiple contexts, for example both work & personal projects'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "client" -d 'Authenticates with a HTTP server'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "completion" -d 'Shell completion script generation'
complete -c pijul -n "__fish_pijul_using_subcommand help; and not __fish_seen_subcommand_from init clone record diff status log push pull change dependents channel protocol move list add remove reset debug fork unrecord apply remote archive credit tag identity client completion help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from channel" -f -a "delete" -d 'Delete a channel. The channel must not be the current channel'
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from channel" -f -a "rename" -d 'Rename a channel'
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from channel" -f -a "switch" -d 'Switch to a channel. There must not be unrecorded changes in the working copy'
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from channel" -f -a "new" -d 'Create a new, empty channel'
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from remote" -f -a "default" -d 'Set the default remote'
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from remote" -f -a "delete" -d 'Deletes the remote'
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from tag" -f -a "create" -d 'Create a tag, which are compressed channels. Note that tags are not independent from the changes they contain'
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from tag" -f -a "checkout" -d 'Restore a tag into a new channel'
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from tag" -f -a "reset" -d 'Reset the working copy to a tag'
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from tag" -f -a "delete" -d 'Delete a tag from a channel. If the same state isn\'t tagged in other channels, delete the tag file'
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from identity" -f -a "new" -d 'Create a new identity'
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from identity" -f -a "repair" -d 'Repair the identity state on disk, including migration from older versions of Pijul'
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from identity" -f -a "prove" -d 'Prove an identity to the server'
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from identity" -f -a "list" -d 'Pretty-print all valid identities on disk'
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from identity" -f -a "edit" -d 'Edit an existing identity'
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from identity" -f -a "remove" -d 'Remove an existing identity'
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from completion" -f -a "bash"
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from completion" -f -a "elvish"
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from completion" -f -a "fish"
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from completion" -f -a "power-shell"
complete -c pijul -n "__fish_pijul_using_subcommand help; and __fish_seen_subcommand_from completion" -f -a "zsh"
