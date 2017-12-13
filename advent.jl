#Pkg.add("Requests")

using Base.Test


#############################################
# ██████╗  █████╗ ██╗   ██╗     ██╗
# ██╔══██╗██╔══██╗╚██╗ ██╔╝    ███║
# ██║  ██║███████║ ╚████╔╝     ╚██║
# ██║  ██║██╔══██║  ╚██╔╝       ██║
# ██████╔╝██║  ██║   ██║        ██║
# ╚═════╝ ╚═╝  ╚═╝   ╚═╝        ╚═╝
#############################################

day1_input = "77736991856689225253142335214746294932318813454849177823468674346512426482777696993348135287531487622845155339235443718798255411492778415157351753377959586612882455464736285648473397681163729345143319577258292849619491486748832944425643737899293811819448271546283914592546989275992844383947572926628695617661344293284789225493932487897149244685921644561896799491668147588536732985476538413354195246785378443492137893161362862587297219368699689318441563683292683855151652394244688119527728613756153348584975372656877565662527436152551476175644428333449297581939357656843784849965764796365272113837436618857363585783813291999774718355479485961244782148994281845717611589612672436243788252212252489833952785291284935439662751339273847424621193587955284885915987692812313251556836958571335334281322495251889724281863765636441971178795365413267178792118544937392522893132283573129821178591214594778712292228515169348771198167462495988252456944269678515277886142827218825358561772588377998394984947946121983115158951297156321289231481348126998584455974277123213413359859659339792627742476688827577318285573236187838749444212666293172899385531383551142896847178342163129883523694183388123567744916752899386265368245342587281521723872555392212596227684414269667696229995976182762587281829533181925696289733325513618571116199419759821597197636415243789757789129824537812428338192536462468554399548893532588928486825398895911533744671691387494516395641555683144968644717265849634943691721391779987198764147667349266877149238695714118982841721323853294642175381514347345237721288281254828745122878268792661867994785585131534136646954347165597315643658739688567246339618795777125767432162928257331951255792438831957359141651634491912746875748363394329848227391812251812842263277229514125426682179711184717737714178235995431465217547759282779499842892993556918977773236196185348965713241211365895519697294982523166196268941976859987925578945185217127344619169353395993198368185217391883839449331638641744279836858188235296951745922667612379649453277174224722894599153367373494255388826855322712652812127873536473277"

function day1(input_string)
    total_sum::Int = 0
    for i=1:endof(input_string)
        if i==endof(input_string)
            next_char = 1
        else
            next_char = i+1
        end
        if input_string[i] == input_string[next_char]
            total_sum += parse(Int, input_string[i])
        end
    end
    return total_sum
end

@test day1("1122") == 3
@test day1("1111") == 4
@test day1("1234") == 0
@test day1("91212129") == 9

println("Day 1 Part 1: ", day1(day1_input))

function day1_part2(input_string)
    total_sum::Int = 0
    for i=1:endof(input_string)
        char_to_match = i + Int(length(input_string)/2)
        char_to_match = (char_to_match > endof(input_string)) ? char_to_match - length(input_string) : char_to_match

        if input_string[i] == input_string[char_to_match]
            total_sum += parse(Int, input_string[i])
        end
    end
    return total_sum
end

@test day1_part2("1212") == 6
@test day1_part2("1221") == 0
@test day1_part2("123425") == 4
@test day1_part2("123123") == 12
@test day1_part2("12131415") == 4

println("Day 1 Part 2: ", day1_part2(day1_input))

#############################################
# ██████╗  █████╗ ██╗   ██╗    ██████╗
# ██╔══██╗██╔══██╗╚██╗ ██╔╝    ╚════██╗
# ██║  ██║███████║ ╚████╔╝      █████╔╝
# ██║  ██║██╔══██║  ╚██╔╝      ██╔═══╝
# ██████╔╝██║  ██║   ██║       ███████╗
# ╚═════╝ ╚═╝  ╚═╝   ╚═╝       ╚══════╝
#############################################

day2_input = """104	240	147	246	123	175	372	71	116	230	260	118	202	270	277	292
740	755	135	205	429	822	844	90	828	115	440	805	526	91	519	373
1630	991	1471	1294	52	1566	50	1508	1367	1489	55	547	342	512	323	51
1356	178	1705	119	1609	1409	245	292	1434	694	405	1692	247	193	1482	1407
2235	3321	3647	212	1402	3711	3641	1287	2725	692	1235	3100	123	144	104	101
1306	1224	1238	186	751	734	1204	1275	366	149	1114	166	1118	239	153	943
132	1547	1564	512	2643	2376	2324	2159	1658	107	1604	145	2407	131	2073	1878
1845	91	1662	108	92	1706	1815	1797	1728	1150	1576	83	97	547	1267	261
78	558	419	435	565	107	638	173	93	580	338	52	633	256	377	73
1143	3516	4205	3523	148	401	3996	3588	300	1117	2915	1649	135	134	182	267
156	2760	1816	2442	2985	990	2598	1273	167	821	138	141	2761	2399	1330	1276
3746	3979	2989	161	4554	156	3359	173	3319	192	3707	264	762	2672	4423	2924
3098	4309	4971	5439	131	171	5544	595	154	571	4399	4294	160	6201	4329	5244
728	249	1728	305	2407	239	691	2241	2545	1543	55	2303	1020	753	193	1638
260	352	190	877	118	77	1065	1105	1085	1032	71	87	851	56	1161	667
1763	464	182	1932	1209	640	545	931	1979	197	1774	174	2074	1800	939	161"""

function day2_part1(input_string)
    total_sum = 0
    for row in split(input_string, "\n")
        row_ints = map(x->parse(Int, x), split(row))
        total_sum += maximum(row_ints) - minimum(row_ints)
    end
    return total_sum
end

@test day2_part1("""
5 1 9 5
7 5 3
2 4 6 8""") == 18

println("Day 2 Part 1: ", day2_part1(day2_input))

function reduce_row(row)
    row = sort(row, rev=true)
    for i in row
        elems = row[map(x->i%x == 0, row)]
        if length(elems) == 2
            return Int(i/elems[2])
        end
    end
end

function day2_part2(input_string)
    total_sum = 0
    for row in split(input_string, "\n")
        row_ints = map(x->parse(Int, x), split(row))
        # println(reduce_row(row_ints))
        total_sum += reduce_row(row_ints)
    end
    return total_sum
end

@test day2_part2("5 9 2 8
9 4 7 3
3 8 6 5") == 9

println("Day 2 Part 2: ", day2_part2(day2_input))


#############################################
# ██████╗  █████╗ ██╗   ██╗    ██████╗
# ██╔══██╗██╔══██╗╚██╗ ██╔╝    ╚════██╗
# ██║  ██║███████║ ╚████╔╝      █████╔╝
# ██║  ██║██╔══██║  ╚██╔╝       ╚═══██╗
# ██████╔╝██║  ██║   ██║       ██████╔╝
# ╚═════╝ ╚═╝  ╚═╝   ╚═╝       ╚═════╝
#############################################
day3_input = 325489

function day3_part1(cell_no)
    if cell_no == 1
        return ((0, 0), 0)
    end
    x = 0; y=0; multiplier=1; direction = "r"; n = 2
    while n < cell_no
        if direction == "r"
            direction = "u"
            for a in 1:multiplier
                x += 1
                if n == cell_no return ((x, y), abs(x) + abs(y)) end
                n += 1
            end
        elseif direction == "u"
            direction = "l"
            for a in 1:multiplier
                y += 1
                if n == cell_no return ((x, y), abs(x) + abs(y)) end
                n += 1
            end
            multiplier += 1
        elseif direction == "l"
            direction = "d"
            for a in 1:multiplier
                x -= 1
                if n == cell_no return ((x, y), abs(x) + abs(y)) end
                n += 1
            end
        elseif direction == "d"
            direction = "r"
            for a in 1:multiplier
                y -= 1
                if n == cell_no return ((x, y), abs(x) + abs(y)) end
                n += 1
            end
            multiplier += 1
        end
    end
end

@test day3_part1(1)[2] == 0
@test day3_part1(12)[2] == 3
@test day3_part1(23)[2] == 2
@test day3_part1(1024)[2] == 31

println("Day 3 Part 1: ", day3_part1(day3_input)[2])

function day3_part2(cell_no)

    width = maximum(abs.(day3_part1(cell_no)[1]))*2+4
    data = Matrix(width, width)
    data[:] = 0
    data[Int(width/2), Int(width/2)] = 1

    x = 0; y=0; multiplier=1; direction = "r"; n = 2
    while n < cell_no
        if direction == "r"
            direction = "u"
            for a in 1:multiplier
                x += 1
                value = sum(data[x+Int(width/2)-1:x+Int(width/2)+1, y+Int(width/2)-1:y+Int(width/2)+1])
                data[x+Int(width/2), y+Int(width/2)] = value
                if value > cell_no return value end
                n += 1
            end
        elseif direction == "u"
            direction = "l"
            for a in 1:multiplier
                y += 1
                value = sum(data[x+Int(width/2)-1:x+Int(width/2)+1, y+Int(width/2)-1:y+Int(width/2)+1])
                data[x+Int(width/2), y+Int(width/2)] = value
                if value > cell_no return value end
                n += 1
            end
            multiplier += 1
        elseif direction == "l"
            direction = "d"
            for a in 1:multiplier
                x -= 1
                value = sum(data[x+Int(width/2)-1:x+Int(width/2)+1, y+Int(width/2)-1:y+Int(width/2)+1])
                data[x+Int(width/2), y+Int(width/2)] = value
                if value > cell_no return value end
                n += 1
            end
        elseif direction == "d"
            direction = "r"
            for a in 1:multiplier
                y -= 1
                value = sum(data[x+Int(width/2)-1:x+Int(width/2)+1, y+Int(width/2)-1:y+Int(width/2)+1])
                data[x+Int(width/2), y+Int(width/2)] = value
                if value > cell_no return value end
                n += 1
            end
            multiplier += 1
        end
    end
    return data
end


println("Day 3 Part 3: ", day3_part2(day3_input))

#####################################################
# ██████╗  █████╗ ██╗   ██╗    ██╗  ██╗
# ██╔══██╗██╔══██╗╚██╗ ██╔╝    ██║  ██║
# ██║  ██║███████║ ╚████╔╝     ███████║
# ██║  ██║██╔══██║  ╚██╔╝      ╚════██║
# ██████╔╝██║  ██║   ██║            ██║
# ╚═════╝ ╚═╝  ╚═╝   ╚═╝            ╚═╝
#####################################################

day4_input = readlines("./adventofcode-2017/day4.txt")

function day4_part1(input_string)
    @_ input_string begin
        map(x->split(x), _)
        filter(x-> size(x) == size(unique(x)), _)
        length(_)
    end
end
println("Day 4 Part 1: ", day4_part1(day4_input))

function day4_part2(input_string)
    @_ input_string begin
        map(x->map(y -> join(sort(split(y, ""))), split(x)), _)
        filter(x-> size(x) == size(unique(x)), _)
        length(_)
    end
end
println("Day 4 Part 2: ", day4_part2(day4_input))
