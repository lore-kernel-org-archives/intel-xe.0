Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C67CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 13:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A60F10E0AB;
	Fri,  7 Nov 2025 13:54:08 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01BC10E0AB;
 Fri,  7 Nov 2025 13:54:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0518289421468928156=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_add_VM=5FBIND_DEC?=
 =?utf-8?q?OMPRESS_support_and_on=E2=80=91demand_decompression_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Nov 2025 13:54:06 -0000
Message-ID: <176252364671.28862.3639273616365693201@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251107114757.561671-5-nitin.r.gote@intel.com>
In-Reply-To: <20251107114757.561671-5-nitin.r.gote@intel.com>
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

--===============0518289421468928156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

== Series Details ==

Series: drm/xe: add VM_BIND DECOMPRESS support and on‑demand decompression (rev5)
URL   : https://patchwork.freedesktop.org/series/154714/
State : failure

== Summary ==

CI Bug Log - changes from xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4_BAT -> xe-pw-154714v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154714v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154714v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154714v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-bmg-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
    - bat-ptl-2:          [PASS][7] -> [ABORT][8] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - bat-lnl-1:          [PASS][9] -> [ABORT][10] +1 other test abort
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html

  * igt@kms_flip@basic-flip-vs-dpms@b-edp1:
    - bat-lnl-1:          [PASS][11] -> [DMESG-WARN][12] +1 other test dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html

  * igt@kms_flip@basic-flip-vs-dpms@c-edp1:
    - bat-ptl-2:          [PASS][13] -> [DMESG-WARN][14] +2 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - bat-adlp-7:         [PASS][15] -> [DMESG-WARN][16] +2 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html

  * igt@xe_compute@compute-square:
    - bat-ptl-1:          [PASS][17] -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-ptl-1/igt@xe_compute@compute-square.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-ptl-1/igt@xe_compute@compute-square.html

  * igt@xe_create@create-execqueues-noleak:
    - bat-pvc-2:          [PASS][19] -> [ABORT][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html
    - bat-ptl-vm:         [PASS][21] -> [ABORT][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-ptl-vm/igt@xe_create@create-execqueues-noleak.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-ptl-vm/igt@xe_create@create-execqueues-noleak.html
    - bat-bmg-2:          [PASS][23] -> [ABORT][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-bmg-2/igt@xe_create@create-execqueues-noleak.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-bmg-2/igt@xe_create@create-execqueues-noleak.html
    - bat-lnl-2:          [PASS][25] -> [ABORT][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html
    - bat-atsm-2:         [PASS][27] -> [ABORT][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
    - bat-adlp-vm:        [PASS][29] -> [ABORT][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-adlp-vm/igt@xe_create@create-execqueues-noleak.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-adlp-vm/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_create@multigpu-create-massive-size:
    - bat-bmg-3:          [PASS][31] -> [ABORT][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  


Build changes
-------------

  * Linux: xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4 -> xe-pw-154714v5

  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4: 1f25afd37c14352cd24ada205fe16ff022784bd4
  xe-pw-154714v5: 154714v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/index.html

--===============0518289421468928156==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


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
<tr><td><b>Series:</b></td><td>drm/xe: add VM_BIND DECOMPRESS support and on‑demand decompression (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154714/">https://patchwork.freedesktop.org/series/154714/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4_BAT -&gt; xe-pw-154714v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154714v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-154714v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-154714v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">ABORT</a> +1 other test abort</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-edp1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-edp1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-edp1:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-ptl-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-ptl-1/igt@xe_compute@compute-square.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html">ABORT</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-ptl-vm/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-ptl-vm/igt@xe_create@create-execqueues-noleak.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-bmg-2/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-bmg-2/igt@xe_create@create-execqueues-noleak.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">ABORT</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-adlp-vm/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-adlp-vm/igt@xe_create@create-execqueues-noleak.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154714v5/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4 -&gt; xe-pw-154714v5</li>
</ul>
<p>IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4067-1f25afd37c14352cd24ada205fe16ff022784bd4: 1f25afd37c14352cd24ada205fe16ff022784bd4<br />
  xe-pw-154714v5: 154714v5</p>

</body>
</html>

--===============0518289421468928156==--
