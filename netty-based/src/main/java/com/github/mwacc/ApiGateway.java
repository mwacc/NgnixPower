package com.github.mwacc;

import com.strategicgains.restexpress.Request;
import com.strategicgains.restexpress.Response;
import com.strategicgains.restexpress.RestExpress;
import org.jboss.netty.handler.codec.http.HttpMethod;

public class ApiGateway {

    private final RestExpress server;

    public ApiGateway(RestExpress server) {
        this.server = server;
    }

    public ApiGateway buildGetById() {
        server.uri("/get", new Object()
        {
            public String read(Request req, Response res)
            {
                res.setContentType("text/json");

                String value = req.getRawHeader("echo");

                if (value == null)
                {
                    return "<http_test><error>no value specified</error></http_test>";
                }
                else
                {
                    return String.format("<http_test><value>%s</value></http_test>", value);
                }
            }
        })
        .method(HttpMethod.GET)
        .noSerialization();

        return this;
    }

    public ApiGateway buildSearchByAge() {
        server.uri("/search", new Object()
        {
            public String read(Request req, Response res)
            {
                res.setContentType("text/json");

                String value = req.getRawHeader("echo");
                if (value == null)
                {
                    return "<http_test><error>no value specified</error></http_test>";
                }
                else
                {
                    return String.format("<http_test><value>%s</value></http_test>", value);
                }
            }
        })
        .method(HttpMethod.GET)
        .noSerialization();

        return this;
    }

}