package com.example.calculosalario;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;

public class MainActivity extends AppCompatActivity {

    //RadioButton id_35, id_40, id_50;
    EditText idSalario;
    RadioGroup idRadioGroup;
    Button btCalcular;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        idSalario = (EditText) findViewById(R.id.idSalario);
        idRadioGroup = (RadioGroup) findViewById(R.id.idRadioGroup);
        btCalcular = (Button) findViewById(R.id.btCalcular);
        //nao precisa declarar porque ja ta no RaidoGroup
//        id_35 = (RadioButton) findViewById(R.id.id_35);
//        id_40 = (RadioButton) findViewById(R.id.id_40);
//        id_50 = (RadioButton) findViewById(R.id.id_50);

        btCalcular.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Crio uma Variavel de salario para pegar o salario de usuario
                double salario = Double.parseDouble(idSalario.getText().toString());
                //Crio uma opição para pagar o item selecionado do Radio Group
                int op = idRadioGroup.getCheckedRadioButtonId();
                //Crio uma Variavel para informar o novo salario
                double novo_salario = 0;

                if (op == R.id.id_35){
                    novo_salario = salario + (salario * 0.35);
                }
                if (op == R.id.id_40){
                    novo_salario = salario + (salario * 0.4);
                }
                if (op == R.id.id_50){
                    novo_salario = salario + (salario * 0.5);
                }

                AlertDialog.Builder result = new AlertDialog.Builder(MainActivity.this);
                    result.setTitle("Novo Salario!");
                    result.setMessage("Novo salario é: R$" + novo_salario);
                    result.setNeutralButton("ok", null);
                    result.show();
            }
        });

    }
}
