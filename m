Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FA0CCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 05:55:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F25210E173;
	Thu, 16 Oct 2025 05:55:52 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8571710E173;
 Thu, 16 Oct 2025 05:55:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2808672064391715103=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Add_Xe3p_support_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Oct 2025 05:55:51 -0000
Message-ID: <176059415153.20573.7963334260927000868@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
In-Reply-To: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
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

--===============2808672064391715103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add Xe3p support (rev2)
URL   : https://patchwork.freedesktop.org/series/155866/
State : failure

== Summary ==

CI Bug Log - changes from xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8_BAT -> xe-pw-155866v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-155866v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-155866v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-155866v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-ptl-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-ptl-2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-ptl-2/igt@xe_module_load@load.html
    - bat-dg2-oem2:       [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-dg2-oem2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-atsm-2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-atsm-2/igt@xe_module_load@load.html
    - bat-ptl-1:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-ptl-1/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-ptl-1/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-lnl-1/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-lnl-1/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-bmg-2/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-bmg-1/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-bmg-1/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-adlp-7/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-adlp-7/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][17] -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-lnl-2/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-lnl-2/igt@xe_module_load@load.html

  


Build changes
-------------

  * Linux: xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8 -> xe-pw-155866v2

  IGT_8587: 8587
  xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8: 7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8
  xe-pw-155866v2: 155866v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/index.html

--===============2808672064391715103==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add Xe3p support (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155866/">https://patchwork.freedesktop.org/series/155866/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8_BAT -&gt; xe-pw-155866v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-155866v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-155866v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-155866v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-ptl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-ptl-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-atsm-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-ptl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-ptl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-lnl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-bmg-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-adlp-7/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155866v2/bat-lnl-2/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8 -&gt; xe-pw-155866v2</li>
</ul>
<p>IGT_8587: 8587<br />
  xe-3929-7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8: 7ba235d0e0cf055008e2f28b3b3bea6673bfc6c8<br />
  xe-pw-155866v2: 155866v2</p>

</body>
</html>

--===============2808672064391715103==--
