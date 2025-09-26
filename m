Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339E8CAC5B9
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 12:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E4110EA52;
	Fri, 26 Sep 2025 12:51:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD5C10EA52;
 Fri, 26 Sep 2025 12:51:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0961831717656736820=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_=3A_Add_GPU_work_period_sup?=
 =?utf-8?q?port_for_Xe_driver_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aakash Deep Sarkar" <aakash.deep.sarkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Sep 2025 12:51:57 -0000
Message-ID: <175889111704.370490.3139879624695121655@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
In-Reply-To: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
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

--===============0961831717656736820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: : Add GPU work period support for Xe driver (rev4)
URL   : https://patchwork.freedesktop.org/series/153341/
State : failure

== Summary ==

CI Bug Log - changes from xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24_BAT -> xe-pw-153341v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-153341v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-153341v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-153341v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-adlp-7:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-2:          [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-1:          [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-2:          [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/bat-dg2-oem2/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@fbdev@info:
    - bat-atsm-2:         [SKIP][13] ([Intel XE#2134]) -> [INCOMPLETE][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/bat-atsm-2/igt@fbdev@info.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/bat-atsm-2/igt@fbdev@info.html

  
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134


Build changes
-------------

  * Linux: xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24 -> xe-pw-153341v4

  IGT_8554: 8554
  xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24: d557b14c00c4ab027e66c1c7bf512cf479ff8c24
  xe-pw-153341v4: 153341v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/index.html

--===============0961831717656736820==
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
<tr><td><b>Series:</b></td><td>: Add GPU work period support for Xe driver (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153341/">https://patchwork.freedesktop.org/series/153341/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24_BAT -&gt; xe-pw-153341v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-153341v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-153341v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-153341v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@fbdev@info:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/bat-atsm-2/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/bat-atsm-2/igt@fbdev@info.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24 -&gt; xe-pw-153341v4</li>
</ul>
<p>IGT_8554: 8554<br />
  xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24: d557b14c00c4ab027e66c1c7bf512cf479ff8c24<br />
  xe-pw-153341v4: 153341v4</p>

</body>
</html>

--===============0961831717656736820==--
