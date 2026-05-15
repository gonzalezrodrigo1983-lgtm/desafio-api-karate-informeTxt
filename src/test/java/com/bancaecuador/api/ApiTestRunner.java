package com.bancaecuador.api;

import com.intuit.karate.junit5.Karate;

class ApiTestRunner {
    @Karate.Test
    Karate runApiTests() {
        return Karate.run("classpath:features").relativeTo(getClass());
    }
}
