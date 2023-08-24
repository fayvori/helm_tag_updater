class ExtendedDict:
    '''
    Updates a manifest dictionary by providing a `path` and `value` arg
    ''' 
    def update(self, manifest, **kwargs) -> None:
        key_list = kwargs['path'].split(".")

        for k in key_list[:-1]:
            manifest = manifest[k]

        manifest[key_list[-1]] = kwargs['value']

    update_dict = update
