import os

def get_creds(fp='~/.aws/credentials'):
    fp = os.path.expanduser(fp)  # ~ to full path
    key, secret = None, None
    
    with open(fp) as file:
        for line in file:
            if 'aws_access_key_id' in line.lower():
                key = line.split('=')[-1].strip()
            elif 'aws_secret_access_key' in line.lower():
                secret = line.split('=')[-1].strip()

            # Return as soon as both are set
            if key and secret:
                return key, secret

if __name__ == "__main__":
    key, secret = get_creds()

    print "export %s=%s && export %s=%s;" % (
            'AWS_ACCESS_KEY_ID', key,
            'AWS_SECRET_ACCESS_KEY', secret
    )
