Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A5AEC111A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 18:27:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3BA10E425;
	Mon, 23 Feb 2026 18:27:24 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F05C10E417;
 Mon, 23 Feb 2026 18:27:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7195090817956153680=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/selftests=3A_Fix_b?=
 =?utf-8?q?uild_after_dma-fence_locking_rework?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Feb 2026 18:27:23 -0000
Message-ID: <177187124310.277322.7821179989313399099@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260223172553.1663749-1-matthew.brost@intel.com>
In-Reply-To: <20260223172553.1663749-1-matthew.brost@intel.com>
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

--===============7195090817956153680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/selftests: Fix build after dma-fence locking rework
URL   : https://patchwork.freedesktop.org/series/161999/
State : failure

== Summary ==

CI Bug Log - changes from xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904_BAT -> xe-pw-161999v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161999v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161999v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161999v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_compute@compute-square:
    - bat-ptl-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-ptl-1/igt@xe_compute@compute-square.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-ptl-1/igt@xe_compute@compute-square.html
    - bat-ptl-vm:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-ptl-vm/igt@xe_compute@compute-square.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-ptl-vm/igt@xe_compute@compute-square.html
    - bat-lnl-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-lnl-1/igt@xe_compute@compute-square.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-lnl-1/igt@xe_compute@compute-square.html
    - bat-wcl-2:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-wcl-2/igt@xe_compute@compute-square.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-wcl-2/igt@xe_compute@compute-square.html
    - bat-bmg-2:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-2/igt@xe_compute@compute-square.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-bmg-2/igt@xe_compute@compute-square.html
    - bat-bmg-1:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-1/igt@xe_compute@compute-square.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-bmg-1/igt@xe_compute@compute-square.html
    - bat-adlp-7:         [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-adlp-7/igt@xe_compute@compute-square.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-adlp-7/igt@xe_compute@compute-square.html
    - bat-lnl-2:          [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-lnl-2/igt@xe_compute@compute-square.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-lnl-2/igt@xe_compute@compute-square.html
    - bat-ptl-2:          [PASS][17] -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-ptl-2/igt@xe_compute@compute-square.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-ptl-2/igt@xe_compute@compute-square.html
    - bat-dg2-oem2:       [PASS][19] -> [ABORT][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-dg2-oem2/igt@xe_compute@compute-square.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-dg2-oem2/igt@xe_compute@compute-square.html
    - bat-adlp-vm:        [PASS][21] -> [ABORT][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-adlp-vm/igt@xe_compute@compute-square.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-adlp-vm/igt@xe_compute@compute-square.html
    - bat-wcl-1:          [PASS][23] -> [ABORT][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-wcl-1/igt@xe_compute@compute-square.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-wcl-1/igt@xe_compute@compute-square.html
    - bat-atsm-2:         [PASS][25] -> [ABORT][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-atsm-2/igt@xe_compute@compute-square.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-atsm-2/igt@xe_compute@compute-square.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - bat-bmg-3:          [PASS][27] -> [ABORT][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  


Build changes
-------------

  * Linux: xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904 -> xe-pw-161999v1

  IGT_8765: 8765
  xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904: 45a3045fc0dc46a893cb8bbe304afafd4120c904
  xe-pw-161999v1: 161999v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/index.html

--===============7195090817956153680==
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
<tr><td><b>Series:</b></td><td>drm/i915/selftests: Fix build after dma-fence locking rework</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161999/">https://patchwork.freedesktop.org/series/161999/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904_BAT -&gt; xe-pw-161999v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161999v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161999v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161999v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-ptl-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-ptl-1/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-ptl-vm/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-ptl-vm/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-lnl-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-lnl-1/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-wcl-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-wcl-2/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-bmg-2/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-bmg-1/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-adlp-7/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-adlp-7/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-lnl-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-lnl-2/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-ptl-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-ptl-2/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-dg2-oem2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-dg2-oem2/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-adlp-vm/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-adlp-vm/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-wcl-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-wcl-1/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-atsm-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-atsm-2/igt@xe_compute@compute-square.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161999v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904 -&gt; xe-pw-161999v1</li>
</ul>
<p>IGT_8765: 8765<br />
  xe-4591-45a3045fc0dc46a893cb8bbe304afafd4120c904: 45a3045fc0dc46a893cb8bbe304afafd4120c904<br />
  xe-pw-161999v1: 161999v1</p>

</body>
</html>

--===============7195090817956153680==--
