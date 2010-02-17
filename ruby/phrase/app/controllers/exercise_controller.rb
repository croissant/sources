class ExerciseController < ApplicationController
  ROWS = 5
  def index
  end

  def order
    @rows = order_result('id ASC')
    render :list
  end

  def reverse
    @rows = order_result('id DESC')
    render :list
  end

  private
  def order_result(order)
    page       = (params['page'] != nil && params['page'].to_i > 0) ? params['page'].to_i : 1;
    type       = (params['type'] != nil) ? params['type'].to_i : nil
    start_num  = ROWS * (page - 1)
    conditions = (type != nil) ? ["type_id = ? ", type] : nil

    count = Phrase.find(:all, :conditions => conditions).count

    @ppage = previous_page(page.to_i, count)
    @npage = next_page(page.to_i, count)

    Phrase.find(:all,
                :conditions => conditions,
                :offset     => start_num,
                :limit      => ROWS,
                :order      => order)
  end

  def previous_page(current, count)
    if current <= 1
      return nil
    end

    end_num   = (current - 1) * ROWS
    start_num = end_num - ROWS + 1

    if end_num <= 0 || start_num <= 0 || count < start_num
      return nil
    end

    return current - 1
  end

  def next_page(current, count)
    if (ROWS * current + 1) <= count
      current + 1
    else
      return nil
    end
  end

end
