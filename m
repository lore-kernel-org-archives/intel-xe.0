Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78668D116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 21:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1935B10E495;
	Mon,  1 Dec 2025 21:33:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304B110E113;
 Mon,  1 Dec 2025 21:33:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0293237993367170911=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/cri=3A_Enable_I2C_co?=
 =?utf-8?q?ntroller_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Dec 2025 21:33:54 -0000
Message-ID: <176462483417.45889.7301138259993131290@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251128084414.306265-1-raag.jadav@intel.com>
In-Reply-To: <20251128084414.306265-1-raag.jadav@intel.com>
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

--===============0293237993367170911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/cri: Enable I2C controller (rev2)
URL   : https://patchwork.freedesktop.org/series/158198/
State : failure

== Summary ==

CI Bug Log - changes from xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26_BAT -> xe-pw-158198v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-158198v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-158198v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-158198v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_queue_property@invalid-property:
    - bat-ptl-2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html
    - bat-atsm-2:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-adlp-vm:        [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html
    - bat-ptl-1:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html
    - bat-lnl-1:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html
    - bat-ptl-vm:         [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-ptl-vm/igt@xe_exec_queue_property@invalid-property.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-ptl-vm/igt@xe_exec_queue_property@invalid-property.html
    - bat-bmg-2:          [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-adlp-7:         [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html
    - bat-bmg-1:          [PASS][19] -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html
    - bat-lnl-2:          [PASS][21] -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html

  
Known issues
------------

  Here are the changes found in xe-pw-158198v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [TIMEOUT][23] ([Intel XE#6506]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * Linux: xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26 -> xe-pw-158198v2

  IGT_8647: 8647
  xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26: a8fcc7aa61a86982dcb0990aeb928ecca39bea26
  xe-pw-158198v2: 158198v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/index.html

--===============0293237993367170911==
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
<tr><td><b>Series:</b></td><td>drm/xe/cri: Enable I2C controller (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158198/">https://patchwork.freedesktop.org/series/158198/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26_BAT -&gt; xe-pw-158198v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-158198v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-158198v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-158198v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_queue_property@invalid-property:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-ptl-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-dg2-oem2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-atsm-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-adlp-vm/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-ptl-1/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-ptl-vm/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-ptl-vm/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-adlp-7/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158198v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158198v2/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26 -&gt; xe-pw-158198v2</li>
</ul>
<p>IGT_8647: 8647<br />
  xe-4176-a8fcc7aa61a86982dcb0990aeb928ecca39bea26: a8fcc7aa61a86982dcb0990aeb928ecca39bea26<br />
  xe-pw-158198v2: 158198v2</p>

</body>
</html>

--===============0293237993367170911==--
