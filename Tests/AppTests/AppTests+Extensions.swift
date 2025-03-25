import Foundation
import Hummingbird
import NIO

extension JSONEncoder {
    func encodeAsByteBuffer<T: Encodable>(_ value: T, allocator: ByteBufferAllocator) throws
        -> ByteBuffer
    {
        let data = try self.encode(value)
        var buffer = allocator.buffer(capacity: data.count)
        buffer.writeBytes(data)
        return buffer
    }
}

extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, from buffer: ByteBuffer) throws -> T {
        let bytes = buffer.readableBytesView
        let data = Data(bytes)
        return try self.decode(type, from: data)
    }
}
