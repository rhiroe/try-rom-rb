require 'rom'
require 'rom/sql'

module Relations
  # articles テーブルの定義を書く
  class Articles < ROM::Relation[:sql]
    # Define a canonical schema for this relation. This will be used when we
    # use commands to make changes to our data. It ensures that only
    # appropriate attributes are written through to the database table.
    schema(:articles) do
      attribute :id, Types::Serial
      attribute :title, Types::String
      attribute :published, Types::Bool
    end

    # Define some composable, reusable query methods to return filtered
    # results from our database table. We'll use them in a moment.
    def by_id(id)
      where(id: id)
    end

    def published
      where(published: true)
    end
  end
end

module Repositories
  class Article < ROM::Repository[:articles]
    # このRepositoryがRelationに対してどのようなアクセスを許可するか指定する
    commands :create, :update, :delete

    def by_id(id)
      articles.by_id(id)
    end

    def published
      articles.published
    end

    # `aggregate`メソッドを使うことによって、Relationで定義されている関連Relationのデータを子要素としてフェッチできる
    # 現在 comments テーブルの定義はないのでサンプルとして紹介
    # def all
    #   aggregate(:comments)
    # end
  end
end
