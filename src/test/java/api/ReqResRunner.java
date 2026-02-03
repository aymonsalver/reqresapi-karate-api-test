package api;

import com.intuit.karate.junit5.Karate;

public class ReqResRunner {

    @Karate.Test
    Karate testReqRes() {
        return Karate.run("classpath:api/reqres_crud.feature");
    }
}
