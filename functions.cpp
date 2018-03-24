void pV(vector<int>*v){for(vector<int>::iterator it=v->begin();it!=v->end();it++)cout<<*it<<" ";cout<<endl;}
void pS(set<int>*s){for(set<int>::iterator it=s->begin();it!=s->end();it++)cout<<*it<<" ";cout<<endl;}
int gcd(int a,int b){int t,x,y;x=max(a,b);y=min(a,b);while(y!=0){t=x;x=y;y=t%y;}return x;} 
int lcm(int a,int b){return(a*b)/gcd(a,b);}
int start_s=clock();
void timer(){int stop_s=clock();cout<<"time taken: "<<(stop_s-start_s)/double(CLOCKS_PER_SEC)*1000<<endl;}
