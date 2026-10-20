Add-Type -AssemblyName System.Drawing
$dest = Join-Path (Get-Location) 'icons'
New-Item -ItemType Directory -Path $dest -Force | Out-Null
$bitmap = [System.Drawing.Bitmap]::new(512,512)
$g = [System.Drawing.Graphics]::FromImage($bitmap)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.Clear([System.Drawing.ColorTranslator]::FromHtml('#edf1e4'))
function Brush($hex) { [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml($hex)) }
$wash=Brush '#e0e7d3'; $g.FillEllipse($wash,58,58,396,396)
$ground=Brush '#c5d1af';$g.FillEllipse($ground,142,383,228,26)
$pen=[System.Drawing.Pen]::new([System.Drawing.ColorTranslator]::FromHtml('#795d49'),19)
$pen.StartCap=[System.Drawing.Drawing2D.LineCap]::Round;$pen.EndCap=[System.Drawing.Drawing2D.LineCap]::Round
$g.DrawLine($pen,256,390,256,216);$g.DrawLine($pen,256,300,195,241);$g.DrawLine($pen,256,268,317,210);$g.DrawLine($pen,256,238,228,190)
$leaf=Brush '#79966b';$g.FillEllipse($leaf,151,223,81,46);$g.FillEllipse($leaf,289,220,73,45)
$pink=Brush '#e2a4b4';$light=Brush '#f0c4ce';$deep=Brush '#cf8ba0'
$g.FillEllipse($pink,143,176,135,105);$g.FillEllipse($pink,237,153,132,124);$g.FillEllipse($pink,183,118,145,138)
$g.FillEllipse($light,154,174,92,75);$g.FillEllipse($light,202,133,93,87);$g.FillEllipse($light,268,168,83,77)
foreach($pt in @(@(192,208),@(241,169),@(298,211),@(235,236),@(285,153))) {
  $x=$pt[0];$y=$pt[1]
  for($i=0;$i -lt 5;$i++) {$a=$i*2*[Math]::PI/5;$g.FillEllipse($deep,[single]($x+[Math]::Cos($a)*8-6),[single]($y+[Math]::Sin($a)*8-6),12,12)}
  $gold=Brush '#f6d987';$g.FillEllipse($gold,$x-3,$y-3,6,6);$gold.Dispose()
}
$gold=Brush '#c7a25a'
foreach($spark in @(@(127,143,13),@(381,291,16),@(350,113,9))) {
$x=$spark[0];$y=$spark[1];$r=$spark[2]
$points=[System.Drawing.PointF[]]@([System.Drawing.PointF]::new($x,$y-$r),[System.Drawing.PointF]::new($x+3,$y-3),[System.Drawing.PointF]::new($x+$r,$y),[System.Drawing.PointF]::new($x+3,$y+3),[System.Drawing.PointF]::new($x,$y+$r),[System.Drawing.PointF]::new($x-3,$y+3),[System.Drawing.PointF]::new($x-$r,$y),[System.Drawing.PointF]::new($x-3,$y-3))
$g.FillPolygon($gold,$points)
}
$bitmap.Save((Join-Path $dest 'icon-512.png'),[System.Drawing.Imaging.ImageFormat]::Png)
foreach($size in @(152,167,180,192)) {
$small=[System.Drawing.Bitmap]::new($size,$size);$sg=[System.Drawing.Graphics]::FromImage($small);$sg.InterpolationMode=[System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic;$sg.DrawImage($bitmap,0,0,$size,$size)
$name=if($size -eq 192){'icon-192.png'}else{"apple-touch-icon-$size.png"}
$small.Save((Join-Path $dest $name),[System.Drawing.Imaging.ImageFormat]::Png);$sg.Dispose();$small.Dispose()
}
$g.Dispose();$bitmap.Dispose();$pen.Dispose();$wash.Dispose();$ground.Dispose();$leaf.Dispose();$pink.Dispose();$light.Dispose();$deep.Dispose();$gold.Dispose()
