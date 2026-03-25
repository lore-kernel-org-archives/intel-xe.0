Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB941093168
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 02:08:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA3710E5BE;
	Wed, 25 Mar 2026 02:08:46 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E89710E5BE;
 Wed, 25 Mar 2026 02:08:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1261966664246540471=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/wm=3A_Watermark/S?=
 =?utf-8?q?AGV_fixes/cleanups/etc?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Mar 2026 02:08:45 -0000
Message-ID: <177440452530.393431.13070366898067896518@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260324134843.2364-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260324134843.2364-1-ville.syrjala@linux.intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============1261966664246540471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/wm: Watermark/SAGV fixes/cleanups/etc
URL   : https://patchwork.freedesktop.org/series/163783/
State : success

== Summary ==

CI Bug Log - changes from xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f_FULL -> xe-pw-163783v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-163783v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][1], [PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25]) -> ([DMESG-WARN][26], [DMESG-WARN][27], [DMESG-WARN][28], [DMESG-WARN][29], [DMESG-WARN][30], [DMESG-WARN][31], [DMESG-WARN][32], [DMESG-WARN][33], [DMESG-WARN][34], [DMESG-WARN][35], [DMESG-WARN][36], [DMESG-WARN][37], [DMESG-WARN][38], [DMESG-WARN][39], [DMESG-WARN][40], [DMESG-WARN][41], [DMESG-WARN][42], [DMESG-WARN][43], [DMESG-WARN][44], [DMESG-WARN][45], [DMESG-WARN][46], [DMESG-WARN][47], [DMESG-WARN][48], [DMESG-WARN][49], [DMESG-WARN][50]) ([Intel XE#7433])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-7/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-4/igt@xe_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-4/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-5/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-3/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-9/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-3/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-8/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-9/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-8/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-9/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-2/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-10/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-10/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-10/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-1/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-3/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-7/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-6/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-6/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-4/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-1/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-5/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-7/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-5/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-4/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-4/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-5/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-10/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-10/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-8/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-8/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-10/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-1/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-1/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-1/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-7/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-7/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-7/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-9/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-9/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-9/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-2/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-2/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-3/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-3/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-3/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-6/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-6/igt@xe_module_load@load.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][51] ([Intel XE#301]) -> [PASS][52] +1 other test pass
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#7433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433


Build changes
-------------

  * Linux: xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f -> xe-pw-163783v1

  IGT_8822: 8822
  xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f: cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f
  xe-pw-163783v1: 163783v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/index.html

--===============1261966664246540471==
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
<tr><td><b>Series:</b></td><td>drm/i915/wm: Watermark/SAGV fixes/cleanups/e=
tc</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/163783/">https://patchwork.freedesktop.org/series/163783/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-163783v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-163783v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f=
7c9fa0f_FULL -&gt; xe-pw-163783v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163783v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f=
/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9=
fa0f/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0=
f7c9fa0f/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d6=
51b0f7c9fa0f/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e53=
91d651b0f7c9fa0f/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a703=
3e5391d651b0f7c9fa0f/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0=
a7033e5391d651b0f7c9fa0f/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072=
e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-10/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d=
4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-10/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4771-cc=
83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-10/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-47=
71-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-1/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-3/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-5/igt@xe_mod=
ule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-163783v1/shard-bmg-4/igt@xe_module_load@load.html">DMES=
G-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1637=
83v1/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-5/igt@xe_=
module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-163783v1/shard-bmg-10/igt@xe_module_load@load.html">=
DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
163783v1/shard-bmg-10/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-8/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-8/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-163783v1/shard-bmg-10/igt@xe_module_load@load.html">DMESG-WARN</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-=
1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-1/igt@xe_module_load@loa=
d.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-163783v1/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-b=
mg-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-7/igt@xe_module_load@=
load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-163783v1/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shar=
d-bmg-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-9/igt@xe_module_lo=
ad@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-163783v1/shard-bmg-9/igt@xe_module_load@load.html">DMESG-WARN=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/s=
hard-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-2/igt@xe_module=
_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-163783v1/shard-bmg-3/igt@xe_module_load@load.html">DMESG-W=
ARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v=
1/shard-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-bmg-3/igt@xe_mod=
ule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-163783v1/shard-bmg-6/igt@xe_module_load@load.html">DMES=
G-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1637=
83v1/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7433">Intel XE#7433</a>=
)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank-interruptible:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163783v1/shard-lnl-6=
/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f -&gt; xe-pw-163=
783v1</li>
</ul>
<p>IGT_8822: 8822<br />
  xe-4771-cc83f6d4f072e6c0a7033e5391d651b0f7c9fa0f: cc83f6d4f072e6c0a7033e5=
391d651b0f7c9fa0f<br />
  xe-pw-163783v1: 163783v1</p>

</body>
</html>

--===============1261966664246540471==--
