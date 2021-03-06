module Consul
  module Async
    class Debug
      def self.level
        @level || 2
      end

      def self.levels
        %w[none error info debug]
      end

      def self.level=(log_level)
        lvl = levels.index(log_level)
        raise "Log level #{log_level} unsupported, must be one of #{levels.inspect}" if lvl.nil?
        @level = lvl
      end

      def self.puts_error(msg)
        STDERR.puts "[ERROR] #{msg}" if level.positive?
      end

      def self.puts_info(msg)
        STDERR.puts "[INFO] #{msg}" if level > 1
      end

      def self.print_info(msg)
        STDERR.print "[INFO] #{msg}" if level > 1
      end

      def self.puts_debug(msg)
        STDERR.puts "[DEBG] #{msg}" if level > 2
      end

      def self.print_debug(msg)
        STDERR.print "[DEBG] #{msg}" if level > 2
      end
    end
  end
end
