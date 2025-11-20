Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20515CF885A
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 13:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC4710E280;
	Thu, 20 Nov 2025 13:47:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D7D10E280;
 Thu, 20 Nov 2025 13:47:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1991108812800883946=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_locking/ww=5Fmutex=2C_dma-b?=
 =?utf-8?q?uf/dma-resv=3A_Improve_detection_of_unheld_locks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Nov 2025 13:47:47 -0000
Message-ID: <176364646792.13788.8145732279171326278@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251120110341.2425-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251120110341.2425-1-thomas.hellstrom@linux.intel.com>
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

--===============1991108812800883946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: locking/ww_mutex, dma-buf/dma-resv: Improve detection of unheld locks
URL   : https://patchwork.freedesktop.org/series/157838/
State : failure

== Summary ==

CI Bug Log - changes from xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872_BAT -> xe-pw-157838v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157838v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157838v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 13)
------------------------------

  Additional (1): bat-dg2-oem2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157838v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-dg2-oem2:       NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [PASS][2] -> [ABORT][3] +1 other test abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
    - bat-ptl-2:          [PASS][4] -> [ABORT][5] +1 other test abort
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-dpms@c-edp1:
    - bat-ptl-2:          [PASS][6] -> [DMESG-WARN][7] +2 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - bat-adlp-7:         [PASS][8] -> [DMESG-WARN][9] +2 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html

  * igt@xe_compute@compute-square:
    - bat-ptl-1:          [PASS][10] -> [ABORT][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-ptl-1/igt@xe_compute@compute-square.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-ptl-1/igt@xe_compute@compute-square.html
    - bat-ptl-vm:         [PASS][12] -> [ABORT][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-ptl-vm/igt@xe_compute@compute-square.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-ptl-vm/igt@xe_compute@compute-square.html
    - bat-pvc-2:          [PASS][14] -> [ABORT][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-pvc-2/igt@xe_compute@compute-square.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-pvc-2/igt@xe_compute@compute-square.html
    - bat-adlp-vm:        [PASS][16] -> [ABORT][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-adlp-vm/igt@xe_compute@compute-square.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-adlp-vm/igt@xe_compute@compute-square.html
    - bat-atsm-2:         [PASS][18] -> [ABORT][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-atsm-2/igt@xe_compute@compute-square.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-atsm-2/igt@xe_compute@compute-square.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - bat-bmg-3:          [PASS][20] -> [ABORT][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-bmg-3/igt@xe_exec_basic@multigpu-once-basic.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-bmg-3/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_module_load@load:
    - bat-lnl-1:          [PASS][22] -> [ABORT][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-lnl-1/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-lnl-1/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][24] -> [ABORT][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-lnl-2/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-lnl-2/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-157838v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][26] ([Intel XE#623])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623


Build changes
-------------

  * Linux: xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872 -> xe-pw-157838v1

  IGT_8635: 8635
  xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872: 434668b827ca78eb5bf6645ad31fa6d0217c3872
  xe-pw-157838v1: 157838v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/index.html

--===============1991108812800883946==
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
<tr><td><b>Series:</b></td><td>locking/ww_mutex, dma-buf/dma-resv: Improve detection of unheld locks</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157838/">https://patchwork.freedesktop.org/series/157838/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872_BAT -&gt; xe-pw-157838v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157838v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-157838v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 13)</h2>
<p>Additional (1): bat-dg2-oem2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-157838v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">ABORT</a> +1 other test abort</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-edp1:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-ptl-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-ptl-1/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-ptl-vm/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-ptl-vm/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-pvc-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-pvc-2/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-adlp-vm/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-adlp-vm/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-atsm-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-atsm-2/igt@xe_compute@compute-square.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-bmg-3/igt@xe_exec_basic@multigpu-once-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-bmg-3/igt@xe_exec_basic@multigpu-once-basic.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-lnl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-lnl-2/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157838v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157838v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872 -&gt; xe-pw-157838v1</li>
</ul>
<p>IGT_8635: 8635<br />
  xe-4133-434668b827ca78eb5bf6645ad31fa6d0217c3872: 434668b827ca78eb5bf6645ad31fa6d0217c3872<br />
  xe-pw-157838v1: 157838v1</p>

</body>
</html>

--===============1991108812800883946==--
