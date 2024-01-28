function numeroImparHataN(numero){
    if(typeof numero !== 'number'|| !Number.isInteger(numero)|| numero <=0){   // condiciones para numero entero positivo
        return 'Favor ingresar un numero entero positivo';
    }
    let impares=[]; // Arreglo para alojar los numeros de 1 al entero que se ingreso

    for(i=1; i <=numero; i+=2){   // Recorrer arreglo de impar en impar
        impares.push(i)           // Agregar numero impar al arreglo
    }
    return impares;               // Retornar arreglo
}  
console.log(numeroImparHataN(20));