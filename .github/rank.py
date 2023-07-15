from scoring import file_score, best_file_score
from pathlib import Path

if __name__ == '__main__':

    score_list = []

    for player in Path('.').glob('*'):
        if player.is_file():
            continue
        if player.stem.startswith('.'):
            continue

        result = best_file_score([x for x in player.glob('**/*') if x.is_file()])
        if result:
            path, score = result
            score_list.append((player.stem, path, score))

    score_list.sort(key=lambda x: x[2][2])
    ranking = "| Rank | Player | File | Length | Category | Score |\n"
    ranking += "| ---- | ------ | ---- | ------ | -------- | ----- |\n"
    for i, (player, path, score) in enumerate(score_list):
        ranking += f"| {i+1} | [{player}]({player}) | [{path.name}]({path}) | {score[0]} | {score[1]} | {score[2]} |\n"

    print(ranking)

    with open('README.md', 'r', encoding='utf-8') as f:
        content = f.read()
    
    BEGIN_FLAG = '<!-- begin of RANKING -->'
    END_FLAG = '<!-- end of RANKING -->'
    begin = content.find(BEGIN_FLAG)
    end = content.find(END_FLAG)
    if begin == -1 or end == -1:
        print('Error: README.md is not valid.')
        exit()

    content = content[:begin] + BEGIN_FLAG + '\n' + ranking + content[end:]

    with open('README.md', 'w', encoding='utf-8') as f:
        f.write(content)
