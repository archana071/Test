package com.example.androidzillow;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONException;
import org.json.JSONObject;

import android.support.v7.app.ActionBarActivity;
import android.text.Html;
import android.text.method.LinkMovementMethod;
import android.app.ActionBar;
import android.app.ActionBar.LayoutParams;
import android.app.AlertDialog;
import android.app.TabActivity;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ImageSwitcher;
import android.widget.ImageView;
import android.widget.TabHost;
import android.widget.TabHost.TabSpec;
import android.widget.TableRow;
import android.widget.TextView;
import android.widget.Toast;
import android.widget.ViewSwitcher.ViewFactory;
import android.view.View.OnClickListener;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import com.example.androidzillow.R;

@SuppressWarnings("deprecation")
public class ResultActivity extends ActionBarActivity{
	 private ImageSwitcher imageSwitcher;
	 private int counter = 0;
	    private String[] images = new String[3];
	    private TextView zest_info;
	    private JSONObject result;
	    Button share;
	    
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_result);
		
		Intent intent = getIntent();
		Bundle extras = intent.getExtras();
		
		//TabHost th =getTabHost();
		if (extras != null) {
			
			TabHost tabs = (TabHost)findViewById(android.R.id.tabhost);
		    tabs.setup();

		    TabHost.TabSpec basic_info = tabs.newTabSpec("Basic Info");
	
		    basic_info.setContent(R.id.basic_info);
		    basic_info.setIndicator("Basic Info");
		    tabs.addTab(basic_info);
		    TabHost.TabSpec hist_zest = tabs.newTabSpec("Historical Zestimates");
		    hist_zest.setContent(R.id.hist_zest);
		    hist_zest.setIndicator("Historical Zestimates");
		    tabs.addTab(hist_zest);
			
		    
			
			
		    String value = extras.getString("JSON_data");
		   
		    try {
				JSONObject reader = new JSONObject(value);
				
				TextView r12=(TextView)findViewById(R.id.ttext12);
				TextView r14=(TextView)findViewById(R.id.ttext14);
				TextView r22=(TextView)findViewById(R.id.ttext22);
				TextView r24=(TextView)findViewById(R.id.ttext24);
				TextView r32=(TextView)findViewById(R.id.ttext32);
				TextView r34=(TextView)findViewById(R.id.ttext34);
				TextView r42=(TextView)findViewById(R.id.ttext42);
				TextView r44=(TextView)findViewById(R.id.ttext44);
				TextView r52=(TextView)findViewById(R.id.ttext52);
				TextView r54=(TextView)findViewById(R.id.ttext54);
				TextView r62=(TextView)findViewById(R.id.ttext62);
				TextView r64=(TextView)findViewById(R.id.ttext64);
				TextView r72=(TextView)findViewById(R.id.ttext72);
				TextView r74=(TextView)findViewById(R.id.ttext74);
				TextView r82=(TextView)findViewById(R.id.ttext82);
				TextView r84=(TextView)findViewById(R.id.ttext84);
				
				TextView r11=(TextView)findViewById(R.id.ttext11);
				TextView r13=(TextView)findViewById(R.id.ttext13);
				TextView r21=(TextView)findViewById(R.id.ttext21);
				TextView r23=(TextView)findViewById(R.id.ttext23);
				TextView r31=(TextView)findViewById(R.id.ttext31);
				TextView r33=(TextView)findViewById(R.id.ttext33);
				TextView r41=(TextView)findViewById(R.id.ttext41);
				TextView r43=(TextView)findViewById(R.id.ttext43);
				TextView r51=(TextView)findViewById(R.id.ttext51);
				TextView r53=(TextView)findViewById(R.id.ttext53);
				TextView r61=(TextView)findViewById(R.id.ttext61);
				TextView r63=(TextView)findViewById(R.id.ttext63);
				TextView r71=(TextView)findViewById(R.id.ttext71);
				TextView r73=(TextView)findViewById(R.id.ttext73);
				TextView r81=(TextView)findViewById(R.id.ttext81);
				TextView r83=(TextView)findViewById(R.id.ttext83);
				 
				JSONObject result = reader.getJSONObject("result");
				
				String useCode= result.getString("useCode");
				final String lastSoldPrice= result.getString("lastSoldPrice");
				String yearBuilt= result.getString("yearBuilt");
				String lastSoldDate= result.getString("lastSoldDate");
				String lotSizeSqFt= result.getString("lotSizeSqFt");
				String estimateLastUpdate= result.getString("estimateLastUpdate");
				
				String finishedSqFt= result.getString("finishedSqFt");
				 String estimateValueChangeSign= result.getString("estimateValueChangeSign");
				String esign= result.getString("estimateValueChangeSign");
				String resign= result.getString("restimateValueChangeSign");
			    final String estimateValueChange= result.getString("estimateValueChange");
				String bathrooms= result.getString("bathrooms");
				String estimateValuationRangeLow= result.getString("estimateValuationRangeLow");
				String estimateValuationRangeHigh= result.getString("estimateValuationRangeHigh");
				String bedrooms= result.getString("bedrooms");
				String restimateLastUpdate= result.getString("restimateLastUpdate");
				String estimateAmount= result.getString("estimateAmount");
				String taxAssessmentYear= result.getString("taxAssessmentYear");
				String restimateValueChangeSign= result.getString("restimateValueChangeSign");
				String restimateValueChange= result.getString("restimateValueChange");
				String taxAssessment= result.getString("taxAssessment");
				String restimateValuationRangeLow = result.getString("restimateValuationRangeLow" );
				String restimateValuationRangeHigh= result.getString("restimateValuationRangeHigh");
				String restimateAmount= result.getString("restimateAmount");
				    
				
				final String url = result.getString("homedetails");
			    TextView homedetails = (TextView)findViewById(R.id.homedetails);
			    final String street = result.getString("street");
			    final String city = result.getString("city");
			    final String state = result.getString("state");
			    final String zipcode = result.getString("zipcode");
			    homedetails.setText(
			            Html.fromHtml("<a href="+url+">"+street+", "+city+", "+state+"-"+zipcode+"</a>"));
			        homedetails.setMovementMethod(LinkMovementMethod.getInstance());  
			        TextView footer = (TextView)findViewById(R.id.textViewfooter);
				    
				    footer.setText(Html.fromHtml("<p><center>&copy Zillow, Inc., 2006-2014.<br> Use is subject to <a href='http://www.zillow.com/corp/Terms.htm'>Terms of Use</a><br><a href='http://www.zillow.com/zestimate/'>What's a Zestimate?</a></center></p>"));
				   
				    //footer.setText(Html.fromHtml("<a href="+url+">"+street+", "+city+", "+state+"-"+zipcode+"</a>"));
			       // homedetails.setMovementMethod(LinkMovementMethod.getInstance());
				    footer.setMovementMethod(LinkMovementMethod.getInstance());
				    
				   
				    r11.setText("Property Type :");
				    if(useCode.length()==0)useCode="N/A";
				    r12.setText(useCode);
				    
				    r13.setText("Last Sold Price");
				    if(lastSoldPrice.equals("0.00"))
				    {
				    	r14.setText("N/A");
				    }
				    else
				    {
				    r14.setText("$"+lastSoldPrice);
				    }
				    
				    r21.setText("Year Built :");
				    if(yearBuilt.length()==0)yearBuilt="N/A";
				    r22.setText(yearBuilt);
				    
				    r23.setText("Lat Sold Date :");
				    if(lastSoldDate.equals("01-Jan-1970")||lastSoldDate.equals("31-Dec-1969"))
				    		{
				    	          
				    	r24.setText("N/A");
				    		}
				    else
				    {
				    	
				    	r24.setText(lastSoldDate);
				    }
				   
				    
				    r31.setText("Lot Size :");
				    if(lotSizeSqFt.equals("0")) r32.setText("N/A");
				    else r32.setText(lotSizeSqFt+"sq.ft");
				    
				    r33.setText("Zestimate Property Estimate as of  "+estimateLastUpdate);
				    if(estimateAmount.equals("0.00")){r34.setText("N/A");}
				    else{r34.setText("$"+estimateAmount);}
				    
				    r41.setText("Finished Area :");
				    if(finishedSqFt.equals("0"))r42.setText("N/A");
				    else r42.setText(finishedSqFt+"sq.ft");
				    
				    
				    r43.setText("30 Day Overall Change :");
				    ImageView image1 = (ImageView)findViewById(R.id.img1);
				    if(estimateValueChange.equals("0.00"))
				    {
				    	r44.setText("N/A");
				    }
				    else{
				    	if(esign.equals("+"))
				    	{
				    		 
				    		 image1.setBackgroundResource(R.drawable.up_g);
				    	}else
				    	{
				    		image1.setBackgroundResource(R.drawable.down_r);
				    	}
				    r44.setText("$"+estimateValueChange);
				    }
				    
				    r51.setText("Bathrooms :");
				    if(bathrooms.length()==0)bathrooms="N/A";
				    r52.setText(bathrooms);
				    
				    r53.setText("All Time Property Range :");
				    if(estimateValuationRangeLow.equals("0.00")||estimateValuationRangeHigh.equals("0.00"))
				    {
				    	 r54.setText("N/A");
				    }
				    else
				    {
				       r54.setText( "$"+estimateValuationRangeLow+"-"+"$"+estimateValuationRangeHigh);
				    }
				   
				    r61.setText("Bedrooms :");
				    if(bedrooms.length()==0)bedrooms="N/A";
				    r62.setText(bedrooms);
				  
				    r63.setText("Rent Zestimate valuation as of  "+estimateLastUpdate);
				    if(restimateAmount.equals("0.00"))
				    {    r64.setText("N/A");
				        
				    }
				    else
				    {
				    	
				    	 r64.setText("$"+restimateAmount);
				    }
				    
				    
				    r71.setText("Tax Assessment Year:");
				    if(taxAssessmentYear.length()==0)taxAssessmentYear="N/A";
				    r72.setText(taxAssessmentYear);
				  
				    r73.setText("30 Day rent Change :");
				    ImageView image2 = (ImageView)findViewById(R.id.img);
				    if(restimateValueChange.equals("0.00"))
				    {
				    r74.setText("N/A");
				    }
				    else
				    {
				    	if(resign.equals("+"))
				    	{
				    		 
				    		 image2.setBackgroundResource(R.drawable.up_g);
				    	}else
				    	{
				    		image2.setBackgroundResource(R.drawable.down_r);
				    	}
				    	 r74.setText("$"+restimateValueChange);
				    }
				   
				    r81.setText("Tax Assessment :");
				    if(taxAssessment.equals("0.00"))r82.setText("N/A");
				    else r82.setText("$"+taxAssessment);
				   
				    r83.setText("All Time Rent Change :");
				    if(restimateValuationRangeLow.equals("0.00")||restimateValuationRangeHigh.equals("0.00"))
				    {
				    	 r84.setText("N/A");
				    }
				    else
				   {
				       r84.setText( "$"+restimateValuationRangeLow+"-"+"$"+restimateValuationRangeHigh);
				   }
				
					
				    
				    
				    
				    
				    JSONObject chart = reader.getJSONObject("chart");
					
					JSONObject oneYear = chart.getJSONObject("oneYear");
					final String oneYearimg = oneYear.getString("url");
					
					JSONObject fiveYear = chart.getJSONObject("fiveYears");
					final String fiveYearimg = fiveYear.getString("url");
					
					JSONObject tenYear = chart.getJSONObject("tenYears");
					final String tenYearimg = tenYear.getString("url");
					images[0]=oneYearimg;
					images[1]=fiveYearimg;
					images[2]=tenYearimg;
					imageSwitcher = (ImageSwitcher)findViewById(R.id.imageSwitcher1);
				    new ImageLoadTask(images[0], imageSwitcher).execute();
					imageSwitcher.setFactory(new ViewFactory() {

				    	   public View makeView() {
				    	      ImageView myView = new ImageView(getApplicationContext());
				    	      myView.setScaleType(ImageView.ScaleType.FIT_XY);
				    	      myView.setLayoutParams(new ImageSwitcher.LayoutParams(LayoutParams.
				    	      MATCH_PARENT,LayoutParams.MATCH_PARENT));
				    	      return myView;
				    	       }

				    	   });
					
					zest_info = (TextView)findViewById(R.id.zest_info);
				    zest_info.setText("Historical Zestimate for the past 1 year");
				    TextView prop_info = (TextView)findViewById(R.id.prop_info);
				    prop_info.setText(street+", "+city+", "+state+"-"+zipcode);
				    
				    ImageView share = (ImageView) findViewById(R.id.fbShareimg);
				    share.setBackgroundResource(R.drawable.facebook_share_button);
				      share.setOnClickListener(new OnClickListener() {
						
				    	@SuppressWarnings("deprecation")
					public void onClick(View v) {
							// TODO Auto-generated method stub
				    		AlertDialog alert=new AlertDialog.Builder(ResultActivity.this).create();
							
							alert.setTitle("Post To Facebook");
							alert.setButton("Post Property Details", new DialogInterface.OnClickListener() {
								
				                public void onClick(DialogInterface dialog, int which) {
				                	startFBActivity(street, city, state, zipcode, url, lastSoldPrice, estimateValueChange, oneYearimg);
				                	dialog.dismiss();
				                }
				            });
							alert.setButton2("Cancel", new DialogInterface.OnClickListener() {

				                public void onClick(DialogInterface dialog, int which) {
				                    // TODO Auto-generated method stub
				                	dialog.dismiss();
				                }
				            });

				            alert.show();
				           
							
						}
					});
				    
				    
				    
					
					
					
					
					
					
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   

		}
	}	
	
	private void startFBActivity(String street, String city, String state, String zipcode,String homedetails, String price, String change, String img){
    	Intent intent=new Intent(this,Fb.class);
    	intent.putExtra("street",street);
    	intent.putExtra("city",city);
    	intent.putExtra("state", state);
    	intent.putExtra("zipcode", zipcode);
    	intent.putExtra("homedetails", homedetails);
    	intent.putExtra("price", price);
    	intent.putExtra("change", change);
       	intent.putExtra("img",img);
    	startActivity(intent);
    	 return;
    }
	public class ImageLoadTask extends AsyncTask<Void, Void, Bitmap> {

	    private String url;
	    private ImageSwitcher imageSwitcher;

	    public ImageLoadTask(String url, ImageSwitcher imageSwitcher) {
	        this.url = url;
	        this.imageSwitcher = imageSwitcher;
	    }

	    @Override
	    protected Bitmap doInBackground(Void... params) {
	        try {
	            URL urlConnection = new URL(url);
	            HttpURLConnection connection = (HttpURLConnection) urlConnection
	                    .openConnection();
	            connection.setDoInput(true);
	            connection.connect();
	            InputStream input = connection.getInputStream();
	            Bitmap myBitmap = BitmapFactory.decodeStream(input);
	            return myBitmap;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return null;
	    }

	    @Override
	    protected void onPostExecute(Bitmap result) {
	        super.onPostExecute(result);
	        Drawable drawable = new BitmapDrawable(getApplicationContext().getResources(), result);
	        imageSwitcher.setImageDrawable(drawable);
	    }

	}
	
	public void next(View view){
	      Toast.makeText(getApplicationContext(), "Next Image", 
	      Toast.LENGTH_LONG).show();
	      Animation in = AnimationUtils.loadAnimation(this,
	      android.R.anim.slide_in_left);
	      Animation out = AnimationUtils.loadAnimation(this,
	      android.R.anim.slide_out_right);
	      imageSwitcher.setInAnimation(in);
	      imageSwitcher.setOutAnimation(out);
	      if(counter == 0 || counter == 1) {  
	    	  try{
	    		  
	    		  if(counter == 1)
	    		  {
	    			  zest_info.setText("Historical Zestimate for the past 10 years");
	    			 
	    		  }
	    		  else 
	    		      zest_info.setText("Historical Zestimate for the past 5 years");
	    		  new ImageLoadTask(images[counter+1], imageSwitcher).execute();
	    		  counter++;
	    		 
		    	
	    	  }
	    	  catch(Exception ex){
	    		  ex.printStackTrace();
	    	  }
	    
	      }
	   }
	   public void previous(View view){
	      Toast.makeText(getApplicationContext(), "previous Image", 
	      Toast.LENGTH_LONG).show();
	      Animation in = AnimationUtils.loadAnimation(this,
	      android.R.anim.slide_out_right);
	      Animation out = AnimationUtils.loadAnimation(this,
	      android.R.anim.slide_in_left);
	      imageSwitcher.setInAnimation(out);
	      imageSwitcher.setOutAnimation(in);
	      if(counter == 1 || counter == 2) {  
	    	  try{
	    		  new ImageLoadTask(images[counter-1], imageSwitcher).execute();
	    		  counter--;
	    		  if(counter == 0)
	    			  zest_info.setText("Historical Zestimate for the past 1 year");
	    		  else 
	    			  zest_info.setText("Historical Zestimate for the past 5 years");

	    	  }
	    	  catch(Exception ex){
	    		  ex.printStackTrace();
	    	  }
	    
	      }
	   }
	
	
	
	
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.result, menu);
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
