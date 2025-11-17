package feedback_package;

public class feedback {

    private int id;  
    private String customerName, eventName, feedbackDate, feedbackComment;
    
    //default constructor
    public feedback() {
    	
	}

    //overloaded constructor
	public feedback(int id, String customerName, String eventName, String feedbackDate, String feedbackComment) {
		this.id = id;
		this.customerName = customerName;
		this.eventName = eventName;
		this.feedbackDate = feedbackDate;
		this.feedbackComment = feedbackComment;
	}

	public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getCustomerName() {
        return customerName;
    }
    
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    
    public String getEventName() {
        return eventName;
    }
    
    public void setEventName(String eventName) {
        this.eventName = eventName;
    }
    
    public String getFeedbackDate() {
        return feedbackDate;
    }
    
    public void setFeedbackDate(String feedbackDate) {
        this.feedbackDate = feedbackDate;
    }
    
    public String getFeedbackComment() {
        return feedbackComment;
    }
    
    public void setFeedbackComment(String feedbackComment) {
        this.feedbackComment = feedbackComment;
    }
    
    @Override
    public String toString() {
    	return "ID : " + this.id + "Customer Name : " + this.customerName + "Event Name : " + this.eventName + "Feedback Date" + this.feedbackDate + "Feedback Comment" + this.feedbackComment;
    }
}
