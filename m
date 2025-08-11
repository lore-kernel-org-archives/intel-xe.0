Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F40DCA0EC0
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 08:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C919510E396;
	Mon, 11 Aug 2025 08:45:49 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D0F10E311;
 Mon, 11 Aug 2025 08:45:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7022964582547848464=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Consolidate_VM_in?=
 =?utf-8?q?itialization_logic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Aug 2025 08:45:49 -0000
Message-ID: <175490194945.225352.2460871223432465235@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250811073856.1950732-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250811073856.1950732-1-piotr.piorkowski@intel.com>
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

--===============7022964582547848464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Consolidate VM initialization logic
URL   : https://patchwork.freedesktop.org/series/152748/
State : failure

== Summary ==

CI Bug Log - changes from xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b_BAT -> xe-pw-152748v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152748v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152748v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152748v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-dg2-oem2:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-bmg-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - bat-lnl-1:          [PASS][7] -> [ABORT][8] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html

  * igt@kms_flip@basic-flip-vs-dpms@b-edp1:
    - bat-lnl-1:          [PASS][9] -> [DMESG-WARN][10] +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - bat-adlp-7:         [PASS][11] -> [DMESG-WARN][12] +2 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html

  * igt@xe_compute@compute-square:
    - bat-bmg-2:          [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-bmg-2/igt@xe_compute@compute-square.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-bmg-2/igt@xe_compute@compute-square.html
    - bat-lnl-2:          [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-lnl-2/igt@xe_compute@compute-square.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-lnl-2/igt@xe_compute@compute-square.html
    - bat-atsm-2:         [PASS][17] -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-atsm-2/igt@xe_compute@compute-square.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-atsm-2/igt@xe_compute@compute-square.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@basic-flip-vs-dpms:
    - {bat-ptl-2}:        [PASS][19] -> [ABORT][20] +1 other test abort
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-dpms@c-edp1:
    - {bat-ptl-2}:        [PASS][21] -> [DMESG-WARN][22] +2 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html

  * igt@xe_compute@compute-square:
    - {bat-ptl-1}:        [PASS][23] -> [ABORT][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-ptl-1/igt@xe_compute@compute-square.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-ptl-1/igt@xe_compute@compute-square.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * Linux: xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b -> xe-pw-152748v1

  IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b: 0a2be3731268a69a6452047c2fb6699ee19afe5b
  xe-pw-152748v1: 152748v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/index.html

--===============7022964582547848464==
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
<tr><td><b>Series:</b></td><td>drm/xe: Consolidate VM initialization logic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152748/">https://patchwork.freedesktop.org/series/152748/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b_BAT -&gt; xe-pw-152748v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152748v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-152748v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-152748v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-edp1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-edp1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-bmg-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-bmg-2/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-lnl-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-lnl-2/igt@xe_compute@compute-square.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-atsm-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-atsm-2/igt@xe_compute@compute-square.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-edp1:</p>
<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b/bat-ptl-1/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152748v1/bat-ptl-1/igt@xe_compute@compute-square.html">ABORT</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b -&gt; xe-pw-152748v1</li>
</ul>
<p>IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3522-0a2be3731268a69a6452047c2fb6699ee19afe5b: 0a2be3731268a69a6452047c2fb6699ee19afe5b<br />
  xe-pw-152748v1: 152748v1</p>

</body>
</html>

--===============7022964582547848464==--
