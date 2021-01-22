import ballerina/grpc;

public type ContextOrderInfo record {|
    orderInfo content;
    map<string|string[]> headers;
|};

public type ContextString record {|
    string content;
    map<string|string[]> headers;
|};

public client class orderManagementClient {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public isolated function init(string url, grpc:ClientConfiguration? config = ()) returns grpc:Error? {
        // initialize client endpoint.
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, ROOT_DESCRIPTOR, getDescriptorMap());
    }

    isolated remote function createOrder(orderInfo|ContextOrderInfo req) returns (string|grpc:Error) {

        map<string|string[]> headers = {};
        orderInfo message;
        if (req is ContextOrderInfo) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc_service.orderManagement/createOrder", message, 
        headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }
    isolated remote function createOrderContext(orderInfo|ContextOrderInfo req) returns (ContextString|grpc:Error) {

        map<string|string[]> headers = {};
        orderInfo message;
        if (req is ContextOrderInfo) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc_service.orderManagement/createOrder", message, 
        headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {
            content: result.toString(),
            headers: respHeaders
        };
    }

    isolated remote function retrieveOrder(string|ContextString req) returns (orderInfo|grpc:Error) {

        map<string|string[]> headers = {};
        string message;
        if (req is ContextString) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc_service.orderManagement/retrieveOrder", message, 
        headers);
        [anydata, map<string|string[]>] [result, _] = payload;

        return <orderInfo>result;

    }
    isolated remote function retrieveOrderContext(string|ContextString req) returns (ContextOrderInfo|grpc:Error) {

        map<string|string[]> headers = {};
        string message;
        if (req is ContextString) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc_service.orderManagement/retrieveOrder", message, 
        headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;

        return {
            content: <orderInfo>result,
            headers: respHeaders
        };
    }

    isolated remote function updateOrder(orderInfo|ContextOrderInfo req) returns (string|grpc:Error) {

        map<string|string[]> headers = {};
        orderInfo message;
        if (req is ContextOrderInfo) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc_service.orderManagement/updateOrder", message, 
        headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }
    isolated remote function updateOrderContext(orderInfo|ContextOrderInfo req) returns (ContextString|grpc:Error) {

        map<string|string[]> headers = {};
        orderInfo message;
        if (req is ContextOrderInfo) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc_service.orderManagement/updateOrder", message, 
        headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {
            content: result.toString(),
            headers: respHeaders
        };
    }

    isolated remote function deleteOrder(string|ContextString req) returns (string|grpc:Error) {

        map<string|string[]> headers = {};
        string message;
        if (req is ContextString) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc_service.orderManagement/deleteOrder", message, 
        headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }
    isolated remote function deleteOrderContext(string|ContextString req) returns (ContextString|grpc:Error) {

        map<string|string[]> headers = {};
        string message;
        if (req is ContextString) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("grpc_service.orderManagement/deleteOrder", message, 
        headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {
            content: result.toString(),
            headers: respHeaders
        };
    }
}

public type orderInfo record {|
    string orderId = "";
    string customer = "";
    string description = "";
    string paymentStatus = "";
|};

const string ROOT_DESCRIPTOR = "0A0B6F726465722E70726F746F120C677270635F736572766963651A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F2289010A096F72646572496E666F12180A076F72646572496418012001280952076F726465724964121A0A08637573746F6D65721802200128095208637573746F6D657212200A0B6465736372697074696F6E180320012809520B6465736372697074696F6E12240A0D7061796D656E74537461747573180420012809520D7061796D656E7453746174757332B0020A0F6F726465724D616E6167656D656E7412440A0B6372656174654F7264657212172E677270635F736572766963652E6F72646572496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512460A0D72657472696576654F72646572121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A172E677270635F736572766963652E6F72646572496E666F12440A0B7570646174654F7264657212172E677270635F736572766963652E6F72646572496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512490A0B64656C6574654F72646572121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565620670726F746F33";

isolated function getDescriptorMap() returns map<string> {
    return 
    {
        "order.proto": "0A0B6F726465722E70726F746F120C677270635F736572766963651A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F2289010A096F72646572496E666F12180A076F72646572496418012001280952076F726465724964121A0A08637573746F6D65721802200128095208637573746F6D657212200A0B6465736372697074696F6E180320012809520B6465736372697074696F6E12240A0D7061796D656E74537461747573180420012809520D7061796D656E7453746174757332B0020A0F6F726465724D616E6167656D656E7412440A0B6372656174654F7264657212172E677270635F736572766963652E6F72646572496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512460A0D72657472696576654F72646572121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A172E677270635F736572766963652E6F72646572496E666F12440A0B7570646174654F7264657212172E677270635F736572766963652E6F72646572496E666F1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512490A0B64656C6574654F72646572121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565620670726F746F33",
        "google/protobuf/wrappers.proto": "0A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F120F676F6F676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A466C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C7565180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C756522220A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A0576616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C756522230A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A0576616C756518012001280C520576616C756542570A13636F6D2E676F6F676C652E70726F746F627566420D577261707065727350726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33"
    };
}
