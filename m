Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369A1CD98D2
	for <intel-xe@archiver.kernel.org>; Sat, 13 Jun 2026 01:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C8610EBAD;
	Sat, 13 Jun 2026 01:38:10 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E4310EBAD;
 Sat, 13 Jun 2026 01:38:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4741275605352847975=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Disable_schedulin?=
 =?utf-8?q?g_early_on_FD_close_to_avoid_CAT_error_cascade_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 13 Jun 2026 01:38:09 -0000
Message-ID: <178131468967.75226.2679492420914538768@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260612232831.3881444-1-matthew.brost@intel.com>
In-Reply-To: <20260612232831.3881444-1-matthew.brost@intel.com>
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

--===============4741275605352847975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Disable scheduling early on FD close to avoid CAT error cascade (rev2)
URL   : https://patchwork.freedesktop.org/series/168398/
State : failure

== Summary ==

CI Bug Log - changes from xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d_BAT -> xe-pw-168398v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168398v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168398v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168398v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-ptl-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-wcl-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-wcl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-wcl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-lnl-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-bmg-1:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-adlp-7:         [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@xe_compute@compute-square:
    - bat-ptl-1:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-ptl-1/igt@xe_compute@compute-square.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-ptl-1/igt@xe_compute@compute-square.html
    - bat-ptl-vm:         [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-ptl-vm/igt@xe_compute@compute-square.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-ptl-vm/igt@xe_compute@compute-square.html
    - bat-wcl-2:          [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-wcl-2/igt@xe_compute@compute-square.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-wcl-2/igt@xe_compute@compute-square.html
    - bat-bmg-vm:         [PASS][17] -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-bmg-vm/igt@xe_compute@compute-square.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-bmg-vm/igt@xe_compute@compute-square.html
    - bat-bmg-2:          [PASS][19] -> [ABORT][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-bmg-2/igt@xe_compute@compute-square.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-bmg-2/igt@xe_compute@compute-square.html
    - bat-atsm-2:         [PASS][21] -> [ABORT][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-atsm-2/igt@xe_compute@compute-square.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-atsm-2/igt@xe_compute@compute-square.html

  * igt@xe_create@multigpu-create-massive-size:
    - bat-bmg-3:          [PASS][23] -> [ABORT][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  


Build changes
-------------

  * Linux: xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d -> xe-pw-168398v2

  IGT_8962: 8962
  xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d: 0a594940e4735e040c3e6ce4a916daa455008b8d
  xe-pw-168398v2: 168398v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/index.html

--===============4741275605352847975==
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
<tr><td><b>Series:</b></td><td>drm/xe: Disable scheduling early on FD close to avoid CAT error cascade (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168398/">https://patchwork.freedesktop.org/series/168398/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d_BAT -&gt; xe-pw-168398v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168398v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-168398v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-168398v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-wcl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-wcl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-ptl-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-ptl-1/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-ptl-vm/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-ptl-vm/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-wcl-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-wcl-2/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-bmg-vm/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-bmg-vm/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-bmg-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-bmg-2/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-atsm-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-atsm-2/igt@xe_compute@compute-square.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168398v2/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d -&gt; xe-pw-168398v2</li>
</ul>
<p>IGT_8962: 8962<br />
  xe-5252-0a594940e4735e040c3e6ce4a916daa455008b8d: 0a594940e4735e040c3e6ce4a916daa455008b8d<br />
  xe-pw-168398v2: 168398v2</p>

</body>
</html>

--===============4741275605352847975==--
