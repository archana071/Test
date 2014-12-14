package com.example.androidzillow;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONException;

import android.support.v7.app.ActionBarActivity;
import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;
import com.example.androidzillow.R;

public class MainActivity extends ActionBarActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		TextView valid_1=(TextView) findViewById(R.id.textView5);
   	 TextView valid_2=(TextView) findViewById(R.id.textView6);
   	 TextView valid_3=(TextView) findViewById(R.id.textView7);
   	 valid_1.setVisibility(View.INVISIBLE);
   	 valid_2.setVisibility(View.INVISIBLE);
   	 valid_3.setVisibility(View.INVISIBLE);
   	 TextView valid_4=(TextView) findViewById(R.id.textView8);
     valid_4.setVisibility(View.INVISIBLE);
		processData();
		
	}
	
 
	private void processData() {
		Button button = (Button) findViewById(R.id.button1);
		button.setOnClickListener(new View.OnClickListener() {
		    public void onClick(View v) {
		       // startActivity(new Intent(MainActivity.this,ResultActivity.class));
		    	 EditText streetAddress = (EditText) findViewById(R.id.editText2);
		    	 EditText city = (EditText) findViewById(R.id.editText1);
		    	 Spinner state = (Spinner) findViewById(R.id.spinner1);
		    	 TextView valid_1=(TextView) findViewById(R.id.textView5);
		       	 TextView valid_2=(TextView) findViewById(R.id.textView6);
		       	 TextView valid_3=(TextView) findViewById(R.id.textView7);
		         
		       	 
		    	  String streetString = streetAddress.getText().toString();
		    	  boolean noError = true;
		    	 valid_1.setVisibility(View.INVISIBLE);
		    	
		    	 if (streetString.length()==0) {
		    		 valid_1.setVisibility(View.VISIBLE);
		    		 valid_1.setText("This field is required");
		    		 noError=false;
					}
		    	 valid_2.setVisibility(View.INVISIBLE);
		    	  String cityString = city.getText().toString();
		    	 if (cityString.length()==0) {
		    		 valid_2.setVisibility(View.VISIBLE);
		    		 valid_2.setText("This field is Required");
		    		 noError=false;
					}
		    	 valid_3.setVisibility(View.INVISIBLE);
		    	  String stateString = (String)state.getSelectedItem();
		    	 if (stateString.equals("Choose State")) {
		    		 valid_3.setVisibility(View.VISIBLE);
		    		 valid_3.setText("This field is required");
		    		 noError=false;
					}
		    	 
		    	String url="";
		    	 if(noError)
		    	 {
		    		  
					try {
						
						/**String query1 =convertURL(streetString);
						String query2 = convertURL(cityString);
						String query3 = convertURL(stateString);**/
						String query1 =URLEncoder.encode(streetString,"UTF-8");
						String query2 =URLEncoder.encode(cityString,"UTF-8");
						String query3 = URLEncoder.encode(stateString,"UTF-8");
						//url = "http://awshw8-env.elasticbeanstalk.com/?stateInput="+query1+"&cityInput="+query2+"&stateInput=CA";
						url="http://awshw8-env.elasticbeanstalk.com/?streetInput="+query1+"&cityInput="+query2+"&stateInput="+query3;
						//url="http://cs-server.usc.edu:39299/ex.php?streetInput="+query1+"&cityInput="+query2+"&stateInput="+query3;
							} catch (UnsupportedEncodingException e) {
				
						e.printStackTrace();
					}
		    		 
		    	
					new LongOperation().execute(url);
			    }
			    	 
		    	 }
		    	 
		    	
		    	
		    	 
		});
	}
		////////////////////////////////////////////////////
	
	 
	 
	
	 
	  // Class with extends AsyncTask class
    private class LongOperation  extends AsyncTask<String, Void, Void> {
         
        private final HttpClient Client = new DefaultHttpClient();
        private String Content;
        private String Error =" ";
        private ProgressDialog Dialog = new ProgressDialog(MainActivity.this);
         
        //TextView uiUpdate = (TextView) findViewById(R.id.textView8);
         
        protected void onPreExecute() {
            // NOTE: You can call UI Element here.
             
            //UI Element
          //  uiUpdate.setText("Output : ");
            Dialog.setMessage("Downloading source..");
            Dialog.show();
        }
 
        // Call after onPreExecute method
        protected Void doInBackground(String... urls) {
            try {
                 
                // Call long running operations here (perform background computation)
                // NOTE: Don't call UI Element here.
                 
                // Server url call by GET method
                HttpGet httpget = new HttpGet(urls[0]);
                ResponseHandler<String> responseHandler = new BasicResponseHandler();
                Content = Client.execute(httpget, responseHandler);
                 
            } catch (ClientProtocolException e) {
                Error = e.getMessage();
                cancel(true);
            } catch (IOException e) {
                Error = e.getMessage();
                cancel(true);
            }
             
            return null;
        }
         
        protected void onPostExecute(Void unused) {
            // NOTE: You can call UI Element here.
             
            // Close progress dialog
            Dialog.dismiss();
             
           // if (!Error.equals(" ")) {
            if (Content.length()==0) {
            	 TextView uiUpdate=(TextView) findViewById(R.id.textView8);
            	 uiUpdate.setVisibility(View.VISIBLE);
                 uiUpdate.setText("No exact match found -- Verify that the given address is correct.");
                 
            } else {
                 
                //uiUpdate.setText("Output : "+Content);
            	Intent intent = new Intent(MainActivity.this, ResultActivity.class);
			  	intent.putExtra("JSON_data", Content);
			  	startActivity(intent);
                 
             }
        }
         
    }
		
		///////////////////////////////////////////////////////
	

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		int id = item.getItemId();
		if (id == R.id.action_settings) {
			return true;
		}
		return super.onOptionsItemSelected(item);
	}
}
