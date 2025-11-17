package com.dmpcare.model;

public class Payment {
	private int id;
	private String fullName;
    private String email;
    private String service;
    private double amount;
    private String cardNumber;
    
    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

    // Getter and Setter for fullName
    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    // Getter and Setter for email
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    // Getter and Setter for service
    public String getService() {
        return service;
    }
    public void setService(String service) {
        this.service = service;
    }

    // Getter and Setter for amount
    public double getAmount() {
        return amount;
    }
    public void setAmount(double amount) {
        this.amount = amount;
    }

    // Getter and Setter for cardNumber
    public String getCardNumber() {
        return cardNumber;
    }
    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }
}
