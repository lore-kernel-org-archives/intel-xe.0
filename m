Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5506EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 16:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9343010E6AD;
	Fri, 11 Aug 2023 16:05:30 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 65EAB10E6AD;
 Fri, 11 Aug 2023 16:05:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 5D50BA7E03;
 Fri, 11 Aug 2023 16:05:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6767793920650169429=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shekhar Chauhan" <shekhar.chauhan@intel.com>
Date: Fri, 11 Aug 2023 16:05:28 -0000
Message-ID: <169176992837.3117.16728263137909526811@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230809064213.375269-1-shekhar.chauhan@intel.com>
In-Reply-To: <20230809064213.375269-1-shekhar.chauhan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/mt?=
 =?utf-8?q?l=3A_Disable_RNE_in_SF_Unit?=
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============6767793920650169429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

=3D=3D Series Details =3D=3D

Series: drm/xe/mtl: Disable RNE in SF Unit
URL   : https://patchwork.freedesktop.org/series/122199/
State : failure

=3D=3D Summary =3D=3D

"CI Bug Log - changes from xe-319-fc4e9b6f03c7991bd711cf31f3363fabc064b8c1_=
BAT -> xe-pw-122199v1_BAT\n=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n\nSummary\n-------\n\n  **FAILURE**\n\n =
 Serious unknown changes coming with xe-pw-122199v1_BAT absolutely need to =
be\n  verified manually.\n  \n  If you think the reported changes have noth=
ing to do with the changes\n  introduced in xe-pw-122199v1_BAT, please noti=
fy your bug team to allow them\n  to document this new failure mode, which =
will reduce false positives in CI.\n\n  \n\nParticipating hosts (2 -> 2)\n-=
-----------------------------\n\n  ERROR: It appears as if the changes made=
 in xe-pw-122199v1_BAT prevented too many machines from booting.\n\n  Addit=
ional (2): bat-pvc-2 bat-atsm-2 \n  Missing    (2): bat-dg2-oem2 bat-adlp-7=
 \n\nKnown issues\n------------\n\n  Here are the changes found in xe-pw-12=
2199v1_BAT that come from known issues:\n\n### IGT changes ###\n\n#### Issu=
es hit ####\n\n  * igt@core_hotunplug@unbind-rebind:\n    - bat-atsm-2:    =
     NOTRUN -> [FAIL][1] ([Intel XE#500])\n   [1]: https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-122199v1/bat-atsm-2/igt@core_hotunplug@unbind-rebin=
d.html\n\n  * igt@kms_addfb_basic@invalid-set-prop-any:\n    - bat-atsm-2: =
        NOTRUN -> [SKIP][2] ([i915#6077]) +24 similar issues\n   [2]: https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122199v1/bat-atsm-2/igt@kms_addf=
b_basic@invalid-set-prop-any.html\n\n  * igt@kms_chamelium_frames@dp-crc-fa=
st:\n    - bat-atsm-2:         NOTRUN -> [SKIP][3] ([Intel XE#274]) +14 sim=
ilar issues\n   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122199=
v1/bat-atsm-2/igt@kms_chamelium_frames@dp-crc-fast.html\n\n  * igt@kms_flip=
@basic-flip-vs-wf_vblank:\n    - bat-atsm-2:         NOTRUN -> [SKIP][4] ([=
Intel XE#275]) +3 similar issues\n   [4]: https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-122199v1/bat-atsm-2/igt@kms_flip@basic-flip-vs-wf_vblank.htm=
l\n\n  * igt@kms_force_connector_basic@prune-stale-modes:\n    - bat-atsm-2=
:         NOTRUN -> [SKIP][5] ([Intel XE#277]) +2 similar issues\n   [5]: h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122199v1/bat-atsm-2/igt@kms_=
force_connector_basic@prune-stale-modes.html\n\n  * igt@kms_pipe_crc_basic@=
compare-crc-sanitycheck-xr24:\n    - bat-atsm-2:         NOTRUN -> [SKIP][6=
] ([i915#1836]) +7 similar issues\n   [6]: https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-122199v1/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sani=
tycheck-xr24.html\n\n  * igt@kms_prop_blob@basic:\n    - bat-atsm-2:       =
  NOTRUN -> [SKIP][7] ([Intel XE#273])\n   [7]: https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-122199v1/bat-atsm-2/igt@kms_prop_blob@basic.html\n\n  =
* igt@kms_psr@sprite_plane_onoff:\n    - bat-atsm-2:         NOTRUN -> [SKI=
P][8] ([i915#1072]) +2 similar issues\n   [8]: https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-122199v1/bat-atsm-2/igt@kms_psr@sprite_plane_onoff.html=
\n\n  * igt@xe_compute@compute-square:\n    - bat-atsm-2:         NOTRUN ->=
 [SKIP][9] ([Intel XE#252])\n   [9]: https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-122199v1/bat-atsm-2/igt@xe_compute@compute-square.html\n\n  * igt=
@xe_exec_fault_mode@twice-userptr-invalidate-imm:\n    - bat-atsm-2:       =
  NOTRUN -> [SKIP][10] ([Intel XE#288]) +17 similar issues\n   [10]: https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122199v1/bat-atsm-2/igt@xe_exec_f=
ault_mode@twice-userptr-invalidate-imm.html\n\n  * igt@xe_huc_copy@huc_copy=
:\n    - bat-atsm-2:         NOTRUN -> [SKIP][11] ([Intel XE#255])\n   [11]=
: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122199v1/bat-atsm-2/igt@x=
e_huc_copy@huc_copy.html\n\n  * igt@xe_live_ktest@dmabuf:\n    - bat-atsm-2=
:         NOTRUN -> [SKIP][12] ([Intel XE#483]) +4 similar issues\n   [12]:=
 https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122199v1/bat-atsm-2/igt@xe=
_live_ktest@dmabuf.html\n\n  \n  {name}: This element is suppressed. This m=
eans it is ignored when computing\n          the status of the difference (=
SUCCESS, WARNING, or FAILURE).\n\n  [Intel XE#252]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/252\n  [Intel XE#255]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/255\n  [Intel XE#273]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/273\n  [Intel XE#274]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/274\n  [Intel XE#275]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/275\n  [Intel XE#277]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/277\n  [Intel XE#288]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/288\n  [Intel XE#389]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/389\n  [Intel XE#482]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/482\n  [Intel XE#483]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/483\n  [Intel XE#500]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/500\n  [Intel XE#522]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/522\n  [Intel XE#524]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/524\n  [Intel XE#526]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/526\n  [Intel XE#531]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/531\n  [Intel XE#532]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/532\n  [Intel XE#533]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/533\n  [Intel XE#534]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/534\n  [Intel XE#535]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/535\n  [Intel XE#536]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/536\n  [Intel XE#537]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/537\n  [Intel XE#538]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/538\n  [Intel XE#539]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/539\n  [Intel XE#540]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/540\n  [Intel XE#541]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/541\n  [Intel XE#542]: https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/542\n  [i915#1072]: https://gitlab.freedesktop=
.org/drm/intel/issues/1072\n  [i915#1836]: https://gitlab.freedesktop.org/d=
rm/intel/issues/1836\n  [i915#6077]: https://gitlab.freedesktop.org/drm/int=
el/issues/6077\n\n\nBuild changes\n-------------\n\n  * IGT: IGT_7428 -> IG=
T_7424\n  * Linux: xe-319-fc4e9b6f03c7991bd711cf31f3363fabc064b8c1 -> xe-pw=
-122199v1\n\n  IGT_7424: f12c2533941c9dfce43f455a02b7986605692b29 @ https:/=
/gitlab.freedesktop.org/drm/igt-gpu-tools.git\n  IGT_7428: 2f916814e4153f42=
8664ab87acec25694751b1f6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools=
.git\n  xe-319-fc4e9b6f03c7991bd711cf31f3363fabc064b8c1: fc4e9b6f03c7991bd7=
11cf31f3363fabc064b8c1\n  xe-pw-122199v1: 122199v1\n\n"



--===============6767793920650169429==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/xe/mtl: Disable RNE in SF Unit</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/122199/">https://patchwork.freedesktop.org/series/122199/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

</table>


    <p>"CI Bug Log - changes from xe-319-fc4e9b6f03c7991bd711cf31f3363fabc0=
64b8c1_BAT -&gt; xe-pw-122199v1_BAT\n=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n\nSummary\n-------\n\n  <str=
ong>FAILURE</strong>\n\n  Serious unknown changes coming with xe-pw-122199v=
1_BAT absolutely need to be\n  verified manually.\n  \n  If you think the r=
eported changes have nothing to do with the changes\n  introduced in xe-pw-=
122199v1_BAT, please notify your bug team to allow them\n  to document this=
 new failure mode, which will reduce false positives in CI.\n\n  \n\nPartic=
ipating hosts (2 -&gt; 2)\n------------------------------\n\n  ERROR: It ap=
pears as if the changes made in xe-pw-122199v1_BAT prevented too many machi=
nes from booting.\n\n  Additional (2): bat-pvc-2 bat-atsm-2 \n  Missing    =
(2): bat-dg2-oem2 bat-adlp-7 \n\nKnown issues\n------------\n\n  Here are t=
he changes found in xe-pw-122199v1_BAT that come from known issues:\n\n### =
IGT changes ###\n\n#### Issues hit ####\n\n  * igt@core_hotunplug@unbind-re=
bind:\n    - bat-atsm-2:         NOTRUN -&gt; [FAIL][1] ([Intel XE#500])\n =
  [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122199v1/bat-atsm-2/=
igt@core_hotunplug@unbind-rebind.html\n\n  * igt@kms_addfb_basic@invalid-se=
t-prop-any:\n    - bat-atsm-2:         NOTRUN -&gt; [SKIP][2] ([i915#6077])=
 +24 similar issues\n   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-122199v1/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html\n\n  * =
igt@kms_chamelium_frames@dp-crc-fast:\n    - bat-atsm-2:         NOTRUN -&g=
t; [SKIP][3] ([Intel XE#274]) +14 similar issues\n   [3]: https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-122199v1/bat-atsm-2/igt@kms_chamelium_frames=
@dp-crc-fast.html\n\n  * igt@kms_flip@basic-flip-vs-wf_vblank:\n    - bat-a=
tsm-2:         NOTRUN -&gt; [SKIP][4] ([Intel XE#275]) +3 similar issues\n =
  [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122199v1/bat-atsm-2/=
igt@kms_flip@basic-flip-vs-wf_vblank.html\n\n  * igt@kms_force_connector_ba=
sic@prune-stale-modes:\n    - bat-atsm-2:         NOTRUN -&gt; [SKIP][5] ([=
Intel XE#277]) +2 similar issues\n   [5]: https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-122199v1/bat-atsm-2/igt@kms_force_connector_basic@prune-stal=
e-modes.html\n\n  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:\n =
   - bat-atsm-2:         NOTRUN -&gt; [SKIP][6] ([i915#1836]) +7 similar is=
sues\n   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122199v1/bat-=
atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html\n\n  * igt@=
kms_prop_blob@basic:\n    - bat-atsm-2:         NOTRUN -&gt; [SKIP][7] ([In=
tel XE#273])\n   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-12219=
9v1/bat-atsm-2/igt@kms_prop_blob@basic.html\n\n  * igt@kms_psr@sprite_plane=
_onoff:\n    - bat-atsm-2:         NOTRUN -&gt; [SKIP][8] ([i915#1072]) +2 =
similar issues\n   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122=
199v1/bat-atsm-2/igt@kms_psr@sprite_plane_onoff.html\n\n  * igt@xe_compute@=
compute-square:\n    - bat-atsm-2:         NOTRUN -&gt; [SKIP][9] ([Intel X=
E#252])\n   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122199v1/b=
at-atsm-2/igt@xe_compute@compute-square.html\n\n  * igt@xe_exec_fault_mode@=
twice-userptr-invalidate-imm:\n    - bat-atsm-2:         NOTRUN -&gt; [SKIP=
][10] ([Intel XE#288]) +17 similar issues\n   [10]: https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-122199v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-u=
serptr-invalidate-imm.html\n\n  * igt@xe_huc_copy@huc_copy:\n    - bat-atsm=
-2:         NOTRUN -&gt; [SKIP][11] ([Intel XE#255])\n   [11]: https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-122199v1/bat-atsm-2/igt@xe_huc_copy@huc=
_copy.html\n\n  * igt@xe_live_ktest@dmabuf:\n    - bat-atsm-2:         NOTR=
UN -&gt; [SKIP][12] ([Intel XE#483]) +4 similar issues\n   [12]: https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-122199v1/bat-atsm-2/igt@xe_live_ktest=
@dmabuf.html\n\n  \n  {name}: This element is suppressed. This means it is =
ignored when computing\n          the status of the difference (SUCCESS, WA=
RNING, or FAILURE).\n\n  [Intel XE#252]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/252\n  [Intel XE#255]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/255\n  [Intel XE#273]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/273\n  [Intel XE#274]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/274\n  [Intel XE#275]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/275\n  [Intel XE#277]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/277\n  [Intel XE#288]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/288\n  [Intel XE#389]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/389\n  [Intel XE#482]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/482\n  [Intel XE#483]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/483\n  [Intel XE#500]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/500\n  [Intel XE#522]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/522\n  [Intel XE#524]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/524\n  [Intel XE#526]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/526\n  [Intel XE#531]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/531\n  [Intel XE#532]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/532\n  [Intel XE#533]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/533\n  [Intel XE#534]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/534\n  [Intel XE#535]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/535\n  [Intel XE#536]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/536\n  [Intel XE#537]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/537\n  [Intel XE#538]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/538\n  [Intel XE#539]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/539\n  [Intel XE#540]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/540\n  [Intel XE#541]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/541\n  [Intel XE#542]: https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/542\n  [i915#1072]: https://gitlab.freedesktop.org/drm/in=
tel/issues/1072\n  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/is=
sues/1836\n  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6=
077\n\n\nBuild changes\n-------------\n\n  * IGT: IGT_7428 -&gt; IGT_7424\n=
  * Linux: xe-319-fc4e9b6f03c7991bd711cf31f3363fabc064b8c1 -&gt; xe-pw-1221=
99v1\n\n  IGT_7424: f12c2533941c9dfce43f455a02b7986605692b29 @ https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git\n  IGT_7428: 2f916814e4153f428664a=
b87acec25694751b1f6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git\=
n  xe-319-fc4e9b6f03c7991bd711cf31f3363fabc064b8c1: fc4e9b6f03c7991bd711cf3=
1f3363fabc064b8c1\n  xe-pw-122199v1: 122199v1\n\n"</p>

</body>
</html>

--===============6767793920650169429==--
