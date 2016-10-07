#!/usr/bin/env python

import sys
import hashlib
from splunklib.searchcommands import \
    dispatch, StreamingCommand, Configuration, Option, validators


@Configuration()
class langCommand(StreamingCommand):
    """ %(synopsis)

    ##Syntax

    %(syntax)

    ##Description

    %(description)

    """
    fieldname = Option(
        doc='''
        **Syntax:** **fieldname=***<fieldname>*
        **Description:** Name of the field that will hold the match count''',
        require=True, validate=validators.Fieldname())
    
    def stream(self, events):
        #self.logger.debug('langCommand: %s',self)
        # pattern = self.pattern
        # for each row
        for event in events:
            for fieldname in self.fieldnames:
                #check with sha1 instead of bcrypt
                text = '{0}{1}'.format(event['hash'],event['ca_salt'])
                hash = hashlib.sha1(text).hexdigest()
                if hash == event['password']:
                    event[self.fieldname]="success"
                else:
                    event[self.fieldname]="fail"
            yield event

dispatch(langCommand, sys.argv, sys.stdin, sys.stdout, __name__)