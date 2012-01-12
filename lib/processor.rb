module WhatWeb
class Processor

  attr_reader :opts
  attr_reader :aho_corasick_preprocessor
  def initialize(opts)
    @opts=opts.clone
    @opts[:plugins]=Plugin.registered_plugins unless @opts[:plugins]
    if @opts[:enable_aho_corasick]
      @aho_corasick_preprocessor=WhatWeb::AhoCorasickPreprocessor.new
      aho_corasick_preprocessor.build_trigger_dictionary(@opts)
    end
  end

  def error(e)
    opts[:on_error_callback].call(e) if opts[:on_error_callback]
  end

  def process(target)
    opts[:benchmark_results][:process][:runs]+=1 if opts[:benchmark]
    p=Time.now
    results=[]
    plugins=opts[:plugins]
    plugins=aho_corasick_preprocessor.find_plugins(target) if aho_corasick_preprocessor
    plugins.each do |name,prototype|
      begin			
	      plugin=prototype.clone
        plugin.init(target)
	      result=plugin.x(opts)
      rescue StandardError => err
	      error("ERROR: Plugin #{name} failed for #{target.original_source.to_s}. #{err}")
        raise if $WWDEBUG==true
      end
      results << [name, result] unless result.nil? or result.empty?
    end
    opts[:benchmark_results][:process][:total]+=Time.now-p if opts[:benchmark]
    results
  end

  private

  def self.convert_to_target(target)
      return target if target.is_a?(WhatWeb::Target)
  end

end
end
