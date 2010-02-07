require 'set'
class VerifyController < ApplicationController
  ROWS = 10

  def index
  end

  def list
    mode  = (nil != params['mode']) ? params['mode'] : 'order'
    @rows = self.__send__ mode
  end

  def verify
    id  = params['id']
    ans = params['ans']
    p   = Phrase.find(id)
    r   = (p.phrase.strip == ans.to_s.strip) ? 'OK' : 'NG'
    result(id, r)
    render :text => r
  end

  private
  def order
    return order_result('id ASC')
  end

  def reverse
    return order_result('id DESC')
  end

  def order_result(order)
    page       = (params['page'] != nil && params['page'] > 0) ? params['page'] : 1;
    type       = (params['type'] != nil) ? params['type'] : nil
    start_num  = ROWS * (page - 1)
    conditions = (type != nil) ? ["type_id = ? ", type] : nil
    Phrase.find(:all,
                :conditions => conditions,
                :offset     => start_num,
                :limit      => ROWS,
                :order      => order)
  end

  def random
    count  = Phrase.count_by_sql "SELECT count(*) FROM phrases ; "
    idlist = Set.new
    while idlist.length < 10
      idlist.add(rand(count) + 1)
    end
    condition = '(' + idlist.to_a.join(',') + ')'
    Phrase.find(:all, :conditions => "id IN " + condition)
  end

  def result(id, result)
    r = Result.new
    r.phrase_id = id
    r.result    = (result == 'OK') ? true : false;
    r.save
  end

end
