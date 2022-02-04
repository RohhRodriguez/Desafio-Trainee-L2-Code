import re #lib de regex

# Abre os arquivos necessários
verb_in = open('verb.in', 'r')
verb_out = open('verb.out', 'w')

#Criação de biblioteca:
conjugations = {
    'o': ['1st', 'present'], 'ei': ['1st', 'past'], 'ai': ['1st', 'future'],
    'os': ['2nd', 'present'], 'es': ['2nd', 'past'], 'ais': ['2nd', 'future'],
    'a': ['3rd', 'present'], 'e': ['3rd', 'past'], 'i': ['3rd', 'future'],
    'om': ['4th', 'present'], 'em': ['4th', 'past'], 'aem': ['4th', 'future'],
    'ons': ['5th', 'present'], 'est': ['5th', 'past'], 'aist': ['5th', 'future'],
    'am': ['6th', 'present'], 'im': ['6th', 'past'], 'aim': ['6th', 'future']
}
regex = "^([a-z]+[bcdfghjklmnpqrstvwxyz])%s$" #Regra de palavras:
for word in verb_in.readlines():
    cleared = word.strip('\n')
    is_verb = False
    for conjugation in conjugations.keys():
        if re.match(regex % conjugation, cleared):
            is_verb = True
            verb_out.write('%s - verb %s, %s tense, %s person\n' % (cleared,
                                                         re.sub(regex % conjugation, r"\1en", cleared),
                                                         conjugations[conjugation][1],
                                                         conjugations[conjugation][0]))
    if not is_verb: #Não verbo:
        verb_out.write('%s - not a verb case\n' % cleared)

# Fecha os arquivos ao fim do processamento
verb_in.close()
verb_out.close()
