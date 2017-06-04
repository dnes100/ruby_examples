module Dinesh

  def self.calculate_percentage(input, total)
    (input/total.to_f) * 100
  end

  def self.micro_to_seconds(microseconds)
    microseconds / 1_000_000.to_f
  end

  def self.print_results(system_calls, total_time)
    puts "\n"
    puts " % time    seconds  calls  syscall"
    puts "------- ---------- ------  --------------------"

    total_percent, total_second, total_count = 0, 0, 0

    system_calls.each do |name, attrs|
      percent = calculate_percentage(attrs[:time], total_time)
      total_percent += percent

      seconds = micro_to_seconds(attrs[:time])
      total_second += seconds

      count = attrs[:count]
      total_count += count

      percent_formatted = "%.2f" % percent + '%'
      seconds_formatted = "%.6f" % seconds

      puts " #{percent_formatted.rjust(6)}   #{seconds_formatted} #{count.to_s.rjust(6)}  #{name}"
    end

    puts "------- ---------- ------  --------------------"

    percent_formatted = (total_percent.round.to_s + '%').rjust(6)
    seconds_formatted = "%.6f" % micro_to_seconds(total_time)

    puts " #{percent_formatted}   #{seconds_formatted} #{total_count.to_s.rjust(6)}  total"
  end

  def self.process_system_calls(command)

    puts "\n Running command: #{command}\n"

    output = `#{command}`

    # raw_system_calls => ["\n    12 sys_call"]
    raw_system_calls = output.scan(/\n\s+\d+ \w+(?=\()/)

    # data would be populated in this one after processing
    # { sys_call: { count: 2, time: 12 } }
    system_calls = {}

    # total time
    total_time = 0

    raw_system_calls.each do |item|
      array = item.strip.split(" ")
      time = array[0].to_i
      name = array[1].to_sym

      if system_calls.has_key? name
        system_calls[name][:count] += 1
        system_calls[name][:time] += time
      else
        system_calls[name] = { count: 1, time: time }
      end

      total_time += time
    end

    print_results(system_calls, total_time)
  end

end


# command executed for processing
command = 'sudo dtruss -e ls 2>&1'

Dinesh.process_system_calls(command)
puts __FILE__
