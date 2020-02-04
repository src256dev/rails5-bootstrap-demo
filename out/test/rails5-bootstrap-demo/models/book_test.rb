require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_fixture
    sf1 = books(:sf1)
    assert_equal('宇宙の果て', sf1.title)
  end

  def test_and
    # ハッシュで検索するとand条件となる
    sf1 = Book.where(title: '宇宙の果て', author: 'SF太郎').first
    assert_equal('宇宙の果て', sf1.title)
    # 配列で指定する場合
    sf1 = Book.where("title=? AND author=?", '宇宙の果て', 'SF太郎').first
    assert_equal('宇宙の果て', sf1.title)
  end
end
