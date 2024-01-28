function calcularSeno(x,y,z){
    let sumaXY=x+y;
    let productoSumaZ=sumaXY*z;
    let senoProducto=Math.sin(productoSumaZ);
    return senoProducto;
}
console.log(calcularSeno(1,3,4));