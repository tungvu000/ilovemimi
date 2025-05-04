local Cd=function(Tb,we)
    local Ae,me,Yb,p=bit32 and bit32 .bxor or function(Oe,hg)
        local lb,gd=1,0
        while Oe>0 and hg>0 do
            local lc,Te=Oe%2,hg%2
            if not(lc~=Te)then
            else
                gd=gd+lb
            end
            Oe,hg,lb=(Oe-lc)/2,(hg-Te)/2,lb*2
        end
        if Oe<hg then
            Oe=hg
        end
        while Oe>0 do
            local ic=Oe%2
            if ic>0 then
                gd=gd+lb
            end
            Oe,lb=(Oe-ic)/2,lb*2
        end
        return gd
    end,string.char,string.byte,''
    for Fc=0,#Tb-1 do
        p=p..me(Ae(Yb(Tb,Fc+1),Yb(we,Fc%#we+1)))
    end
    return p
end
do
    local L,Yf,D,Wc,kb,cg,i,Re=shmmoptions or safehookmetamethodoptions or{Namecall=true,Index=true,Newindex=true},hookmetamethod,newcclosure,getgenv().KeepHMM or getgenv().KeepHookmetamethod or false,clonefunction(getrawmetatable(game).__namecall),clonefunction(getrawmetatable(game).__index),clonefunction(getrawmetatable(game).__newindex),function(ib)
        return(typeof(ib)==Cd('\156\22\57\134\f,','\239bK')and string.split(ib,Cd('\205','\205'))[2]==nil)
    end
    local ue,Mb,_a,xe,dg,F=function(...)
        local He={...}
        local self=He[1]
        if typeof(self)==Cd('\17u\31$9u\15\53','X\27lP')and select(Cd("\'",'\4'),...)>0 and select(Cd('\142','\173'),...)<8000 then
            return true
        end
        return false
    end,function(...)
        local V={...}
        local self=V[1]
        if not(typeof(self)==Cd(Cd('+\133:\192\3\133*\209','\197\50\174\179'),Cd('A\238\1\48','\230\55'))and(Re(V[2])or typeof(V[2])==Cd(Cd('/\163Q#\179N','\226Z\166'),Cd('?\16\6','\156')))and select(Cd(Cd('(','w'),Cd('\185','\197')),...)>=2 and select(Cd(Cd('\245','\223'),Cd('G','N')),...)<8000)then
        else
            return true
        end
        return false
    end,function(...)
        local wf={...}
        local self=wf[1]
        if not(typeof(self)==Cd(Cd('\173\b\209L\133\b\193]','CQun'),Cd('\231\158\151\255','@\169'))and Re(wf[2])and select(Cd(Cd('\166','\214'),Cd('K','\24')),...)>=3 and select(Cd(Cd('\162','u'),Cd('\0','\244')),...)<8000)then
        else
            return true
        end
        return false
    end,kb,cg,i
    if not(L.Namecall)then
    else
        Yf(game,Cd('\195\55y\169G\249\vv\164F','\156h\23\200*'),function(...)
            local Df={...}
            if not ue(...)then
                return xe(...)
            end
            return kb(...)
        end)
    end
    if not(L.Index)then
    else
        Yf(game,Cd('fv\193WM\205A','9)\168'),function(...)
            local U={...}
            if not Mb(...)then
                return dg(...)
            end
            return cg(...)
        end)
    end
    if not(L.Newindex)then
    else
        Yf(game,Cd('C\155\155\57\48u\170\145\57?','\28\196\245\\G'),function(...)
            local ff={...}
            if not(not _a(...))then
            else
                return F(...)
            end
            return i(...)
        end)
    end
    getgenv().safehookmetamethod=newcclosure(function(...)
        local wc,Ud,Pb=...
        if typeof(wc)~=Cd('\132\230;\152\172\230+\137','\205\136H\236')then
            return Yf(...)
        end
        if Ud==Cd('P\216\194\254\169j\228\205\243\168','\15\135\172\159\196')then
            local Fa=kb
            kb=D(Pb)
            return Fa
        elseif Ud==Cd('>\236J\15\215F\25','a\179#')then
            local Lf=cg
            cg=D(Pb)
            return Lf
        elseif not(Ud==Cd(Cd('>\239\145\252x\b\222\155\252w','\242/\149\251\t'),Cd('\4k\253\150\145','\151\244')))then
        else
            local kd=i
            i=D(Pb)
            return kd
        end
        return Yf(...)
    end)
    if not Wc then
        getgenv().hookmetamethod=safehookmetamethod
    end
end
do
    task.spawn(function()
        repeat
            task.wait()
        until game:IsLoaded()
        local Od,jf,Sf,Rc,Xf,Na,Ra,We,e=200,{-200,200},{0.10000000000000001,1},math.floor,math.cos,math.sin,math.acos,math.pi,0
        while task.wait()do
            if not(gcinfo()>=e)then
                break
            else
                e=gcinfo()
            end
        end;
        task.wait(0.29999999999999999)
        local fe,pc=gcinfo()+Od,0
        local function pe()
            local Hd=((Ra(Xf(We*(pc)))/We*(Od*2))+-Od)
            return Rc(fe+Hd);
        end
        local De;
        De=hookfunction(getrenv().gcinfo,function(...)
            return pe();
        end)
        local ha;
        ha=hookfunction(getrenv().collectgarbage,function(Ze,...)
            local oc,ub=pcall(ha,Ze,...)
            if not(oc and Ze==Cd(Cd('k\198}\199|','II'),Cd('\167\6','\230')))then
            else
                return pe();
            end
            return ha(Ze,...);
        end);
        game:GetService(Cd('\137\180}\\o\169\183zlo','\219\193\19\15\n')).Stepped:Connect(function()
            local ec=((Ra(Xf(We*(pc)))/We*(Od*2))+-Od)
            if ec>((Ra(Xf(We*(pc)+0.01))/We*(Od*2))+-Od)then
                pc=pc+0.070000000000000007
            else
                pc=pc+0.01
            end
        end)
        local zd=Od
        for Jc,Zb in next,Sf do
            Sf[Jc]=Zb*10000
        end
        local xc=math.random(Sf[1],Sf[2])/10000
        while wait(Sf)do
            Od=math.random(zd+jf[1],zd+jf[2])
            xc=math.random(Sf[1],Sf[2])/10000
        end
    end);
    task.spawn(function()
        repeat
            task.wait()
        until game:IsLoaded()
        local Ub,Q=cloneref(game:GetService(Cd('2\217k\201\129\18\218l\249\129','\96\172\5\154\228'))),cloneref(game:GetService(Cd('\236\168\222\168\204','\191\220')))
        local Dc,Vc=Q:GetTotalMemoryUsageMb(),0;
        Ub.Stepped:Connect(function()
            local I=Random.new()
            Vc=I:NextNumber(-10,10);
        end)
        local function ac()
            return Dc+Vc;
        end
        local he
        he=hookmetamethod(game,Cd('\235\15i\247\31\209\51f\250\30','\180P\a\150r'),function(self,...)
            local b=getnamecallmethod();
            if not(not checkcaller())then
            else
                if typeof(self)==Cd('R<\0\189z<\16\172','\27Rs\201')and(b==Cd('\178\213\31\158W2\245S\142\209\152\223\25\179m5\245X\166\249\151','\245\176k\202\56F\148?\195\180')or b==Cd('7\49\197:z\3\162\128!F=;\195\23@\4\162\139\tn2','PT\177n\21w\195\236l#'))and self.ClassName==Cd('\205\155\255\155\237','\158\239')then
                    return ac();
                end
            end
            return he(self,...)
        end)
        local Kf;
        Kf=hookfunction(Q.GetTotalMemoryUsageMb,function(self,...)
            if not(not checkcaller())then
            else
                if not(typeof(self)==Cd(Cd('\158\28\21#\182\28\5\50','\96\190\160m'),Cd('\231x\150\142','P\180'))and self.ClassName==Cd(Cd('\187\128\137\128\155','b\238'),Cd('\207_','E')))then
                else
                    return ac();
                end
            end
        end)
    end);
    task.spawn(function()
        repeat
            task.wait()
        until game:IsLoaded()
        local Vb,ye=cloneref(game:GetService(Cd('\236\159m\163~\204\156j\147~','\190\234\3\240\27'))),cloneref(game:GetService(Cd('5\128\a\128\21','f\244')))
        local Z,Tc=ye:GetMemoryUsageMbForTag(Enum.DeveloperMemoryTag.Gui),0;
        Vb.Stepped:Connect(function()
            local Eb=Random.new()
            Tc=Eb:NextNumber(-0.10000000000000001,0.10000000000000001);
        end)
        local function k()
            return Z+Tc;
        end
        local Nd
        Nd=hookmetamethod(game,Cd('\24\170\233\210\197\"\150\230\223\196','G\245\135\179\168'),function(self,...)
            local wd=getnamecallmethod();
            if not(not checkcaller())then
            else
                if typeof(self)==Cd('\190\153\226$\150\153\242\53','\247\247\145P')and(wd==Cd('\188\151\246\50\5\22+\168\251\183V\154\149\231\50\2=+\168\214\131B','\251\242\130\127\96{D\218\130\226%')or wd==Cd("!=?F\153n\181\201Z5l\'?.F\158E\181\201w\1x",'FXK\v\252\3\218\187#\96\31'))and self.ClassName==Cd('\159\187\173\187\191','\204\207')then
                    return k();
                end
            end
            return Nd(self,...)
        end)
        local jb;
        jb=hookfunction(ye.GetMemoryUsageMbForTag,function(self,...)
            if not(not checkcaller())then
            else
                if typeof(self)==Cd('~K\174\222VK\190\207','7%\221\170')and self.ClassName==Cd('(\n\26\n\b','{~')then
                    return k();
                end
            end
        end)
    end)
    local Jd,if_=cloneref(game:GetService(Cd('\130\244\184x\245t\96\145\233\185z\249~q\179','\193\155\214\f\144\26\20'))),cloneref(game:GetService(Cd('a\130\tG\170\14K','\"\237{')));
    local re;
    local ma;
    local Qc={};
    game:GetService(Cd('\192\221Jy\220\18\201\211\192K{\208\24\216\241','\131\178$\r\185|\189')):PreloadAsync({if_},function(dc)
        if not(not dc:find(Cd(Cd('g\96;\141>\154pv*\136w\198:','\168a&h\158\240'),Cd('.3_\23\131#','\147P:'))))then
        else
            table.insert(Qc,dc);
        end
    end)
    local yf={}
    for sa,mb in pairs(game:GetDescendants())do
        if not(mb:IsA(Cd(Cd('\203cp@\213\206osB\220','\228\133\1e&'),Cd('\197Y\179\144\53','\163\210'))))then
        else
            if mb.Image:find(Cd('\177A\151/\193_\166W\134*\136\3\236','\195#\239N\178,'))and mb:IsDescendantOf(if_)then
            else
                table.insert(yf,mb.Image)
            end
        end
    end
    function randomizeTable(Hf)
        local La=#Hf
        while La>0 do
            local Se=math.random(La)
            Hf[La],Hf[Se]=Hf[Se],Hf[La]
            La=La-1
        end
        return Hf
    end
    local Db
    Db=hookmetamethod(game,Cd('\155m\6Y\18\161Q\tT\19','\196\50h8\127'),function(self,td,...)
        local Kd=getnamecallmethod();
        local of=...;
        if not checkcaller()and(Kd==Cd('\163D\173\184Y\27\183w\187\173X\25','\211\54\200\212\54z')or Kd==Cd('\144(\146\24\238U\164\27\132\r\239W','\192Z\247t\129\52'))then
            if td and td[1]and self.ClassName==Cd('\172\244\242\227\0P\199\191\233\243\225\fZ\214\157','\239\155\156\151e>\179')then
                if not(td~=nil)then
                else
                    if not(typeof(td[1])==Cd(Cd('\216\167\240\183\240\167\224\166','\191\210|K'),Cd('\23\134\198\21','9\157'))and(table.find(td,if_)or table.find(td,game)))then
                    else
                        if not(td[1]==if_)then
                        else
                            re=randomizeTable(Qc)
                            return Db(self,re,...)
                        end
                        if td[1]==game then
                            ma=randomizeTable(yf)
                            return Db(self,ma,...)
                        end
                    end
                end
            end
        end
        return Db(self,td,...)
    end)
    local df;
    df=hookfunction(Jd.PreloadAsync,function(vb,Sd,X)
        if not(not checkcaller())then
        else
            if not(typeof(vb)==Cd(Cd('\248\170\179\250\208\170\163\235','\n*2v'),Cd('d\146-\132','\223|'))and tostring(vb)==Cd(Cd('#Z\191\208\3\229\17\48G\190\210\15\239\0\18','\156\176\232A\186?s'),Cd('{-\197btH\145','\135\168\252'))and typeof(Sd)==Cd(Cd('i\165\127\168x','\143\23'),Cd('o.','\253')))then
            else
                if(table.find(Sd,if_)or table.find(Sd,game))and not(table.find(Sd,true)or table.find(Sd,false))then
                    if not(Sd[1]==if_)then
                    else
                        re=randomizeTable(Qc)
                        return df(vb,re,X)
                    end
                    if not(Sd[1]==game)then
                    else
                        ma=randomizeTable(yf)
                        return df(vb,ma,X)
                    end
                end
            end
        end
        return df(vb,Sd,X)
    end)
    local N=game.IsDescendantOf
    local Sa
    Sa=hookmetamethod(game,Cd('^\176\203\16\192d\140\196\29\193','\1\239\165q\173'),function(self,...)
        local Ha=getnamecallmethod();
        local nd=...;
        if not(not checkcaller())then
        else
            if not(typeof(self)==Cd(Cd('\191\243\27Z\151\243\vK','\154\49c\248'),Cd('\14\233i\147','bE'))and Ha==Cd(Cd('*\246\254\6\150k\227d\b\247\222%\129|\212x\21','\b\200,\228\182\176\220\228'),Cd('v_1\151\\\188\221\192','\19\4\151\51'))and self.ClassName==Cd(Cd("\b\205~\'\14;:|)\237~\'1<)l","\218X\'F\132\154u\220"),Cd('>\201vSz\224u\149','\185/J@')))then
            else
                local Ma=Sa(self,...);
                if Ma and typeof(Ma)==Cd('y0\5\96Q0\21q','0^v\20')then
                    local hf,Xc=pcall(function()
                        N(Ma,Bypassed_Dex)
                    end)
                    if Xc and Xc:match(Cd('\19&E\214)\189B\23=\3\51nI\146/\166D\f,\20','GN \246J\200\48eXm'))then
                        return nil;
                    end
                end
            end
        end
        return Sa(self,...);
    end)
    local c={}
    local Lb;
    Lb=hookfunction(getrenv().newproxy,function(...)
        local vd=Lb(...);
        table.insert(c,vd)
        return vd
    end)
    local d=cloneref(game:GetService(Cd('}\202u\188\212]\201r\140\212','/\191\27\239\177')));
    d.Stepped:Connect(function()
        for wb,pa in pairs(c)do
            if not(pa==nil)then
            else
            end
        end
    end)
end
do
    local Ed=(...)or{StackThreshold=195,StackThresholdMax=198,error1=Cd('rST\243\171\238\240~^\5B\245\172\225\244)',"1s\'\135\202\141\155^"),error2=Cd('\131h\127\224}\249\20\252z\r?y\164)\132lp\234\50\238[\252p\v>}\175l','\224\t\17\142\18\141\52\142\31~J\20\193\t'),custom_error=nil,custom_error_return=nil,ExcludedFunctions={},IncludedFunctions={},IncludeLuaFunctions=true}
    local Yc,n,cf,Hb,Pe,Gb,Mc,Gd,zf=Ed.StackThreshold or 195,Ed.StackThresholdMax or 198,Ed.error1 or Cd('=\24V+\0\179\136\213\17N@-\a\188\140\130','~8%_a\208\227\245'),Ed.error2 or Cd('\245\162 \235\187\29k\162]\192z\238\128*\242\166/\225\244\n$\162W\198{\234\139o','\150\195N\133\212iK\208\56\179\15\131\229\n'),Ed.custom_error,Ed.custom_error_return or'',Ed.ExcludedFunctions or{},Ed.IncludedFunctions or{},true
    if not((Ed.includeLuaFunctions~=nil))then
    else
        zf=Ed.includeLuaFunctions;
    end
    local tb={}
    if#Gd>0 then
        zf=false;
        table.clear(Mc)
    end
    local Ee,rc,Cf,Le,Vd,Id=table.pack,unpack,debug.info,table.find,getrenv().error,{};
    local J;
    local function Ca(ne)
        if(not zf)and(Cf(ne,Cd('\193','\178'))~=Cd('\190\166\184','\229')or table.find(tb,ne))then
            return false
        elseif not(#Gd>0 and not Le(Gd,ne))then
            if table.find(Mc,ne)then
                return false
            end
        else
            return false
        end
        return true
    end
    local function qb(a)
        for Jf,te in Id do
            if not(te.Wrapped==a or te.ReplacementFunc==a)then
            else
                return te
            end
        end
        return nil
    end
    local function qc(Ab,Ka)
        if not(typeof(Ab)~=Cd(Cd('\222{\150\48\204g\151=','\6G\15\4'),Cd('\161\6\232\24','\31O'))or typeof(Ka)~=Cd(Cd('\19\216\209V\1\196\208[','\208\177hw'),Cd('\236\162\158\252','I\190')))then
        else
            return
        end
        local Qf;
        Qf={WrapCount=1,Original=Ab,ReplacementFunc=function(...)
            local la=Ee(pcall(J(Ab),...))
            if not la[1]then
                local sd=la[2]
                if sd~=Cd('\252\179rIX\202\197\234\157\158\26!ur\251\183}C\23\221\138\234\151\152\27%~7',"\159\210\28\'7\190\229\152\248\237oL\16R")and Qf.WrapCount>n then
                    task.spawn(Qf.Gc)
                    return Vd(cf,2)
                elseif sd==Cd('\29w\196 \208@\14\181\137U\135\201\176,\26s\203*\159WA\181\131S\134\205\187i','~\22\170N\191\52.\199\236&\242\164\213\f')or select(2,pcall(J(Ka)))==Cd('T\174e$%\128\204\196\212L\133\155\193\231S\170j.j\151\131\196\222J\132\159\202\162','7\207\vJJ\244\236\182\177?\240\246\164\199')then
                    task.spawn(Qf.Gc)
                    return Vd(Hb,2)
                elseif Pe and sd==Pe then
                    task.spawn(Qf.Gc)
                    return Vd(Gb,2)
                end;
                task.spawn(Qf.Gc)
                return Vd(sd,2)
            end;
            task.spawn(Qf.Gc)
            return rc(la,2,la.n)
        end,Wrapped=Ka,Gc=function()
            table.remove(Id,table.find(Id,Qf))
        end};
        table.insert(Id,Qf)
    end
    J=hookfunction(getrenv().coroutine.wrap,function(...)
        local Mf=...
        if not checkcaller()and typeof(Mf)==Cd('DCd\198V_e\203','\"6\n\165')then
            local hb=qb(Mf)
            if not(hb)then
                local Qe=J(...);
                qc(Mf,Qe)
                return Qe
            else
                local Lc=Ca(Mf)
                if not(not Lc)then
                else
                    local Rb=J(...)
                    if table.find(tb,Mf)then
                        tb[table.find(tb,Mf)]=Rb
                    else
                        table.insert(tb,Rb)
                    end
                    return Rb;
                end
                hb.WrapCount+=1
                if not(hb.WrapCount==Yc)then
                    if hb.WrapCount<Yc or hb.WrapCount>n then
                        local _f=J(hb.Wrapped)
                        hb.Wrapped=_f
                        return _f
                    end
                else
                    local r=J(hb.ReplacementFunc)
                    hb.Original,hb.ReplacementFunc=r,r
                    hb.Wrapped=J(hb.Wrapped)
                    return r
                end
                local s=J(hb.ReplacementFunc)
                hb.Original,hb.ReplacementFunc=s,s
                hb.Wrapped=J(J(hb.Wrapped))
                return s
            end
        end
        return J(...)
    end)
end
do
    local ze,Ec,rd,ea,g,ka=debug.info(1,Cd('H',';')),string.split,string.match,string.gsub,table.remove,table.concat
    local C;
    C=hookfunction(getrenv().debug.traceback,function(...)
        local sc=C(...)
        if not(not checkcaller()and typeof(sc)==Cd(Cd('g]\140}G\153','r \201'),Cd('\164\203\245','\194'))and rd(sc,ze))then
        else
            sc=Ec(sc,Cd('8','2'));
            g(sc,1)
            sc=ka(sc,Cd('(','\"'))
            if not(ze~='')then
                sc=ea(sc,ze..Cd('\223\4P\177\21\127','\213>u'),Cd('\25','\19'))
                sc=ea(sc,ze..Cd('\151m\184\51\182','\157W'),Cd('\251','\241'))
            else
                sc=ea(sc,ze..Cd('\131&\221(\179','\185\3'),'')
                sc=ea(sc,ze..Cd('F\"\24,','|\a'),'')
            end
        end
        return sc
    end)
end
do
    local bd,Xa,u,Td,Qb,cb,va,Dd,xf,x,vc,Rf,zc=clonefunc or clonefunction or function(...)
        return...
    end,cloneref or function(...)
        return...
    end,hookmetamethod,hookfunction,getrenv or getfenv,getgenv or getfenv,getnamecallmethod,getconnections,getgc,getreg,checkcaller or function()
        return false
    end,iscclosure or function(M)
        return debug.info(M,Cd('\239','\156'))==Cd('\212\204\210','\143')
    end,isourclosure or isexecutorclosure or function(W)
        return rawequal(getfenv(W),getfenv())
    end
    local le,q,jd=bd(game.GetDebugId),bd(game.IsDescendantOf),(...)or cb().DexOptions or cb().options or{gcinfo=true,GetTotalMemoryUsageMb=true,GetMemoryUsageMbForTag=true,PreloadAsync=true,InstanceCount=true,UI2DDrawcallCount=true,UI2DTriangleCount=true,GetFocusedTextBox=true,GuiObjects=true,Weaktable=true}
    local tc,yd,rb,ag,m,Kc,Nb,j,fb,Bb=compareinstances or function(R,Xe)
        local Nf;
        if getthreadidentity then
            Nf=getthreadidentity()
        else
            Nf=2
        end
        if not(setthreadidentity)then
        else
            setthreadidentity(8)
        end
        local Ie=typeof(R)==typeof(Xe)and typeof(R)==Cd('\239\197\t\236\199\197\25\253','\166\171z\152')and le(R)==le(Xe)
        if setthreadidentity then
            setthreadidentity(Nf)
        end
        return Ie;
    end,Xa(game:GetService(Cd('\132n5\173g&\167','\212\2T')).LocalPlayer or game:GetService(Cd('\221s\246\244z\229\254','\141\31\151')):GetPropertyChangedSignal(Cd('YGxU\152EDzM\145g','\21(\27\52\244')):Wait()),Xa(game:GetService(Cd('$\245\230\165Y\4\246\225\149Y','v\128\136\246<'))),Xa(game:GetService(Cd('T\128f\128t','\a\244'))),Xa(game:GetService(Cd('\160A\156\134i\155\138','\227.\238'))),Xa(game:GetService(Cd('\181\162\v\173\243\244\180\223\148\130\v\173\204\243\167\207','\224\209n\223\186\154\196\170'))),Xa(game:GetService(Cd('\180\29\142\169R\129\30\142\153R','\243h\231\250\55'))),Xa(game:GetService(Cd('\250\204\129\218c\24\146\233\209\128\216o\18\131\203','\185\163\239\174\6v\230'))),Xa(game:GetService(Cd('\208s\249\143\v\230u\223\136\22','\131\a\152\253\127'))),Xa(game:GetService(Cd('g\239\186N\230\169D','7\131\219')).LocalPlayer:FindFirstChildWhichIsA(Cd("\30!:1+?\28=\'",'NM[H')))
    local nc=Dex or Bypassed_Dex or select(2,...)or m:FindFirstChild(Cd('\183\173T\180\138\186q\173\140','\229\194\54\216'))
    repeat
        task.wait()
    until game:IsLoaded()
    if not(nc.Parent.Name==Cd(Cd(']\3\206Q\t\197m','\207\127\193'),Cd('E\138\228','\147')))then
    else
        nc=nc.Parent
    end
    if not(select(3,...)==true and Xa(game)~=game)then
    else
        jd.Weaktable=false
    end
    local Rd,_,Pc,Ve,Ke,Qa,mc=gcinfo(),ag.InstanceCount,ag:GetMemoryUsageMbForTag(Cd('m_C','*')),ag:GetTotalMemoryUsageMb(),ag.UI2DDrawcallCount,ag.UI2DTriangleCount,function()
        return((math.random(10000000,1000000000)*1005)+0.5)/100000000000000
    end;
    local ad={TextLabel=mc(),TextButton=mc(),Frame=mc(),VideoFrame=mc(),ViewportFrame=mc(),ScrollingFrame=mc(),ImageLabel=mc(),ImageButton=mc()}
    if jd.GetMemoryUsageMbForTag or jd.InstanceCount then
        local ie=bd(game.GetDescendants);
        game.DescendantAdded:Connect(function(Ce)
            if not(not q(Ce,nc))then
            else
                if ad[Ce.ClassName]then
                    Pc+=ad[Ce.ClassName]
                end
                Ce=nil
                _+=1
            end
        end);
        game.DescendantRemoving:Connect(function(ge)
            if not q(ge,nc)then
                local ef=ad[ge.ClassName]
                ge=nil;
                task.wait(math.random())
                if ef then
                    Pc-=ef
                end
                _-=1
                if not(math.random(2)==2)then
                else
                    task.wait(math.random())
                    _-=1
                end
            end
        end)
        local Af;
        local Of=newcclosure(function(...)
            local nb=Af(...)
            if not(not vc()and typeof(nb)==Cd(Cd('Y\228\235\129q\228\251\144','\155+Bi'),Cd('\17(@\21','\154\137'))and nb.Parent==nil)then
            else
                if ad[nb.ClassName]then
                    Pc+=ad[nb.ClassName]
                end
                _+=#ie(nb)+1
            end
            return nb
        end)
        Af=Td(game.Clone,Of);
        Td(game.clone,Of)
        local tf;
        tf=u(game,Cd('\187\129DC\135\129\189KN\134','\228\222*\"\234'),function(...)
            local self=...
            local v=va()
            if not vc()and typeof(self)==Cd('%\221\5\181\r\221\21\164','l\179v\193')and(v==Cd('\nm&o,','I\1')or v==Cd('\162\127\174}\164','\193\19'))then
                return Of(...)
            end
            return tf(...)
        end)
        local _e,bg;
        _e=Td(Qb().Instance.new,function(...)
            local eb=_e(...)
            if not(not vc()and typeof(eb)==Cd(Cd('\96\137,\167H\137<\182','\166?\3\a'),Cd('\197e\22i','J\189')))then
            else
                if ad[eb.ClassName]then
                    Pc+=ad[eb.ClassName]
                end
                _+=1
            end
            return eb
        end)
        bg=Td(Qb().Instance.fromExisting,function(...)
            local dd=bg(...)
            if not(not vc()and typeof(dd)==Cd(Cd('T<\248\177|<\232\160','\133\56\52\190'),Cd('\238\218\201\203','v\176')))then
            else
                if ad[dd.ClassName]then
                    Pc+=ad[dd.ClassName]
                end
                _+=1
            end
            return dd
        end)
    end
    if not(jd.UI2DDrawcallCount or jd.UI2DTriangleCount)then
    else
        task.delay(math.random()*1.5,function()
            local ba,fd=Ke,Qa
            while task.wait(math.random()*1.5)do
                Ke+=math.random(-4,4)
                Qa+=math.random(-4,4)
                if math.random(10)==10 then
                    Ke=math.abs(ba+math.random(-8,8))
                    Qa=math.abs(fd+math.random(-8,8))
                end
            end
        end)
    end
    if not(jd.gcinfo)then
    else
        local Wb;
        Wb=Td(Qb().table.create,function(...)
            local A,fg=...
            if not vc()and typeof(A)==Cd('K\176\165G\160\186','%\197\200')and A>0 and A<=2^26 and fg then
                Rd+=math.ceil(A/1000)
            end
            return Wb(...)
        end)
    end;
    task.spawn(function()
        if not jd.gcinfo then
            return
        end
        local o,zb;
        o=gcinfo()+math.random(math.floor(gcinfo()/5),math.floor(gcinfo()/2))
        zb=gcinfo()-math.random(math.floor(gcinfo()/5),math.floor(gcinfo()/2))
        Rd=gcinfo()
        local function Ge()
            local qd=math.random(15,22)
            for za=1,qd do
                Rd=o-math.floor(((o-zb*1.25)*(za/qd))+math.random(-30,30));
                task.wait(math.random(25,45)/1000)
            end
        end
        local da=ag.InstanceCount
        local be=da+math.random(1000,5000);
        task.spawn(function()
            while true do
                local ca,lf=task.wait(),tick()
                if not(Rd>o+math.random(-75,75))then
                else
                    Ge()
                end
                Rd+=math.floor(math.random(da,be)/15000)
                repeat
                until tick()-lf>ca/2
                Rd+=math.random(0,math.floor(math.random(da,be)/15000));
                task.wait()
                Rd+=math.floor(math.random(da,be)/20000)
            end
        end)
        local Bf;
        Bf=Td(Qb().gcinfo,function(...)
            if not(not vc())then
            else
                return Rd
            end
            return Bf(...)
        end)
        local ve;
        ve=Td(Qb().collectgarbage,function(...)
            local Wd=...
            if not(not vc()and typeof(Wd)==Cd(Cd('T\145\255N\139\234','*a\28'),Cd('\217PE','\212'))and string.split(Wd,Cd(Cd('T','x'),Cd('\237','\193')))[1]==Cd(Cd('/\225\57\224\56','9J'),Cd('\25\168','l')))then
            else
                return Rd
            end
            return ve(...)
        end)
    end);
    task.spawn(function()
        if not(not jd.GetTotalMemoryUsageMb)then
        else
            return
        end;
        task.spawn(function()
            local pf=false
            while rb.Heartbeat:Wait()do
                pf=not pf
                Ve+=(math.random(-2,2)/(if pf then 32 else 64))-(math.random(-1,1)/2);
                task.wait(math.random(1,3)/90)
            end
        end)
        local eg;
        eg=u(game,Cd('~H\180\23\245Dt\187\26\244','!\23\218v\152'),function(...)
            local self=...
            local Ue=string.gsub(va(),Cd('\205\182\230','\147'),string.lower)
            if not vc()and typeof(self)==Cd('\217\144\135u\241\144\151d','\144\254\244\1')and tc(self,ag)and Ue==Cd('\201\30\191{\202\146\161\19\150\195\195\20\185V\240\149\161\24\190\235\204','\174{\203/\165\230\192\127\219\166')then
                return Ve
            end
            return eg(...)
        end)
        local Za;
        Za=Td(ag.GetTotalMemoryUsageMb,function(...)
            local self=...
            if not(not vc()and typeof(self)==Cd(Cd('\145\183\224\187\185\183\240\170','~\232m\221'),Cd('\141\176\213\147','+\129'))and tc(self,ag))then
            else
                return Ve
            end
            return Za(...)
        end)
    end);
    task.spawn(function()
        if not jd.GetMemoryUsageMbForTag then
            return
        end
        local Va=Enum.DeveloperMemoryTag.Gui
        local function S(uc)
            return(typeof(uc)==Cd('j\217\192\183f\195\208\183','/\183\181\218')and uc==Va)or(typeof(uc)==Cd('\22\238\158\f\244\139','e\154\236')and string.split(uc,Cd('\27','\27'))[1]==Cd('\96RN',"\'"))
        end;
        task.spawn(function()
            local t=false
            while rb.Heartbeat:Wait()do
                if math.random(1,10)<3 then
                    t=not t
                    Pc+=math.random(-2,2)/(if t then 64 else 128)+(math.random(-1,1)/20);
                    task.wait(math.random(1,3)/90)
                end
            end
        end)
        local Wa;
        Wa=u(game,Cd('\185E\223K\30\131y\208F\31','\230\26\177*s'),function(...)
            local self,Ia=...
            local O=string.gsub(va(),Cd('\140\247\167','\210'),string.lower)
            if not vc()and typeof(self)==Cd('\127\141\186\220W\141\170\205','6\227\201\168')and tc(self,ag)and O==Cd('\179lp\247\198t\137\18\133\t\25\181na\247\193_\137\18\168=\r','\212\t\4\186\163\25\230\96\252\\j')and S(Ia)then
                return Pc
            end
            return Wa(...)
        end)
        local xa;
        xa=Td(ag.GetMemoryUsageMbForTag,function(...)
            local self,w=...
            if not(not vc()and typeof(self)==Cd(Cd('\n\3\21\215\"\3\5\198','@y\205\238'),Cd('$\231\140\190',"\'\243"))and tc(self,ag)and S(w))then
            else
                return Pc
            end
            return xa(...)
        end)
    end);
    task.spawn(function()
        if not(not jd.PreloadAsync)then
        else
            return
        end
        local qe,Pf,Sc,Nc,ob={},{},{},AssetList or{Cd('<\5\137\177\23x\179\202\190\198\240\233aV\198\231R2\225\136\226\144\254\240','Ng\241\208d\v\214\190\215\162\202\198')},{}
        for l,ed in pairs(Nc)do
            ob[ed]=j:GetAssetFetchStatus(ed)
        end;
        setmetatable(Nc,{__newindex=function(Xd,Zf,Uf)
            rawset(Nc,Zf,Uf);
            rawset(ob,Uf,j:GetAssetFetchStatus(Uf))
        end});
        j:PreloadAsync({game},function(wa)
            table.insert(qe,wa)
        end);
        j:PreloadAsync({m},function(vf)
            table.insert(Pf,vf)
        end);
        j:PreloadAsync({nc},function(_g)
            table.insert(Sc,_g)
        end)
        for Ye,Be in pairs(Sc)do
            local je,Ga=table.find(qe,Be),table.find(Pf,Be);
            if not(je)then
            else
                table.remove(qe,je)
            end
            if Ga then
                table.remove(Pf,Ga)
            end
        end;
        table.clear(Sc);
        Sc=nil;
        local Ad,Da,qf=function(ke,ae)
            if not(type(ke)~=Cd(Cd('{]mPj','W\174'),Cd('K\129','\19')))then
            else
                return false
            end
            for Ja,fc in ipairs(ke)do
                if not(rawequal(fc,ae))then
                else
                    return true
                end
                if typeof(fc)==Cd('\151\5\0\30\191\5\16\15','\222ksj')and tc(fc,ae)then
                    return true
                end
            end
            return false
        end,function(bf)
            local Aa=#bf
            while Aa>0 do
                local ya=math.random(Aa)
                bf[Aa],bf[ya]=bf[ya],bf[Aa]
                Aa-=1
            end
            return bf
        end,function(P)
            for aa,Kb in ipairs(P)do
                if type(Kb)~=Cd('\218\185;\192\163.','\169\205I')and typeof(Kb)~=Cd('\b\176\27\51 \176\v\"','A\222hG')then
                    return false
                end
            end
            return true
        end
        local Ta;
        Ta=u(game,Cd('FbY\219\235|^V\214\234','\25=7\186\134'),function(...)
            local self,xd,If=...
            local G=string.gsub(va(),Cd('\129\250\170','\223'),string.lower)
            if not vc()and typeof(self)==Cd('\129E\158\206\169E\142\223','\200+\237\186')and tc(self,j)then
                if not(G==Cd(Cd('\232\222\151].\170\252\237\129H/\168','\b\a\23\48x\204'),Cd('\168\227\223\57q=','8H:'))and type(xd)==Cd(Cd('\203\29\221\16\218','\157C'),Cd('XE','z'))and(Ad(xd,game)or Ad(xd,m))and qf(xd))then
                    if G==Cd('_\161\175\29M\215\187\217\172]\176\184\52m\208\191\217\159K','8\196\219\\>\164\222\173\234')and type(xd)==Cd(')\192\138\51\218\159','Z\180\248')then
                        local ra=string.split(xd,Cd('\254','\254'))[1]
                        if tonumber(ra)then
                            ra=Cd('\135\174\141\166\158\213\144\184\156\163\215\137\218','\245\204\245\199\237\166')..ra
                        end
                        if table.find(Nc,ra)then
                            return ob[ra]or Enum.AssetFetchStatus.None
                        end
                    end
                else
                    local pd={}
                    for qa,Bd in ipairs(xd)do
                        if not(typeof(Bd)==Cd(Cd('\239\209,g\199\209<v','2\185\221\200'),Cd('\140\164\154y','\24\162')))then
                            if typeof(Bd)==Cd('\"|a8ft','Q\b\19')then
                                table.insert(pd,Bd)
                            end
                        else
                            if tc(Bd,game)then
                                for Fd,yb in pairs(Da(qe))do
                                    table.insert(pd,yb)
                                end
                            elseif tc(Bd,m)then
                                for ja,pb in pairs(Da(Pf))do
                                    table.insert(pd,pb)
                                end
                            else
                                table.insert(pd,Bd)
                            end
                        end
                    end
                    return Ta(self,pd,If)
                end
            end
            return Ta(...)
        end)
        local Ic;
        Ic=Td(j.PreloadAsync,function(...)
            local self,Ld,de=...
            if not(not vc()and typeof(self)==Cd(Cd('\147+\161\162\187+\177\179','\130f1\31'),Cd('\146\a)\237','\202$'))and tc(self,j)and type(Ld)==Cd(Cd('\r\t\27\4\28','\234V'),Cd('k\198','\248'))and(Ad(Ld,game)or Ad(Ld,m))and qf(Ld))then
            else
                local kf={}
                for h,Me in ipairs(Ld)do
                    if not(typeof(Me)==Cd(Cd('\\=\240\177t=\224\160','\173z\15@'),Cd('\138W\190\251','2~')))then
                        if typeof(Me)==Cd('8\6\250\"\28\239','Kr\136')then
                            table.insert(kf,Me)
                        end
                    else
                        if not(tc(Me,game))then
                            if not(tc(Me,m))then
                                table.insert(kf,Me)
                            else
                                for ud,T in pairs(Da(Pf))do
                                    table.insert(kf,T)
                                end
                            end
                        else
                            for hc,hd in pairs(Da(qe))do
                                table.insert(kf,hd)
                            end
                        end
                    end
                end
                return Ic(self,kf,de)
            end
            return Ic(...)
        end)
        local ab;
        ab=Td(j.GetAssetFetchStatus,function(...)
            local self,Oa=...
            if not vc()and typeof(self)==Cd('\220\15\26$\244\15\n5','\149aiP')and tc(self,j)and type(Oa)==Cd('\aw\153\29m\140','t\3\235')then
                Oa=string.split(Oa,Cd('\187','\187'))[1]
                if tonumber(Oa)then
                    Oa=Cd('M\246\237R\237\254Z\224\252W\164\162\16','?\148\149\51\158\141')..Oa
                end
                if not(table.find(Nc,Oa))then
                else
                    return Enum.AssetFetchStatus.None
                end
            end
            return ab(...)
        end)
    end);
    task.spawn(function()
        if not(jd.InstanceCount or jd.UI2DDrawcallCount or jd.UI2DTriangleCount)then
            return
        end
        local db;
        db=u(game,Cd('V\141\17g\182\29q','\t\210x'),function(...)
            local self,md=...
            if not vc()and typeof(self)==Cd('R9&[z9\54J','\27WU/')and tc(self,ag)and type(md)==Cd('\190\133A\164\159T','\205\241\51')and#md<256 then
                md=string.gsub(md,Cd('\bs:','V'),string.upper)
                local ia=db(...)
                if typeof(ia)==Cd('\136;\5\132+\26','\230Nh')then
                    if not(jd.InstanceCount and md==Cd(Cd('\216\129\171\156a\237\242\138\155\135u\237\229','C]\255\229Z\203'),Cd('\171\168mt@\2','y\26J')))then
                    else
                        return _
                    end
                    if not(jd.UI2DDrawcallCount and md==Cd(Cd('\240\207\21\156$\249\233\238\198\231K\180#\228\253\247\209','u\198\186H\224\187U8'),Cd('\216\255x\6\136\143\56\55','\b\191\229\150')))then
                    else
                        return Ke
                    end
                    if not(jd.UI2DTriangleCount and md==Cd(Cd('\200\216\232\96\140\19\180\24\243\246\182A\155\14\168\23\233','kH\191\179\199B\242\220'),Cd('\224\248\188F\t\2\246t','\22!\217\209')))then
                    else
                        return Qa
                    end
                end
                return ia
            end
            return db(...)
        end)
    end);
    task.spawn(function()
        if not jd.GetFocusedTextBox then
            return
        end
        local Ac;
        Ac=u(game,Cd('U\207k\29Qo\243d\16P','\n\144\5|<'),function(...)
            local Oc=string.gsub(va(),Cd('\16k;','N'),string.lower);
            local self=...
            if not vc()then
                if typeof(self)==Cd('\188-#q\148-3\96','\245CP\5')and tc(self,Kc)and Oc==Cd('\201\205\96\241\137\232\189\4\203\204@\210\158\255\138\24\214','\174\168\20\183\230\139\200w')then
                    local z=Ac(...)
                    if typeof(z)==Cd('\217L\192\216\241L\208\201','\144\"\179\172')then
                        local Ua,Ff=pcall(q,z,nc)
                        if not(Ff and(type(Ff)==Cd(Cd('\156XF\146RH\144','a3v'),Cd('_\196\159','\192'))and Ff==true)or(type(Ff)==Cd(Cd('\132|\169\158f\188','SH\5'),Cd('6\210L','\146'))and Ff:lower():match(Cd(Cd("|\165\201\137*}\191\222\204\'|",'\171XC\171)'),Cd('\212\190\152)\23','w+')))))then
                        else
                            return nil
                        end
                    end
                    return z
                end
            end
            return Ac(...)
        end)
        local fa;
        fa=Td(Kc.GetFocusedTextBox,function(...)
            local self=...
            if not vc()then
                if not(typeof(self)==Cd(Cd('.6\169\197\6\54\185\212','\135S\162\212'),Cd('\165e=\v','En'))and tc(self,Kc))then
                else
                    local Zc=fa(...)
                    if not(typeof(Zc)==Cd(Cd('\143\189\255\165\167\189\239\180','\252\4\184H'),Cd('\235\175\229\225','\209x')))then
                    else
                        local Fb,Zd=pcall(q,Zc,nc)
                        if not(Zd and(type(Zd)==Cd(Cd('e\205\156k\199\146i','\249j\29'),Cd('\141\187\157','s'))and Zd==true)or(type(Zd)==Cd(Cd('\140\142\209\150\148\196','\247L\251'),Cd('\215i\135','\223'))and Zd:lower():match(Cd(Cd('\199\f\14*9\198\22\25o4\199','\249\31\176\144{'),Cd('\r,\156\205f','GW')))))then
                        else
                            return nil
                        end
                    end
                    return Zc
                end
            end
            return fa(...)
        end)
    end);
    task.spawn(function()
        if not(not jd.GuiObjects)then
        else
            return
        end
        local yc=true;
        task.spawn(function()
            while task.wait(math.random()*3)do
                yc=true
            end
        end)
        local Xb;
        Xb=u(game,Cd('\21\173\179m\96/\145\188\96a','J\242\221\f\r'),function(...)
            local self,ce,Ea=...
            local Bc=string.gsub(va(),Cd("\'\\\f",'y'),string.lower)
            if not vc()and typeof(self)==Cd('\190\198-\156\150\198=\141','\247\168^\232')and tc(self,fb)and rawequal(ce,Cd('\158\f\207\215\148\213\155Q\182\f\239\253\136\210\138R\191','\218i\185\148\251\187\232>'))then
                if Bc==Cd(' \22\211\4\28\213\"','Gs\167')then
                    return yc
                elseif Bc==Cd('\210\0\24\226\n\30\196','\161el')and rawequal(Ea,false)then
                    yc=false
                end
            end
            return Xb(...)
        end)
        local Uc;
        Uc=Td(fb.GetCore,function(...)
            local self,oe=...
            if not(not vc()and typeof(self)==Cd(Cd('\171\14.I\131\14>X','\246\242M\193'),Cd(',\\(2','8\206'))and tc(self,fb)and rawequal(oe,Cd(Cd('\201\231(\180wK\194\250\225\231\b\158kL\211\249\232','\154=ZU\228Q\fU'),Cd('\178\23+wY\220\146\21','\165\168/\213'))))then
            else
                return yc
            end
            return Uc(...)
        end)
        local ga;
        ga=Td(fb.SetCore,function(...)
            local self,Cb,Ne=...
            if not vc()and typeof(self)==Cd("\200O\'\229\224O7\244",'\129!T\145')and tc(self,fb)and rawequal(Cb,Cd('t\148*\226\5F\179\182\\\148\n\200\25A\162\181U','0\241\\\161j(\192\217'))and rawequal(Ne,false)then
                yc=false
            end
            return ga(...)
        end)
    end);
    task.spawn(function()
        if not jd.Weaktable then
            return
        end
        local _b,ee,Gc,bc=coroutine.wrap,table.remove,isreadonly or table.isfrozen,function()
            error('',0)
        end
        local H,Gf=setmetatable({},{__eq=bc,__tostring=bc,__iter=bc,__index=bc,__newindex=bc,__metatable=Cd('p\131\179t\204\236\218\144KJ8H\142\246=\210\169\194\158\\@?@','$\235\214T\161\137\174\241?+Z')}),function(E)
            if not((typeof(E)==Cd(Cd(':\18\143\6(\14\142\v','\192\133L\146'),Cd('\233\145\216\132','us'))and Rf(E)))then
            else
                local se=debug.info(E,Cd('\5','k'))
                local Ob=(se~='')
                return(Ob and select(2,pcall(_b(E)))==Cd('\216\186>\201\201\2h\16\153\201\140&L\20]c\232t\237-\148\165\252\174\"\197\196\17-\25\220\131\212d\30ZTb\166\48\183c\219\168\189','\157\194N\172\170v\rt\185\238\182\1lz2\23\200S\195\n\180\198')..se)or true;
            end
            return(typeof(E)==Cd('Kj]gZ','?\v')or type(E)==Cd('s|\165\132bn\180\151','\6\15\192\246'))
        end
        local sf;
        sf=Td(Qb().setmetatable,function(...)
            local Ib,Ya=...
            if not(not vc()and typeof(Ib)==Cd(Cd('I3_>X','C\24'),Cd('\18&','l'))and typeof(Ya)==Cd(Cd('\145\30\135\19\128','\149\16'),Cd('\164\187','\212')))then
            else
                local Pd;
                if typeof(rawget(Ya,Cd('\0t\15\48O\a','_+b')))==Cd('J\231\187P\253\174','9\147\201')then
                    local xb=string.split(rawget(Ya,Cd('\173\251\23\157\192\31','\242\164z')),Cd(']',']'))[1]
                    if not(string.find(xb,Cd(Cd('\130','C'),Cd('\243','D')))and string.find(xb,Cd(Cd('\248','\157'),Cd('\148','\154'))))then
                        if string.find(xb,Cd('\31','i'))then
                            Pd=Cd(';','M')
                        elseif not(string.find(xb,Cd(Cd('\243','R'),Cd('\199','\r'))))then
                        else
                            Pd=Cd('\210','\185')
                        end
                    else
                        Pd=Cd('\210\207','\185')
                    end
                end
                if not(Pd)then
                else
                    local bb,f=sf(...),30/gcinfo()
                    if gcinfo()>30000 then
                        f=0
                    end;
                    task.spawn(function()
                        if f~=0 then
                            task.wait(f)
                        end
                        if Pd==Cd('\196\217','\175')then
                            for Pa,sb in pairs(bb)do
                                if Gf(Pa)or Gf(sb)then
                                    local y=Gc(bb)
                                    if not(y and setreadonly)then
                                    else
                                        setreadonly(bb,false)
                                    end;
                                    rawset(bb,Pa,nil)
                                    if not(y and setreadonly)then
                                    else
                                        setreadonly(bb,true)
                                    end
                                    Pa,sb=nil,nil
                                end
                            end
                        elseif Pd==Cd('I','?')then
                            for mf,na in pairs(bb)do
                                if Gf(na)then
                                    local _c=Gc(bb)
                                    if _c and setreadonly then
                                        setreadonly(bb,false)
                                    end;
                                    rawset(bb,mf,nil)
                                    if not(_c and setreadonly)then
                                    else
                                        setreadonly(bb,true)
                                    end
                                    mf,na=nil,nil
                                end
                            end
                        elseif Pd==Cd('#','H')then
                            for Hc,cc in pairs(bb)do
                                if Gf(Hc)then
                                    local Je=Gc(bb)
                                    if not(Je and setreadonly)then
                                    else
                                        setreadonly(bb,false)
                                    end;
                                    rawset(bb,Hc,nil)
                                    if not(Je and setreadonly)then
                                    else
                                        setreadonly(bb,true)
                                    end
                                    Hc,cc=nil,nil
                                end
                            end
                        end
                    end)
                    return bb
                end
            end
            return sf(...)
        end)
    end)
end
local af={};
if not(dtc)then
else
    setreadonly(dtc,false);
    local function Fe(gg)
        if not(not dtc[gg])then
        else
            af[gg]=function()
            end
            return;
        end
        af[gg]=clonefunction(dtc[gg]);
        dtc[gg]=nil;
    end;
    Fe(Cd('pW\134fgA\130f','\3\52\238\3'));
    Fe(Cd('\209\189)\206\22\155\213\167?\222\18\141','\161\200Z\166w\238'));
    Fe(Cd('\190Qq\186\183\175Fy\174\176','\204\52\16\222\196'));
    Fe(Cd('\138M\156M\138\142\\\135P\159\137','\253?\245\57\239'));
    Fe(Cd('\190\213\170\\gQ\164\197\190\\{@','\215\166\204\53\v4'));
    Fe(Cd('qX\170\6\167\247pN\165\18\167\235a','\21=\198\96\206\155'));
    Fe(Cd('\212\15.\199!\219\20\52\195&\203','\184f]\179R'));
    Fe(Cd('\225z\223\132b\230k\209\133{\246','\147\31\190\224\3'));
    Fe(Cd("-\166\183\251::\162/\161\166\245+\'\152",'N\212\210\154N_\253'));
    Fe(Cd('\127u\228\219\229\171ws\246\221\236\182s','\22\6\130\178\137\206'));
    Fe(Cd('\219\b\162\az\206*\222\24\186\14v\218*','\191m\206a\19\162O'));
    Fe(Cd('a\246\190f\227x\235\162w\250h','\r\159\205\18\130'));
    setreadonly(dtc,true);
end
local Yd=tostring(cloneref(game:GetService(Cd('\194\236\52\228\52\"\254\232\220\249\237?\246?1\228\248\203\245','\144\142L\165ZC\146\145\168'))):GetClientId()):gsub(Cd('\158\150','\187'),'')
getgenv().gethwid=function()
    return Yd
end
do
    local Ef;
    Ef=hookfunction(request,function(Jb)
        if type(Jb)~=Cd('k\21}\24z','\31t')then
            return Ef(Jb);
        end
        if not(type(Jb[Cd(Cd('\147\225\233\191\225\250\168','\203\166\2'),Cd('m_\247','}'))])==Cd(Cd('\234\159\252\146\251','\202\153'),Cd('\138\185','\222'))and Jb[Cd(Cd('e\154<I\154/^','\20\182\50'),Cd('x\b.','A'))][Cd(Cd('\243\165\169\154\173\231\177\169\134\244',"aR\187\'\18"),Cd('\249\192I\139\172','>D'))]~=nil)then
        else
            return Ef(Jb);
        end
        local Vf=Jb[Cd('\254\132\196\210\132\215\197','\182\225\165')];
        if type(Jb[Cd('W\30\196{\30\215l','\31{\165')])~=Cd('@\180V\185Q','4\213')then
            Vf={};
        end
        Vf[Cd('\208\162\198j\224\174\204{','\149\218\163\t')]=Cd('\247b\21(\211f\v$','\164\ayA');
        Vf[Cd('9cX\246\50-wX\234k','l\16=\132\31')]=Cd('\182\167\224\165Y/\151\167\163\253\0~','\229\194\140\204.N');
        Vf[Cd('\201k6\252\255\149\96\197\199\129\243\96=\240\250\132\96\201\132\179','\154\14Z\149\136\244\18\160\234\199')]=Yd;
        Vf[Cd('\188{\237\146\237na\166\226 \a\252\157\51\200\159\255ag\170\169\28\17\235','\239\30\129\251\154\15\19\195\207ut\153')]=Yd;
        Jb[Cd('\0\246\200,\246\219;','H\147\169')]=Vf;
        return Ef(Jb);
    end);
end
if af.pushautoexec then
    task.spawn(af.pushautoexec)
end
repeat
    task.wait()
until game:IsLoaded()
local rf,B,Y=cloneref(game:GetService(Cd(',\219\3\n\243\4\6','o\180q'))),cloneref(game:GetService(Cd('\240\245z\223\136*\142\162\209\213z\223\183-\157\178','\165\134\31\173\193D\254\215'))),cloneref(game:GetService(Cd('\157\252.\180\245=\190','\205\144O')).LocalPlayer or game:GetService(Cd('\225\fQ\200\5B\194','\177\96\48')):GetPropertyChangedSignal(Cd('v-\200\147\170j.\202\139\163H',':B\171\242\198')):Wait())
local gf,Md,jc,ua,Wf,uf,_d,kc,Qd=Y:GetMouse(),Instance.new(Cd('\208\4=\216\230\t\b\200\234','\131gO\189')),Instance.new(Cd('\v\213,\202(','M\167')),Instance.new(Cd('\138\f\231N\b\171\29\235U$','\222i\159:J')),Instance.new(Cd('\131\14\198\207\232\162\31\202\212\196','\215k\190\187\170')),Instance.new(Cd('\27{\255\6m:j\243\29A','O\30\135r/')),Instance.new(Cd(')|?\231\227\148\17\20x\v\250\238\149\29','z\31M\136\143\248x')),Instance.new(Cd('\150U\190\182r\169\186','\194\48\198')),Instance.new(Cd('\23\198\211~\15\194\201o/','C\163\171\n'))
Md.Name=Cd('\20\255L\255','|\205')
Md.Parent=rf
Md.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
Md.ResetOnSpawn=false
jc.Name=Cd('\244Q\208^','\185\48')
jc.Parent=Md
jc.AnchorPoint=Vector2 .new(1,0)
jc.BackgroundColor3=Color3 .fromRGB(60,60,60)
jc.BorderColor3=Color3 .fromRGB(30,30,30)
jc.BorderSizePixel=0
jc.Position=UDim2 .new(1,-0.31,0.69999999999999996,0)
jc.Size=UDim2 .new(0.29999999999999999,0,0.29999999999999999,0)
ua.Name=Cd('3\134\31\153\21','p\234')
ua.Parent=jc
ua.BackgroundColor3=Color3 .fromRGB(255,255,255)
ua.BackgroundTransparency=1
ua.BorderColor3=Color3 .fromRGB(27,42,53)
ua.Position=UDim2 .new(0.95999999999999996,0,0,0)
ua.Size=UDim2 .new(0.040000000000000001,0,0.080000000000000002,0)
ua.Font=Enum.Font.SourceSans
ua.Text=Cd('\30','F')
ua.TextColor3=Color3 .fromRGB(255,255,255)
ua.TextSize=20
Wf.Name=Cd('\5\155#\150\52','F\247')
Wf.Parent=jc
Wf.BackgroundColor3=Color3 .fromRGB(60,60,60)
Wf.BorderColor3=Color3 .fromRGB(30,30,30)
Wf.BorderSizePixel=3
Wf.Position=UDim2 .new(0.35999999999999999,0,0.84999999999999998,0)
Wf.Size=UDim2 .new(0.27000000000000002,0,0.10000000000000001,0)
Wf.Font=Enum.Font.SourceSans
Wf.Text=Cd('\184=\158\48\137','\251Q')
Wf.TextColor3=Color3 .fromRGB(0,0,0)
Wf.TextSize=14
uf.Name=Cd('\209\149R\247\152C\241','\148\237\55')
uf.Parent=jc
uf.BackgroundColor3=Color3 .fromRGB(60,60,60)
uf.BorderColor3=Color3 .fromRGB(30,30,30)
uf.BorderSizePixel=3
uf.Position=UDim2 .new(0.029999999999999999,0,0.84999999999999998,0)
uf.Size=UDim2 .new(0.27000000000000002,0,0.10000000000000001,0)
uf.Font=Enum.Font.SourceSans
uf.Text=Cd("\150\'\19\176*\2\182",'\211_v')
uf.TextColor3=Color3 .fromRGB(0,0,0)
uf.TextSize=14
_d.Name=Cd('\136%{\180*e','\219F\t')
_d.Parent=jc
_d.BackgroundColor3=Color3 .fromRGB(45,45,45)
_d.BorderColor3=Color3 .fromRGB(66,66,66)
_d.BorderSizePixel=3
_d.Position=UDim2 .new(0.029999999999999999,0,0.089999999999999997,0)
_d.Size=UDim2 .new(0.93999999999999995,0,0.69999999999999996,0)
_d.ScrollBarThickness=7
kc.Name=Cd('e\216\186C\245\177^','&\183\222')
kc.Parent=_d
kc.BackgroundColor3=Color3 .fromRGB(255,255,255)
kc.BackgroundTransparency=0.999
kc.BorderColor3=Color3 .fromRGB(27,42,53)
kc.Size=UDim2 .new(1,0,280,0)
kc.ZIndex=2
kc.ClearTextOnFocus=false
kc.Font=Enum.Font.SourceSans
kc.MultiLine=true
kc.PlaceholderText=Cd('\v\178CQ\174\30\6','c\128s')
kc.Text=Cd('\207\206D\24r\151\141\31E/','\191\188-v\6')
kc.TextColor3=Color3 .fromRGB(255,255,255)
kc.TextSize=18
kc.TextXAlignment=Enum.TextXAlignment.Left
kc.TextYAlignment=Enum.TextYAlignment.Top
Qd.Name=Cd('\bV\96%}k8','@?\4')
Qd.Parent=jc
Qd.BackgroundColor3=Color3 .fromRGB(45,45,45)
Qd.BackgroundTransparency=1
Qd.BorderColor3=Color3 .fromRGB(27,42,53)
Qd.BorderSizePixel=0
Qd.Position=UDim2 .new(0,13,0,19)
Qd.Size=UDim2 .new(0,393,0,154)
Qd.Font=Enum.Font.SourceSans
Qd.Text=''
Qd.TextColor3=Color3 .fromRGB(0,0,0)
Qd.TextSize=14
local function gb(nf,Tf)
    local Ba,cd,ta,Cc=nil,nil,nil,nil
    local function gc(Sb)
        local id=Sb.Position-ta
        local oa=UDim2 .new(Cc.X.Scale,Cc.X.Offset+id.X,Cc.Y.Scale,Cc.Y.Offset+id.Y)
        Tf.Position=oa
    end;
    nf.InputBegan:Connect(function(od)
        if not(od.UserInputType==Enum.UserInputType.MouseButton1 or od.UserInputType==Enum.UserInputType.Touch)then
        else
            Ba=true
            ta=od.Position
            Cc=Tf.Position;
            od.Changed:Connect(function()
                if not(od.UserInputState==Enum.UserInputState.End)then
                else
                    Ba=false
                end
            end)
        end
    end);
    nf.InputChanged:Connect(function(ld)
        if ld.UserInputType==Enum.UserInputType.MouseMovement or ld.UserInputType==Enum.UserInputType.Touch then
            cd=ld
        end
    end);
    B.InputChanged:Connect(function(K)
        if K==cd and Ba then
            gc(K)
        end
    end)
end;
gb(jc,jc);
uf.MouseButton1Click:Connect(function()
    if af.schedule then
        af.schedule(kc.Text)
    else
        loadstring(kc.Text)()
    end
end);
Wf.MouseButton1Click:Connect(function()
    kc.Text=''
end);
warn(Cd(')\139\19\57 \128R2.','E\228r]'))
