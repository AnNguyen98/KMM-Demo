package com.example.kmm_demo.android

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.example.kmm_demo.Platform
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val tv: TextView = findViewById(R.id.text_view)
        tv.text = Platform().uuid
    }
}
