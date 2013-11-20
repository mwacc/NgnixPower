package com.github.mwacc;

import com.strategicgains.restexpress.RestExpress;

public class Driver {

    public static void main(String[] args) {
        RestExpress server = new RestExpress()
                .setName("Echo");

        ApiGateway gateway = new ApiGateway(server)
                .buildGetById()
                .buildSearchByAge();

        server.bind(8081);
        server.awaitShutdown();
    }

}