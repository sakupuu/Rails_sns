class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  has_many :comments

  # クラスメソッド
  # 参照形に使うことが多い
  def self.admin_tweets_count
    return Tweet.where(user_id: 1).count
  end

  # インスタンスメソッド
  # 更新とか削除に使うことが多い
  def update_to_admin
    # ここのselfはインスタンスのこと
    # selfが使えるのでわざわざ引数いらない！

    self.update(
      user_id: 1
    )

    # update(
    #   user_id: 1
    # )
    # updateの返り値はtrue/falseなのでselfをreturnしてあげる
    # update!は成功すればtrue、失敗したら例外が返り値になる
    # 使い分けよう
    # return self
  end
end
