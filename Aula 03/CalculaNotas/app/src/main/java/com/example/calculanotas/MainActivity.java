package com.example.calculanotas;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    Button btCalcular;
    EditText idNome, idSobreNome, idNota1, idNota2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //Nunca colocar nomes com letra maiuscula, separar com " _ "
        idNome = (EditText) findViewById(R.id.idNome);
        idSobreNome = (EditText) findViewById(R.id.idSobreNome);
        idNota1 = (EditText) findViewById(R.id.idNota1);
        idNota2 = (EditText) findViewById(R.id.idNota2);
        btCalcular = (Button) findViewById(R.id.btCalcular);

        btCalcular.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                double nota_1 = Double.parseDouble(idNota1.getText().toString());
                double nota_2 = Double.parseDouble(idNota2.getText().toString());
                double total = 0;
                total = (nota_1 + nota_2) / 2;
                String Aprovado = " ";
                String Nome = idNome.getText().toString();
                if(total <=6){
                   Aprovado = "Reprovado";
                }
                if(total >=7){
                    Aprovado = "Aprovado";
                }
                if(total <=6.8){
                    Aprovado = "Recuperação";
                }

                AlertDialog.Builder result = new AlertDialog.Builder(MainActivity.this);
                result.setTitle("Calculo das Notas");
                result.setMessage("Nome: " + Nome + "\n" +"Nota:" + total + " Voce Está: " + Aprovado);
                result.setNeutralButton("ok" , null);
                result.show();
            }
        });
    }
}
