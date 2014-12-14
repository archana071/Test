package com.example.androidzillow;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.view.Window;
import android.widget.Toast;

import com.example.androidzillow.R;
import com.facebook.FacebookException;
import com.facebook.FacebookOperationCanceledException;
import com.facebook.Session;
import com.facebook.UiLifecycleHelper;
import com.facebook.android.DialogError;
import com.facebook.android.Facebook;
import com.facebook.android.Facebook.DialogListener;
import com.facebook.android.FacebookError;
import com.facebook.widget.WebDialog;
import com.facebook.widget.WebDialog.OnCompleteListener;

public class Fb extends Activity {
	private UiLifecycleHelper uiHelper;
	private static final String APP_ID = "1564871057080338";
	private static final String[] PERMISSIONS = new String[] {"publish_stream"};

	private static final String TOKEN = "access_token";
        private static final String EXPIRES = "expires_in";
        private static final String KEY = "facebook-credentials";

	private Facebook facebook;
	String msgpost;

	@SuppressWarnings("deprecation")
	public boolean saveCredentials(Facebook facebook) {
        	Editor editor = getApplicationContext().getSharedPreferences(KEY, Context.MODE_PRIVATE).edit();
        	editor.putString(TOKEN, facebook.getAccessToken());
        	editor.putLong(EXPIRES, facebook.getAccessExpires());
        	return editor.commit();
    	}

    	@SuppressWarnings("deprecation")
		public boolean restoreCredentials(Facebook facebook) {
        	SharedPreferences sharedPreferences = getApplicationContext().getSharedPreferences(KEY, Context.MODE_PRIVATE);
        	facebook.setAccessToken(sharedPreferences.getString(TOKEN, null));
        	facebook.setAccessExpires(sharedPreferences.getLong(EXPIRES, 0));
        	return facebook.isSessionValid();
    	}
	

	
	@SuppressWarnings("deprecation")
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		facebook = new Facebook(APP_ID);
		restoreCredentials(facebook);
		requestWindowFeature(Window.FEATURE_NO_TITLE);
		
		msgpost = getIntent().getStringExtra("city");
		if (msgpost == null){
			msgpost = "Test wall post";
		}
	    	
		postToWall(msgpost);
	    	
			finishActivity(0);
	}

	public void doNotShare(View button){
		finish();
	}
	public void share(View button){
		if (! facebook.isSessionValid()) {
			loginAndPostToWall();
		}
		else {
			postToWall(msgpost);
		}
	}

	public void loginAndPostToWall(){
		 facebook.authorize(Fb.this, PERMISSIONS, Facebook.FORCE_DIALOG_AUTH,new LoginDialogListener());
	}

	private Context getCurrentContext(){
		return this;
	}
	
	@SuppressWarnings("deprecation")
	public void postToWall(String message){
		String street=getIntent().getStringExtra("street");
		String city=getIntent().getStringExtra("city");
		String state=getIntent().getStringExtra("state");
		String zipcode=getIntent().getStringExtra("zipcode");
		String link=getIntent().getStringExtra("homedetails");
		String price=getIntent().getStringExtra("price");
		String change=getIntent().getStringExtra("change");
		String image=getIntent().getStringExtra("img");
		Bundle params = new Bundle();
		params.putString("name", street+", "+city+", "+state+"-"+zipcode);
		params.putString("link",link);
		params.putString("caption", "Property Information from Zillow.com");
		params.putString("description","Last Sold Price: $"+price+" "+"30 Days overall Change: $"+change);
		params.putString("picture",image);
		 if(facebook.isSessionValid()){
			    WebDialog feedDialog = (
			            new WebDialog.FeedDialogBuilder(Fb.this,
			                facebook.getSession(),
			                params))
			            .setOnCompleteListener(new OnCompleteListener(){

							@Override
							public void onComplete(Bundle values,
									FacebookException error) {
								String postid=values.getString("post_id");
								if(postid != null)
									showToast("Posted Story, ID:"+postid);
								else
									showToast("Post Cancelled");
								finishActivity(0);
								finish();
							}})
			            .build();
			        feedDialog.show();
			    }else{
			    	facebook.authorize(this, PERMISSIONS, Facebook.FORCE_DIALOG_AUTH,new LoginDialogListener());
			    }
		}


       

	class LoginDialogListener implements DialogListener {
	    public void onComplete(Bundle values) {
	    	saveCredentials(facebook);
	    	postToWall(msgpost);
	    	/*Editor ed = PreferenceManager.getDefaultSharedPreferences(Post.this).edit();
            ed.putString(TOKEN, facebook.getAccessToken());
            ed.putLong(EXPIRES, facebook.getAccessExpires());
            ed.commit();
	    	if (msgpost != null){
			postToWall(msgpost);
		}else{
			showToast("Error inside LoginDialogListener onComplete method");
		}*/
	    }
	    public void onFacebookError(FacebookError error) {
	    	showToast("Posting failed!");
	        finish();
	    }
	    public void onError(DialogError error) {
	    	showToast("Posting failed!");
	        finish();
	    }
	    public void onCancel() {
	    	showToast("Post cancelled!");
	        finish();
	    }
	}

	private void showToast(String message){
		Toast.makeText(getApplicationContext(), message, Toast.LENGTH_SHORT).show();
	}
	
	 @Override
	    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
	        super.onActivityResult(requestCode, resultCode, data);
	        facebook.authorizeCallback(requestCode, resultCode, data);
	    }

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.fb, menu);
		return true;
	}
}

