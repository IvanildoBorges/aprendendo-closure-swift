//MARK: -Formato inicial de uma closure
// let driving = {
  
// }


//MARK: -Closure não recebe e nem retorna nada
// let driving = {
//   print("Eu estou viajando para o Canadá")
// }

// driving()


//MARK: -Closure recebe um parametro e retorna nada
// let driving = { (place: String) in
//   print("Eu estou viajando para a \(place)")
// }

// driving("Alemanha")


//MARK: -Retornando valores
// let driving = { (place: String) -> String in
//   return "Eu estou viajando para a \(place)"
// }

// let result = driving("Argentina")
// print(result)


//MARK: -Como passar Closures por parâmentros
// func travel(action: () -> Void) {  // representação de um tipo de closure que não recebe nada e não retorna nada: ()->void
//   print("Eu estou aqui!")
//   action()
//   print("Mas aqui!")
// }

// let closureMSG = { 
//   print("MUITO CANSADO!")
// }

// travel(action: closureMSG)


//MARK: -Sintaxe a direita
//Quando a função tem o ultimo valor como closure, podemos usar a sintaxe trainling cloure (sintaxe de closure a direita), omitindo o retorno
// func travel(action: () -> Void) {  
//   print("Eu estou aqui!")
//   action()
//   print("Mas aqui!")
// }

// travel() {  //chamando a função não recebendo nada, e atribuindo uma ação de print para closure 
//   print("MUITO CANSADO!")
// }


//MARK: -Sintaxe a direita (versão mais resumida)
// func travel(action: () -> Void) {  
//   print("Eu estou aqui!")
//   action()
//   print("Mas aqui!")
// }

// travel {  //como a função não recebe parametros, somente a closure, omiti-se o ()
//   print("MUITO CANSADO!")
// }


//MARK: -Sintaxe a direita (versão normal com mais paramentros)
// func travel(name: String, action: () -> Void) {  
//   print("Eu, \(name), estou aqui!")
//   action()
//   print("Mas aqui!")
// }

// travel(name: "Ivan") {  //como o ultimo paramentro da função ainda continua sendo uma closure, da pra usar a sintaxe a direita
//   print("MUITO CANSADO!")
// }


//MARK: -Usando closures como parametro quando a propria closure aceita parametros
// func travel(action: (String) -> Void) {  //dentro da closure não precisa colocar rotulo do parametro, só precisa do tipo. Ex: (String) ao inves de (nome: String)
//   print("Eu estou aqui!")
//   action("cansadão")
//   print("Mas aqui!")
// }

// travel { (nome: String) in
//   print("MUITO \(nome.uppercased())!")
// }


//MARK: -Usando closures como parametro quando a propria closure aceita parametros e retornando algo
// func travel(action: (String) -> String) {  //dentro da closure não precisa colocar rotulo do parametro, só precisa do tipo. Ex: (String) ao inves de (nome: String)
//   print("Eu estou aqui!")
//   let emocional = action("cansado")
//   print(emocional)
//   print("Mas aqui!")
// }

// travel { (nome: String) -> String in
//   return "MUITO \(nome.uppercased())!"
// }


// //MARK: -Simplificando a closure que recebe um parametro e retorna um valor
// func travel(action: (String) -> String) {
//   print("Eu estou aqui!")
//   let emocional = action("cansado")
//   print(emocional)
//   print("Mas aqui!")
// }

// // travel { (nome: String) -> String in  //versão normal
// //   return "MUITO \(nome.uppercased())!"
// // }

// // travel { nome -> String in  //tira o parentese e o tipo, pq o swift já sabe o retorno
// //   return "MUITO \(nome.uppercased())!"
// // }

// // travel { nome in  //tira o retorno da funcao, pq o swift já sabe o retorno
// //   return "MUITO \(nome.uppercased())!"
// // }

// // travel {  //troca o rotulo por $0 ou se tiver mais de um atributo $1, $2, etc
// //   return "MUITO \($0.uppercased())!"
// // }

// travel {  //como só tem uma expressão de uma linha, pode omitir o return
//   "MUITO \($0.uppercased())!"
// }


// //MARK: -Closure simplificada que recebe varios parametros e retorna um valor
// func travel(action: (String, Int) -> String) {
//   print("Eu estou aqui!")
//   let emocional = action("cansado", 100)
//   print(emocional)
//   print("Mas aqui!")
// }

// travel {
//   "MUITO, \($1)% \($0)!"
// }


//MARK: -Função que retorna uma closure
func travel() -> (String) -> Void {  //função travel() nao recebe paramentros e retorna uma closure: (String) -> Void. E essa closure recebe uma String como parametro (String) e não retorna nada: -> Void
  return {
    print("Eu estou aqui! MUITO \($0.uppercased())! Mas aqui!")
  }
}

let funcaoClosure = travel()  //funcaoClosure recebe o que travel() retorna, fazendo com que a constante funcaoClosure se torne uma closure

funcaoClosure("cansado")