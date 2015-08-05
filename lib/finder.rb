module GithubScraper
  class Finder
    attr_reader :repo_name, :directory_name

    def initialize(repo_name)
      @repo_name      = repo_name
      @directory_name = repo_name.split("/").last
    end

    def all_contributors
      make_temp_directory
      change_into_temp_directory
      clone_repo
      change_into_new_directory
      data = get_log_data
      clear_temp_folder
      parse(data)
    end

    def make_temp_directory
      `mkdir temp`
    end

    def change_into_temp_directory
      Dir.chdir "temp"
    end

    def clone_repo
      `git clone https://github.com/#{repo_name}.git`
    end

    def change_into_new_directory
      Dir.chdir directory_name
    end

    def get_log_data
      `git log`
    end

    def clear_temp_folder
      `rm -rf temp`
    end

    def parse(data)
      authors = data.split("\n").select { |line| line.start_with?("Author: ") }
      authors.uniq!
      authors.map { |line| line.sub("Author: ", "") }
    end
  end
end
