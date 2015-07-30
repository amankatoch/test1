class MailingJob < Struct.new(:mailing_id, :square)
  def perform
    if square == "bet"	
      Bet.find(mailing_id).update_attributes!(:active => false)
    else  
      Appeal.find(mailing_id).update_attributes!(:active => false)
    end  
  end
end