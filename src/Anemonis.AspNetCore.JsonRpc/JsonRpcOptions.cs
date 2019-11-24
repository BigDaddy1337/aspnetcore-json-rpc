// © Alexander Kozlenko. Licensed under the MIT License.

using Newtonsoft.Json;

namespace Anemonis.AspNetCore.JsonRpc
{
    /// <summary>Provides options for the JSON-RPC 2.0 middleware.</summary>
    public sealed class JsonRpcOptions
    {
        /// <summary>Initializes a new instance of the <see cref="JsonRpcOptions" /> class.</summary>
        public JsonRpcOptions()
        {
        }

        /// <summary>Gets or sets the JSON serializer instance used for serializing and deserializing JSON-RPC messages.</summary>
        public JsonSerializer JsonSerializer
        {
            get;
            set;
        }

        /// <summary>
        /// By default HTTP Accept header is required and only 'application/json' is valid, with this option Middleware disable any validation for Accept header
        /// </summary>
        public bool IgnoreEmptyAcceptHeader
        {
            get;
            set;
        }
    }
}
