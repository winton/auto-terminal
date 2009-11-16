module Auto
  module Terminal
    
    def terminal(args)
      Terminal.instance(self, args)
    end
    
    class Terminal
      
      cattr_accessor :runner
      
      class <<self
    
        def instance(runner, args)
          @@runner = runner
          if args.empty?
            Plugins.tasks.each do |task|
              puts task[:name]
            end
          else
            args.each do |task|
              run(task)
            end
          end
        end
    
        def run(task)
          @@runner.before_question do |key, value|
            puts value.first
            @@runner.instance_eval do
              answers[key] = STDIN.gets
              eval("@#{key} = answers[key]")
            end
          end
          @@runner.run(task)
        end
      end
    end
  end
end