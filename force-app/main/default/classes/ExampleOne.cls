public class ExampleOne {
    Integer entry=1;
    public void functionExample(Integer entry){
        if(entry==1){
            System.debug('Hello World for entry one');
        }
        else if(entry==2){
            System.debug('Hello World for entry two');
        }
        else if(entry==3){
            System.debug('Hello World for entry three');
        }
        else{
            System.debug('Enter a number from one to three');
        }
    }

}