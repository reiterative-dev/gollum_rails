module GollumRails
  ## simple DI component
  class DependencyInjector

    @storage = {}
    def self.get_error_buffer
      error ||= error_old 
    end
    #sets a storage Hash
    def self.register(&block)
      block.call(self)
    end

    def self.set(arguments = {})
      arguments.each{ |key, value| @storage[key] = value}
    end

    def self.method_missing(method, *arguments, &block)
      if @storage[method]
        return @storage[method]
      else
        return false
      end
    end
  end
end