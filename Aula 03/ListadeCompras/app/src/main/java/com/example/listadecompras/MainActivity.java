package com.example.listadecompras;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;

public class MainActivity extends AppCompatActivity {

    CheckBox idArroz, idFeijao, idTomate, idBatata, idGalinha, idCarne;
    Button btComprar;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        idArroz = (CheckBox) findViewById(R.id.idArroz);
        idBatata = (CheckBox) findViewById(R.id.idBatata);
        idFeijao = (CheckBox) findViewById(R.id.idFeijao);
        idTomate = (CheckBox) findViewById(R.id.idTomate);
        idGalinha = (CheckBox) findViewById(R.id.idGalinha);
        idCarne = (CheckBox) findViewById(R.id.idCarne);
        btComprar = (Button) findViewById(R.id.btComprar);

        btComprar.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                double valor = 0;
                if (idArroz.isChecked()){
                    valor += 2.50;
                }
                if (idFeijao.isChecked()){
                    valor += 3.50;
                }
                if (idTomate.isChecked()){
                    valor += 1.20;
                }
                if (idBatata.isChecked()){
                    valor += 5.20;
                }
                if (idCarne.isChecked()){
                    valor += 19.00;
                }
                if (idGalinha.isChecked()){
                    valor += 12.00;
                }

                AlertDialog.Builder result = new AlertDialog.Builder(MainActivity.this);
                result.setTitle("Resultada Da Compra!");
                result.setMessage("Valor: R$ " + valor);
                result.setNeutralButton("Ok", null);
                result.show();

            }
        });

     }
}
