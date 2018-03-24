/*author* Priyanshu Shrivastav
 *_ __ ___  _ __ ___ ___  _ ____   ___  ___| |_ 
 | '_ ` _ \| '__/ __/ _ \| '_ \ \ / / |/ __| __|
 | | | | | | | | (_| (_) | | | \ V /| | (__| |_ 
 |_| |_| |_|_|(_)___\___/|_| |_|\_/ |_|\___|\__|
 When I wrote this, only God and I understood what I was doing
    * Now, God only knows*/

#include <bits/stdc++.h>
#define fr(x,y,z) for(auto x=y;x!=z;++x)
#define all(v) v.begin(),v.end()
#define vit vector<int>::iterator it
#define sit set<int>::iterator it
#define pb push_back
#define se second
#define fi first
#define e(x) cout<<x<<" "
#define er(x, y) cout<<x<<" "<<y<<endl
#define eR(x, y, z) cout<<x<<" "<<y<<" "<<z<<endl
using namespace std;

void pV(vector<int>*v){vit;fr(it,v->begin(),v->end())e(*it);e(endl);}
void pS(set<int>* s){sit;fr(it,s->begin(),s->end())e(*it);e(endl);} 
int gcd(int a,int b){int t,x,y;x=max(a,b);y=min(a,b);while(y!=0){t=x;x=y;y=t%y;}return x;} 
int lcm(int a,int b){ return(a*b)/gcd(a,b);}
int start_s=clock();
void timer(){int stop_s=clock();cout<<"time taken: "<<(stop_s-start_s)/double(CLOCKS_PER_SEC)*1000<<endl;}

int main(int argc, char *argv[]){
	int n, ai;
	cin >> n;
	fr(i,0,n){cin >> ai;}
	return 0;
}

