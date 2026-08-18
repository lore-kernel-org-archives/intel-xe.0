Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF378C5DF7E
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 12:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F19110EAFF;
	Tue, 18 Aug 2026 12:28:38 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3713310EAFF;
 Tue, 18 Aug 2026 12:28:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4234877793320702448=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Add_memory_page_offlining_s?=
 =?utf-8?q?upport_=28rev20=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Aug 2026 12:28:37 -0000
Message-ID: <178705611721.62563.8624451978849539927@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260818104055.3833974-14-tejas.upadhyay@intel.com>
In-Reply-To: <20260818104055.3833974-14-tejas.upadhyay@intel.com>
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

--===============4234877793320702448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add memory page offlining support (rev20)
URL   : https://patchwork.freedesktop.org/series/161473/
State : failure

== Summary ==

CI Bug Log - changes from xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef_BAT -> xe-pw-161473v20_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161473v20_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161473v20_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 11)
------------------------------

  Additional (1): bat-bmg-2 
  Missing    (2): bat-nvls-2 bat-wcl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161473v20_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-ptl-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-lnl-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-bmg-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-nvls-1:         [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-nvls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-nvls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-adlp-7:         [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-ptl-1:          [PASS][11] -> [ABORT][12] +1 other test abort
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-wcl-2:          [PASS][13] -> [ABORT][14] +1 other test abort
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-wcl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-wcl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-bmg-2:          NOTRUN -> [ABORT][15] +1 other test abort
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-atsm-2:         [PASS][16] -> [ABORT][17] +1 other test abort
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-system:
    - bat-lnl-2:          [PASS][18] -> [ABORT][19] +1 other test abort
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-lnl-2/igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-system.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-lnl-2/igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-system.html

  * igt@xe_create@multigpu-create-massive-size:
    - bat-bmg-3:          [PASS][20] -> [ABORT][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  
Known issues
------------

  Here are the changes found in xe-pw-161473v20_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@nullptr:
    - bat-bmg-2:          NOTRUN -> [SKIP][22] ([Intel XE#2134]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-2/igt@fbdev@nullptr.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-bmg-2:          NOTRUN -> [SKIP][23] ([Intel XE#2233])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-bmg-2:          NOTRUN -> [SKIP][24] ([Intel XE#2489] / [Intel XE#3419]) +13 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-bmg-2:          NOTRUN -> [SKIP][25] ([Intel XE#2482]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-2:          NOTRUN -> [SKIP][26] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-bmg-2:          NOTRUN -> [SKIP][27] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html

  
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
  [Intel XE#6314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314


Build changes
-------------

  * Linux: xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef -> xe-pw-161473v20

  IGT_9059: f5a4ff79434df36db1d6b13deb37c90a6602565e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef: 275df33dcf4c5d018717867a0b29ed1d3b62c1ef
  xe-pw-161473v20: 161473v20

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/index.html

--===============4234877793320702448==
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
<tr><td><b>Series:</b></td><td>Add memory page offlining support (rev20)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161473/">https://patchwork.freedesktop.org/series/161473/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef_BAT -&gt; xe-pw-161473v20_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161473v20_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161473v20_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Additional (1): bat-bmg-2 <br />
  Missing    (2): bat-nvls-2 bat-wcl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161473v20_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-nvls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-nvls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-wcl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-wcl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-system:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-lnl-2/igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-lnl-2/igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-system.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161473v20_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161473v20/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef -&gt; xe-pw-161473v20</li>
</ul>
<p>IGT_9059: f5a4ff79434df36db1d6b13deb37c90a6602565e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5610-275df33dcf4c5d018717867a0b29ed1d3b62c1ef: 275df33dcf4c5d018717867a0b29ed1d3b62c1ef<br />
  xe-pw-161473v20: 161473v20</p>

</body>
</html>

--===============4234877793320702448==--
