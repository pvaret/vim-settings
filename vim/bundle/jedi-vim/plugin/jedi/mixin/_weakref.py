def proxy(object, callback=None):
    return object

class ref():
    def __init__(self, object, callback=None):
        self.__object = object
    def __call__(self):
        return self.__object
