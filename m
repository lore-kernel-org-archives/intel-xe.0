Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC7AC43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 22:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1928E10E26D;
	Fri, 10 Jul 2026 22:40:42 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5B510E26D;
 Fri, 10 Jul 2026 22:40:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6591477481436769808=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/ttm=2C_drm/xe=3A_Minimi?=
 =?utf-8?q?ze_dma-resv_hold_times_and_defragment_sub-optimally_backed_BOs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Jul 2026 22:40:40 -0000
Message-ID: <178372324068.176614.6057033616268211451@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260710215442.2444235-1-matthew.brost@intel.com>
In-Reply-To: <20260710215442.2444235-1-matthew.brost@intel.com>
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

--===============6591477481436769808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm, drm/xe: Minimize dma-resv hold times and defragment sub-optimally backed BOs
URL   : https://patchwork.freedesktop.org/series/170216/
State : failure

== Summary ==

CI Bug Log - changes from xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1_BAT -> xe-pw-170216v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-170216v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-170216v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 13)
------------------------------

  Additional (1): bat-bmg-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-170216v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_create@create-massive-size:
    - bat-bmg-2:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-2/igt@xe_create@create-massive-size.html
    - bat-adlp-7:         [PASS][2] -> [ABORT][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-adlp-7/igt@xe_create@create-massive-size.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-adlp-7/igt@xe_create@create-massive-size.html
    - bat-bmg-vm:         [PASS][4] -> [ABORT][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-bmg-vm/igt@xe_create@create-massive-size.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-vm/igt@xe_create@create-massive-size.html
    - bat-bmg-1:          [PASS][6] -> [ABORT][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-bmg-1/igt@xe_create@create-massive-size.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-1/igt@xe_create@create-massive-size.html
    - bat-lnl-2:          [PASS][8] -> [ABORT][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-lnl-2/igt@xe_create@create-massive-size.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-lnl-2/igt@xe_create@create-massive-size.html
    - bat-ptl-2:          [PASS][10] -> [ABORT][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-ptl-2/igt@xe_create@create-massive-size.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-ptl-2/igt@xe_create@create-massive-size.html
    - bat-wcl-1:          [PASS][12] -> [ABORT][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-wcl-1/igt@xe_create@create-massive-size.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-wcl-1/igt@xe_create@create-massive-size.html
    - bat-atsm-2:         [PASS][14] -> [ABORT][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-atsm-2/igt@xe_create@create-massive-size.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-atsm-2/igt@xe_create@create-massive-size.html
    - bat-ptl-1:          [PASS][16] -> [ABORT][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-ptl-1/igt@xe_create@create-massive-size.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-ptl-1/igt@xe_create@create-massive-size.html
    - bat-lnl-1:          [PASS][18] -> [ABORT][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-lnl-1/igt@xe_create@create-massive-size.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-lnl-1/igt@xe_create@create-massive-size.html
    - bat-ptl-vm:         [PASS][20] -> [ABORT][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-ptl-vm/igt@xe_create@create-massive-size.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-ptl-vm/igt@xe_create@create-massive-size.html
    - bat-wcl-2:          [PASS][22] -> [ABORT][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-wcl-2/igt@xe_create@create-massive-size.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-wcl-2/igt@xe_create@create-massive-size.html

  * igt@xe_create@multigpu-create-massive-size:
    - bat-bmg-3:          [PASS][24] -> [ABORT][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  
Known issues
------------

  Here are the changes found in xe-pw-170216v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@nullptr:
    - bat-bmg-2:          NOTRUN -> [SKIP][26] ([Intel XE#2134]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-2/igt@fbdev@nullptr.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-bmg-2:          NOTRUN -> [SKIP][27] ([Intel XE#2233])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-bmg-2:          NOTRUN -> [SKIP][28] ([Intel XE#2489] / [Intel XE#3419]) +13 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-bmg-2:          NOTRUN -> [SKIP][29] ([Intel XE#2482]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-2:          NOTRUN -> [SKIP][30] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-bmg-2:          NOTRUN -> [SKIP][31] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html

  
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

  * Linux: xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1 -> xe-pw-170216v1

  IGT_9002: 9002
  xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1: 6d76f5afea7406e978db1fc356a9b88d0d8989d1
  xe-pw-170216v1: 170216v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/index.html

--===============6591477481436769808==
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
<tr><td><b>Series:</b></td><td>drm/ttm, drm/xe: Minimize dma-resv hold times and defragment sub-optimally backed BOs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170216/">https://patchwork.freedesktop.org/series/170216/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1_BAT -&gt; xe-pw-170216v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-170216v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-170216v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 13)</h2>
<p>Additional (1): bat-bmg-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-170216v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_create@create-massive-size:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-2/igt@xe_create@create-massive-size.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-adlp-7/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-adlp-7/igt@xe_create@create-massive-size.html">ABORT</a></li>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-bmg-vm/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-vm/igt@xe_create@create-massive-size.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-bmg-1/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-1/igt@xe_create@create-massive-size.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-lnl-2/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-lnl-2/igt@xe_create@create-massive-size.html">ABORT</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-ptl-2/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-ptl-2/igt@xe_create@create-massive-size.html">ABORT</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-wcl-1/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-wcl-1/igt@xe_create@create-massive-size.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-atsm-2/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-atsm-2/igt@xe_create@create-massive-size.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-ptl-1/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-ptl-1/igt@xe_create@create-massive-size.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-lnl-1/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-lnl-1/igt@xe_create@create-massive-size.html">ABORT</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-ptl-vm/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-ptl-vm/igt@xe_create@create-massive-size.html">ABORT</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-wcl-2/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-wcl-2/igt@xe_create@create-massive-size.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-170216v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170216v1/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1 -&gt; xe-pw-170216v1</li>
</ul>
<p>IGT_9002: 9002<br />
  xe-5385-6d76f5afea7406e978db1fc356a9b88d0d8989d1: 6d76f5afea7406e978db1fc356a9b88d0d8989d1<br />
  xe-pw-170216v1: 170216v1</p>

</body>
</html>

--===============6591477481436769808==--
