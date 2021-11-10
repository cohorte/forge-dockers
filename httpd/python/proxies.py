# python shell that return a json of all proxy with id in stdou
import glob
import json

ID_TOKEN = "#id="


def get_json_proxies(a_path):
    """ """
    w_json = {}
    for w_elem in glob.iglob(a_path+"*.conf"):
        with open(w_elem) as f:
            lines = f.readlines()
            for line in lines:
                if ID_TOKEN in line:
                    w_index_of = line.index(ID_TOKEN)+len(ID_TOKEN)
                    w_json_elem = json.loads(line[w_index_of:])
                    w_json[w_json_elem["id"]] = w_json_elem

    return json.dumps(w_json)


if __name__ == '__main__':
    """ """
    print(get_json_proxies("/usr/local/apache2/conf/vhosts/"))