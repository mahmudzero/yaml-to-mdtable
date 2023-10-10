require 

'yaml'

class YAMLToMDTable
  def help_text
    puts <<~USAGE
      path/to/file [options]

      this tool is meant to convert specifically formatted YAML to a markdown table

      options
        -h, --help          show the help text (this)
        -i, --input-file    path to the yaml file you want to convert to a markdown table
        -o, --output-file   path to where you want the markdown to be stored after conversion, default stdout

      format
        - column_1: row_1_value_1
          column_2: row_1_value_2
        - column_1: row_2_value_1
          column_2: row_2_value_2

      example
        path/to/file --input-file path/to/yaml.yml
    USAGE
  end

  def initialize(argv)
    return help_text if ARGV.include?("-h") || ARGV.include?("--help")

    @input_file  = nil
    @input_yaml  = nil
    @output_file = nil
    @output_md   = nil
    @std_out     = true

    skip_index = false
    ARGV.each_with_index do |argv, idx|
      if skip_idx
        skip_idx = false
        next
      end

      case argv
      when '-i', '--input-file'
        skip_index = true
        @input_file = ARGV[idx + 1]
        @input_yaml = YAML.load_file(@input_file)
      when '-o', '--output-file'
        puts "nyah"
      else
        nil
      end
    end
  end
end

ARGV.each do |arg|
  puts arg
end
