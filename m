Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C9EE7FDF3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 23:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEE010E038;
	Mon,  2 Feb 2026 23:19:22 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5715310E038;
 Mon,  2 Feb 2026 23:19:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4118107846861997284=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/irq=3A_Introduce_xe?=
 =?utf-8?q?=5Firq=5Finit=5Flate=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Feb 2026 23:19:21 -0000
Message-ID: <177007436132.218362.2361344539871725405@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260202114609.1276227-1-raag.jadav@intel.com>
In-Reply-To: <20260202114609.1276227-1-raag.jadav@intel.com>
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

--===============4118107846861997284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/irq: Introduce xe_irq_init_late()
URL   : https://patchwork.freedesktop.org/series/161012/
State : failure

== Summary ==

CI Bug Log - changes from xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3_BAT -> xe-pw-161012v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161012v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161012v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 10)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161012v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_module_load@load:
    - bat-ptl-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-ptl-2/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-ptl-2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-atsm-2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-atsm-2/igt@xe_module_load@load.html
    - bat-ptl-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-ptl-1/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-ptl-1/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-bmg-2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-3:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-bmg-3/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-bmg-3/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-bmg-1/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-bmg-1/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-161012v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][13] -> [ABORT][14] ([Intel XE#5466])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-dg2-oem2/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][15] -> [ABORT][16] ([Intel XE#5466])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-lnl-1/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-lnl-1/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][17] -> [ABORT][18] ([Intel XE#5466])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-adlp-7/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-adlp-7/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][19] -> [ABORT][20] ([Intel XE#5466])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-lnl-2/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-lnl-2/igt@xe_module_load@load.html

  
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466


Build changes
-------------

  * Linux: xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3 -> xe-pw-161012v1

  IGT_8729: 8729
  xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3: a68485eec77211a46da7bdb6a0f862e4b365f1e3
  xe-pw-161012v1: 161012v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/index.html

--===============4118107846861997284==
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
<tr><td><b>Series:</b></td><td>drm/xe/irq: Introduce xe_irq_init_late()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161012/">https://patchwork.freedesktop.org/series/161012/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3_BAT -&gt; xe-pw-161012v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161012v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161012v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 10)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161012v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-ptl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-ptl-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-atsm-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-ptl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-ptl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-bmg-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-bmg-3/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161012v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-lnl-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-adlp-7/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161012v1/bat-lnl-2/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3 -&gt; xe-pw-161012v1</li>
</ul>
<p>IGT_8729: 8729<br />
  xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3: a68485eec77211a46da7bdb6a0f862e4b365f1e3<br />
  xe-pw-161012v1: 161012v1</p>

</body>
</html>

--===============4118107846861997284==--
