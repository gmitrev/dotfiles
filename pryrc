if defined?(PryDebugger)
  Pry.commands.alias_command 'dc', 'continue'
  Pry.commands.alias_command 'ds', 'step'
  Pry.commands.alias_command 'dn', 'next'
  Pry.commands.alias_command 'df', 'finish'
end

