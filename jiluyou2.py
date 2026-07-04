import base64
import hashlib
import hmac

def get_hmac_sha1(message, key):
    result = hmac.new(key, message, hashlib.sha1).digest()
    return base64.b64encode(result).decode()

def sha1(data):
    return hashlib.sha1(data).digest()

if __name__ == '__main__':
    # 手动输入 local_token 和 uuid
    local_token = input("请输入 local_token: ").strip()
    uuid = input("请输入 uuid: ").strip()

    # 解析 local_token
    mac, ssh, t, hmacstr = base64.b64decode(local_token).split(b",", 3)
    message = "{},ssh,{}".format(mac.decode(), int(t) + 1).encode()

    # 生成 key
    key = sha1(uuid.encode())

    # 计算 cloud_token
    h = get_hmac_sha1(message, key)
    print("cloud token:", h)
