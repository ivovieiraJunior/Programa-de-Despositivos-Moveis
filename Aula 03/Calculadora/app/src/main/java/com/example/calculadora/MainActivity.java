package com.example.calculadora;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {

    EditText idNumero01, idNumero02;
    Button btSomar, btSub,btMult, btDiv;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        idNumero01 = (EditText) findViewById(R.id.idNumero01);
        idNumero02 = (EditText) findViewById(R.id.idNumero02);
        //Declarar o Id do botão
        btSomar = (Button) findViewById(R.id.btSomar);
        //Nunca Esquecer de declarar o id para o botão
        btSub = (Button) findViewById(R.id.btSub);
        btMult = (Button) findViewById(R.id.btMult);
        btDiv = (Button) findViewById(R.id.btDiv);

        btSomar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                double nume1 = Double.parseDouble(idNumero01.getText().toString());
                double nume2 = Double.parseDouble(idNumero02.getText().toString());
                double resultado = nume1 + nume2;

                //Mostra Resultado na tela
                AlertDialog.Builder result = new AlertDialog.Builder(MainActivity.this);
                //Mostra titulo para o usuario
                result.setTitle("Resultado da Soma:");
                //Mostra a mensagem da operação
                result.setMessage("\n soma é:" + resultado);
                //mostra um botão
                result.setNeutralButton("ok", null);
                //inicia o Alert
                result.show();
            }
        });

        btSub.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                double nume1 = Double.parseDouble(idNumero01.getText().toString());
                double nume2 = Double.parseDouble(idNumero02.getText().toString());
                double resultado = nume1 - nume2;

                AlertDialog.Builder resulta = new AlertDialog.Builder(MainActivity.this);
                //Seta o titulo da Alerte
                resulta.setTitle("Resultado da Subtração:");
                //Seta a Mensagem dentro do Alerta
                resulta.setMessage("\n Subtração é:" + resultado);
                //Seta um Botao neutro click em qual quer lugar da tela
                resulta.setNeutralButton("ok", null);
                //da Inicia o Alert
                resulta.show();
            }
        });

        btMult.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                double nume1 = Double.parseDouble(idNumero01.getText().toString());
                double nume2 = Double.parseDouble(idNumero02.getText().toString());
                double resultado = nume1 * nume2;

                AlertDialog.Builder resultad = new AlertDialog.Builder(MainActivity.this);
                resultad.setTitle("Resultado da Multplicão:");
                //Seta a Mensagem dentro do Alerta
                resultad.setMessage("\n Multplicão é:" + resultado);
                //Seta um Botao neutro click em qual quer lugar da tela
                resultad.setNeutralButton("ok", null);
                //da Inicia o Alert
                resultad.show();
            }
        });

        btDiv.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                double nume1 = Double.parseDouble(idNumero01.getText().toString());
                double nume2 = Double.parseDouble(idNumero02.getText().toString());
                double resultado = nume1 / nume2;

                AlertDialog.Builder resultad = new AlertDialog.Builder(MainActivity.this);
                resultad.setTitle("Resultado da Divizão:");
                //Seta a Mensagem dentro do Alerta
                resultad.setMessage("\n Divizão é:" + resultado);
                //Seta um Botao neutro click em qual quer lugar da tela
                resultad.setNeutralButton("ok", null);
                //da Inicia o Alert
                resultad.show();

            }
        });

    }



}
