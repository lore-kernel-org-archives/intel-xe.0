Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E81107636D
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 05:45:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C361610EDA4;
	Wed,  1 Apr 2026 05:45:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B8010ED99;
 Wed,  1 Apr 2026 05:45:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8618556813041190556=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vm=3A_Add_missing_pa?=
 =?utf-8?q?d_and_extensions_check_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Apr 2026 05:45:37 -0000
Message-ID: <177502233705.421426.12548228861600789589@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260331181216.37775-2-jonathan.cavitt@intel.com>
In-Reply-To: <20260331181216.37775-2-jonathan.cavitt@intel.com>
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

--===============8618556813041190556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vm: Add missing pad and extensions check (rev2)
URL   : https://patchwork.freedesktop.org/series/164183/
State : success

== Summary ==

CI Bug Log - changes from xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c_BAT -> xe-pw-164183v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-164183v2_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_pat@pat-index-xehpc:
    - bat-ptl-vm:         [SKIP][1] ([Intel XE#5777]) -> [SKIP][2] ([Intel XE#5777] / [Intel XE#7590])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html
    - bat-lnl-1:          [SKIP][3] ([Intel XE#1420] / [Intel XE#2838]) -> [SKIP][4] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-2:          [SKIP][5] ([Intel XE#1420]) -> [SKIP][6] ([Intel XE#1420] / [Intel XE#7590])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
    - bat-wcl-2:          [SKIP][7] ([Intel XE#7247]) -> [SKIP][8] ([Intel XE#7247] / [Intel XE#7590])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-1:          [SKIP][9] ([Intel XE#1420]) -> [SKIP][10] ([Intel XE#1420] / [Intel XE#7590])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
    - bat-lnl-2:          [SKIP][11] ([Intel XE#1420] / [Intel XE#2838]) -> [SKIP][12] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-2:          [SKIP][13] ([Intel XE#5777]) -> [SKIP][14] ([Intel XE#5777] / [Intel XE#7590])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-wcl-1:          [SKIP][15] ([Intel XE#7247]) -> [SKIP][16] ([Intel XE#7247] / [Intel XE#7590])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-1:          [SKIP][17] ([Intel XE#5777]) -> [SKIP][18] ([Intel XE#5777] / [Intel XE#7590])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          [SKIP][19] ([Intel XE#2245]) -> [SKIP][20] ([Intel XE#2245] / [Intel XE#7590])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-1:          [SKIP][21] ([Intel XE#2245]) -> [SKIP][22] ([Intel XE#2245] / [Intel XE#7590])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-2:          [SKIP][23] ([Intel XE#977]) -> [SKIP][24] ([Intel XE#7590] / [Intel XE#977])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
    - bat-wcl-1:          [SKIP][25] ([Intel XE#7242]) -> [SKIP][26] ([Intel XE#7242] / [Intel XE#7590])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-wcl-1/igt@xe_pat@pat-index-xelp.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-wcl-1/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-vm:         [SKIP][27] ([Intel XE#5771]) -> [SKIP][28] ([Intel XE#5771] / [Intel XE#7590])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html
    - bat-wcl-2:          [SKIP][29] ([Intel XE#7242]) -> [SKIP][30] ([Intel XE#7242] / [Intel XE#7590])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-wcl-2/igt@xe_pat@pat-index-xelp.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-wcl-2/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-1:          [SKIP][31] ([Intel XE#977]) -> [SKIP][32] ([Intel XE#7590] / [Intel XE#977])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-2:          [SKIP][33] ([Intel XE#5771]) -> [SKIP][34] ([Intel XE#5771] / [Intel XE#7590])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-1:          [SKIP][35] ([Intel XE#5771]) -> [SKIP][36] ([Intel XE#5771] / [Intel XE#7590])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-1/igt@xe_pat@pat-index-xelp.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-1:          [SKIP][37] ([Intel XE#5780]) -> [SKIP][38] ([Intel XE#5780] / [Intel XE#7590])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-ptl-vm:         [SKIP][39] ([Intel XE#5780]) -> [SKIP][40] ([Intel XE#5780] / [Intel XE#7590])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html
    - bat-lnl-1:          [SKIP][41] ([Intel XE#979]) -> [SKIP][42] ([Intel XE#7590] / [Intel XE#979])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-2:          [SKIP][43] ([Intel XE#2236]) -> [SKIP][44] ([Intel XE#2236] / [Intel XE#7590])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
    - bat-wcl-2:          [SKIP][45] ([Intel XE#7248]) -> [SKIP][46] ([Intel XE#7248] / [Intel XE#7590])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-1:          [SKIP][47] ([Intel XE#2236]) -> [SKIP][48] ([Intel XE#2236] / [Intel XE#7590])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
    - bat-lnl-2:          [SKIP][49] ([Intel XE#2236] / [Intel XE#979]) -> [SKIP][50] ([Intel XE#2236] / [Intel XE#7590] / [Intel XE#979])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-ptl-2:          [SKIP][51] ([Intel XE#5780]) -> [SKIP][52] ([Intel XE#5780] / [Intel XE#7590])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-wcl-1:          [SKIP][53] ([Intel XE#7248]) -> [SKIP][54] ([Intel XE#7248] / [Intel XE#7590])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#7242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242
  [Intel XE#7247]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247
  [Intel XE#7248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c -> xe-pw-164183v2

  IGT_8839: 8839
  xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c: 779129c7868f4c7205901d6e57b25de52b411d1c
  xe-pw-164183v2: 164183v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/index.html

--===============8618556813041190556==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/xe/vm: Add missing pad and extensions check (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164183/">https://patchwork.freedesktop.org/series/164183/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c_BAT -&gt; xe-pw-164183v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164183v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-wcl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-wcl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-wcl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-wcl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164183v2/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c -&gt; xe-pw-164183v2</li>
</ul>
<p>IGT_8839: 8839<br />
  xe-4827-779129c7868f4c7205901d6e57b25de52b411d1c: 779129c7868f4c7205901d6e57b25de52b411d1c<br />
  xe-pw-164183v2: 164183v2</p>

</body>
</html>

--===============8618556813041190556==--
