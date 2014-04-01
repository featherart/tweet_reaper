class CreateTweetFetchers < ActiveRecord::Migration
  def change
    create_table :tweet_fetchers do |t|

      t.timestamps
    end
  end
end
