package com.samples;

/**
 *  Understands how to greet in several languages
 */
public class Greeting {
    private final String subject;

    public Greeting(String subject) {
        this.subject = ", " + subject + "!";
    }

    public String english() {
        return "Hello" + subject;
    }

    public String espanol() {
        return "Hola" + subject;
    }

    public String farsi() {
        return "Salam" + subject;
    }
}