package com.shanks.tempconverter

import android.app.AlertDialog
import android.content.DialogInterface
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.core.widget.addTextChangedListener
import com.google.android.material.dialog.MaterialAlertDialogBuilder
import com.google.android.material.dialog.MaterialDialogs
import com.shanks.tempconverter.databinding.ActivityMainBinding
import java.text.DecimalFormat

class MainActivity : AppCompatActivity() {

    lateinit var binding : ActivityMainBinding
    lateinit var selectedUnit: String

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        val df = DecimalFormat("#.##")//Decimal formatter
        selectedUnit = "Fahrenheit"

        binding.selectType.setOnClickListener() {
            showAlertDialog()
        }

        binding.editInput.addTextChangedListener() {
            val resultText: String
            val inputVal = binding.editInput.text.toString()
            if (inputVal.isNotEmpty()) {
                val doubleInput = inputVal.toDouble()
                if (selectedUnit == "Fahrenheit") {
                    resultText = df.format((doubleInput - 32) * 5 / 9)
                    binding.textResultType.text = "Celsius"
                } else {
                    //(0°C × 9/5) + 32
                    resultText = df.format((doubleInput * 9 / 5) + 32)
                    binding.textResultType.text = "Fahrenheit"
                }

                binding.textResult.text = resultText
            }

        }




    }

    private fun showAlertDialog(){
        val items = arrayOf("Fahrenheit", "Celsius")
        val checkedItem = -1

        val alertDialog = MaterialAlertDialogBuilder(this)
            .setTitle("Select Unit")
            .setSingleChoiceItems(
                items, checkedItem,
                DialogInterface.OnClickListener { dialog, which ->
                    selectedUnit = items[which]
                    binding.textType.setText(items[which])
                }
            ).setPositiveButton(
            android.R.string.ok,
            DialogInterface.OnClickListener { dialog, which ->
                dialog.dismiss()
            })

        val alert : androidx.appcompat.app.AlertDialog = alertDialog.create()
        alert.setCanceledOnTouchOutside(false)
        alert.show();


    }


}