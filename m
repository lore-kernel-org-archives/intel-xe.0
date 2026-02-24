Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFDAF4BB70
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 18:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44BA10E614;
	Tue, 24 Feb 2026 18:21:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80AD10E613;
 Tue, 24 Feb 2026 18:21:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1331094157506937946=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Workaround_cleanup_=26_simp?=
 =?utf-8?q?lification_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Feb 2026 18:21:47 -0000
Message-ID: <177195730779.281933.15808915834120370568@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260223-forupstream-wa_cleanup-v3-0-7f201eb2f172@intel.com>
In-Reply-To: <20260223-forupstream-wa_cleanup-v3-0-7f201eb2f172@intel.com>
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

--===============1331094157506937946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Workaround cleanup & simplification (rev4)
URL   : https://patchwork.freedesktop.org/series/161606/
State : failure

== Summary ==

CI Bug Log - changes from xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904_BAT -> xe-pw-161606v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161606v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161606v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161606v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-bmg-2:          [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-bmg-1:          [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@xe_compute@compute-square:
    - bat-ptl-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-ptl-1/igt@xe_compute@compute-square.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-ptl-1/igt@xe_compute@compute-square.html
    - bat-ptl-vm:         [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-ptl-vm/igt@xe_compute@compute-square.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-ptl-vm/igt@xe_compute@compute-square.html
    - bat-lnl-1:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-lnl-1/igt@xe_compute@compute-square.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-lnl-1/igt@xe_compute@compute-square.html
    - bat-wcl-2:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-wcl-2/igt@xe_compute@compute-square.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-wcl-2/igt@xe_compute@compute-square.html
    - bat-bmg-2:          [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-2/igt@xe_compute@compute-square.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-bmg-2/igt@xe_compute@compute-square.html
    - bat-bmg-1:          [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-1/igt@xe_compute@compute-square.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-bmg-1/igt@xe_compute@compute-square.html
    - bat-adlp-7:         [PASS][17] -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-adlp-7/igt@xe_compute@compute-square.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-adlp-7/igt@xe_compute@compute-square.html
    - bat-lnl-2:          [PASS][19] -> [ABORT][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-lnl-2/igt@xe_compute@compute-square.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-lnl-2/igt@xe_compute@compute-square.html
    - bat-ptl-2:          [PASS][21] -> [ABORT][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-ptl-2/igt@xe_compute@compute-square.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-ptl-2/igt@xe_compute@compute-square.html
    - bat-dg2-oem2:       [PASS][23] -> [ABORT][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-dg2-oem2/igt@xe_compute@compute-square.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-dg2-oem2/igt@xe_compute@compute-square.html
    - bat-adlp-vm:        [PASS][25] -> [ABORT][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-adlp-vm/igt@xe_compute@compute-square.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-adlp-vm/igt@xe_compute@compute-square.html
    - bat-wcl-1:          [PASS][27] -> [ABORT][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-wcl-1/igt@xe_compute@compute-square.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-wcl-1/igt@xe_compute@compute-square.html
    - bat-atsm-2:         [PASS][29] -> [ABORT][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-atsm-2/igt@xe_compute@compute-square.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-atsm-2/igt@xe_compute@compute-square.html

  * igt@xe_module_load@load:
    - bat-bmg-3:          [PASS][31] -> [DMESG-WARN][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-3/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-bmg-3/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - bat-bmg-3:          [PASS][33] -> [ABORT][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  


Build changes
-------------

  * IGT: IGT_8765 -> IGT_8768
  * Linux: xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904 -> xe-pw-161606v4

  IGT_8765: 8765
  IGT_8768: 8768
  xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904: 45a3045fc0dc46a893cb8bbe304afafd4120c904
  xe-pw-161606v4: 161606v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/index.html

--===============1331094157506937946==
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
<tr><td><b>Series:</b></td><td>Workaround cleanup &amp; simplification (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161606/">https://patchwork.freedesktop.org/series/161606/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904_BAT -&gt; xe-pw-161606v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161606v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161606v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161606v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-ptl-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-ptl-1/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-ptl-vm/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-ptl-vm/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-lnl-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-lnl-1/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-wcl-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-wcl-2/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-bmg-2/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-bmg-1/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-adlp-7/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-adlp-7/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-lnl-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-lnl-2/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-ptl-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-ptl-2/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-dg2-oem2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-dg2-oem2/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-adlp-vm/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-adlp-vm/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-wcl-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-wcl-1/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-atsm-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-atsm-2/igt@xe_compute@compute-square.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161606v4/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8765 -&gt; IGT_8768</li>
<li>Linux: xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904 -&gt; xe-pw-161606v4</li>
</ul>
<p>IGT_8765: 8765<br />
  IGT_8768: 8768<br />
  xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904: 45a3045fc0dc46a893cb8bbe304afafd4120c904<br />
  xe-pw-161606v4: 161606v4</p>

</body>
</html>

--===============1331094157506937946==--
