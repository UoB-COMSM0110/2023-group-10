# Members
![IMG_5126.jpg](static/IMG_5126.jpg)
- JeremyWang([@GoatWang](https://github.com/GoatWang))
- Ben Collingwood([@BCollingwd](https://github.com/BCollingwd))
- Conrad([@oo22625](https://github.com/oo22625))
- Xufeng Yin([@07536220107](https://github.com/07536220107))
- Ya02111([@Ya02111](https://github.com/Ya02111))

# Proposal
- Plan1: 

    ![Tank Script Storyboard](/static/PrototypeVideos/Tank.gif)

- Plan2: 

    ![Brick Dragon Video](/static/PrototypeVideos/DragonBubble.gif)

# Discussion Note
- [2022/02/14](https://hackmd.io/@836ko9MsR8aI9djOlrFkYg/HJP_qgZCj)
    - Class Layout
    - Division of labor
- [2022/03/03](https://hackmd.io/@TlCOUu7PQUOph9YfEY8ZcA/BJlT__00j)
    - Detailed Story
    - Class Design

# Git Process
1. Create branch and start develop.
```
git checkout -b '<branch_name>'
```

2. check you are on the right branch
```
git branch
```

3. commit the change 
```
git add .
git commit -m "<message>"
```

4. push: 
```
# first time you push the brach
git push -u origin <branch>

# if the branch has been recognized be the remote
git push
```

5. merge: do this after confirmed by all members of the team
```
git checkout master
git pull 
git merge '<branch_name>'
```

# Diagrams
Class diagram / Communication diagram / Sequence diagram
![class_diagram.png](static/class_diagram.png)
 
![communication_diagram.jpg](static/communication_diagram.jpg)

![sequence_diagram.png](static/sequence_diagram.png)

