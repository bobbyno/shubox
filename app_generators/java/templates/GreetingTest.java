package com.samples;

import org.junit.Test;
import static org.junit.Assert.assertThat;
import static org.hamcrest.CoreMatchers.is;

/**
 *  Tests our toy class; ensures we have everything wired together.
 */
public class GreetingTest {

    @Test
    public void shouldSayHi() {
        assertThat(new Greeting("World").english(), is("Hello, World!"));
        assertThat(new Greeting("Donia").farsi(), is("Salam, Donia!"));
        assertThat(new Greeting("Miami").espanol(), is("Hola, Miami!"));
    }
}