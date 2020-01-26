import logging
import urllib

import requests

logger = logging.getLogger(__name__)


class RestException(Exception):
    pass


class RestService:

    
    def __init__(self, base_url):
        self.legal_entity_id = None
        self.base_url = base_url.strip('/')
        self.headers = {}
        self.base_path = list(urllib.parse.urlparse(self.base_url))[2].strip('/')
        logger.info("%s using endpoint at URL %s."%(self.__class__.__name__, base_url))

        
    def login(self, email, password, legal_entity_id=None):
        url = self._build_url("token/")
        try:
            logger.debug("Calling %s", url)
            body={
                'email': email,
                'password': password
            }            
            response = requests.post(url, json=body)
            response.raise_for_status()
            self.tokens = response.json()
            self.headers['Authorization'] = "Bearer %s" % self.tokens['access']
            if legal_entity_id is not None:
                self.headers['LegalEntity'] = legal_entity_id
        except requests.exceptions.RequestException as re:
            logger.warning("error: %s" % re.__str__())
        
        return response

    
    def refresh(self):
        url = self._build_url('token/refresh')
        data = {
            'refresh': self.tokens['refresh']
        }
        try:
            logger.debug("Calling %s", url)
            response = requests.post(url, headers=self.headers, json=data)
            response.raise_for_status()
            return response
        except requests.exceptions.RequestException as re:
            logger.warning("error: %s" % re.__str__())

        self.tokens['access'] = response.json()['access']
        self.headers['Authorization'] = "Bearer %s" % self.tokens['access']
    
        
    def get(self, path, params=None, **kwargs):
        self.refresh()
        url = self._build_url(path, **kwargs)
        try:
            logger.debug("Calling %s", url)
            response = requests.get(url, headers=self.headers, params=params)
            response.raise_for_status()
            return response
        except requests.exceptions.RequestException as re:
            logger.warning("error: %s" % re.__str__())

    def upload(self, path, files, data=None, **kwargs):
        self.refresh()
        url = self._build_url(path, **kwargs)
        try:
            logger.debug("Calling %s", url)
            response = requests.post(url, headers=self.headers, 
                                     data=data, files=files)
            response.raise_for_status()
            return response
        except requests.exceptions.RequestException as re:
            logger.warning("error: %s" % re.__str__())
        
            
    def post(self, path, data=None, **kwargs):
        self.refresh()
        url = self._build_url(path, **kwargs)
        try:
            logger.debug("Calling %s", url)
            response = requests.post(url, headers=self.headers, json=data)
            response.raise_for_status()
            return response
        except requests.exceptions.RequestException as re:
            logger.warning("error: %s" % re.__str__())

    def _build_url(self, path, **kwargs):
        path = "/".join([self.base_path, path.strip("/")]) + "/"
        url_parts = list(urllib.parse.urlparse(self.base_url))
        url_parts[2] = path.format(**kwargs)
        return urllib.parse.urlunparse(url_parts)
