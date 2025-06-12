Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4407C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 15:10:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6029710E890;
	Thu, 12 Jun 2025 15:10:34 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC8510E880;
 Thu, 12 Jun 2025 15:10:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6053716262602939134=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/panel=3A_make_pane?=
 =?utf-8?q?l_funcs_static?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Jun 2025 15:10:33 -0000
Message-ID: <174974103317.72706.3792675565194426293@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250612124617.626958-1-jani.nikula@intel.com>
In-Reply-To: <20250612124617.626958-1-jani.nikula@intel.com>
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

--===============6053716262602939134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/panel: make panel funcs static
URL   : https://patchwork.freedesktop.org/series/150164/
State : failure

== Summary ==

CI Bug Log - changes from xe-3239-00d9cf004336a745e36e9f103acf7925f714d97e_BAT -> xe-pw-150164v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-150164v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-150164v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-150164v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3239-00d9cf004336a745e36e9f103acf7925f714d97e/bat-bmg-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150164v1/bat-bmg-2/igt@xe_prime_self_import@basic-with_one_bo.html
    - bat-bmg-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3239-00d9cf004336a745e36e9f103acf7925f714d97e/bat-bmg-1/igt@xe_prime_self_import@basic-with_one_bo.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150164v1/bat-bmg-1/igt@xe_prime_self_import@basic-with_one_bo.html
    - bat-lnl-2:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3239-00d9cf004336a745e36e9f103acf7925f714d97e/bat-lnl-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150164v1/bat-lnl-2/igt@xe_prime_self_import@basic-with_one_bo.html
    - bat-lnl-1:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3239-00d9cf004336a745e36e9f103acf7925f714d97e/bat-lnl-1/igt@xe_prime_self_import@basic-with_one_bo.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150164v1/bat-lnl-1/igt@xe_prime_self_import@basic-with_one_bo.html
    - bat-dg2-oem2:       [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3239-00d9cf004336a745e36e9f103acf7925f714d97e/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_one_bo.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150164v1/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_one_bo.html

  


Build changes
-------------

  * Linux: xe-3239-00d9cf004336a745e36e9f103acf7925f714d97e -> xe-pw-150164v1

  IGT_8406: 12d7c99650c85e479571b6db2c392408be474c88 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3239-00d9cf004336a745e36e9f103acf7925f714d97e: 00d9cf004336a745e36e9f103acf7925f714d97e
  xe-pw-150164v1: 150164v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150164v1/index.html

--===============6053716262602939134==
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
<tr><td><b>Series:</b></td><td>drm/i915/panel: make panel funcs static</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150164/">https://patchwork.freedesktop.org/series/150164/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150164v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150164v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3239-00d9cf004336a745e36e9f103acf7925f714d97e_BAT -&gt; xe-pw-150164v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-150164v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-150164v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-150164v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_prime_self_import@basic-with_one_bo:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3239-00d9cf004336a745e36e9f103acf7925f714d97e/bat-bmg-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150164v1/bat-bmg-2/igt@xe_prime_self_import@basic-with_one_bo.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3239-00d9cf004336a745e36e9f103acf7925f714d97e/bat-bmg-1/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150164v1/bat-bmg-1/igt@xe_prime_self_import@basic-with_one_bo.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3239-00d9cf004336a745e36e9f103acf7925f714d97e/bat-lnl-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150164v1/bat-lnl-2/igt@xe_prime_self_import@basic-with_one_bo.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3239-00d9cf004336a745e36e9f103acf7925f714d97e/bat-lnl-1/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150164v1/bat-lnl-1/igt@xe_prime_self_import@basic-with_one_bo.html">ABORT</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3239-00d9cf004336a745e36e9f103acf7925f714d97e/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150164v1/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_one_bo.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3239-00d9cf004336a745e36e9f103acf7925f714d97e -&gt; xe-pw-150164v1</li>
</ul>
<p>IGT_8406: 12d7c99650c85e479571b6db2c392408be474c88 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3239-00d9cf004336a745e36e9f103acf7925f714d97e: 00d9cf004336a745e36e9f103acf7925f714d97e<br />
  xe-pw-150164v1: 150164v1</p>

</body>
</html>

--===============6053716262602939134==--
