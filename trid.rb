module TrID

    TRID_EXEC_PATH = ENV.fetch("TRID_EXEC_PATH", "/usr/local/bin/trid")
    TRID_DEFS_PATH = ENV.fetch("TRID_DEFS_PATH", "/usr/lib/trid/triddefs.trd")

    def self.analyze(file_path, &block)
        cmd = [TRID_EXEC_PATH, file_path, "-d:#{TRID_DEFS_PATH}"]
        skip = true
        IO.popen(cmd) do |io|
            io.each do |line|
                yield(line.strip + "\n") unless skip
                if line.start_with?("Collecting data")
                    skip = false if skip
                end
            end
        end
    end

end
