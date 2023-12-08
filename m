Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DCAC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 13:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401FD10E2B2;
	Fri,  8 Dec 2023 13:23:43 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9101710E1BE;
 Fri,  8 Dec 2023 13:23:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8A8F8AADD5;
 Fri,  8 Dec 2023 13:23:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1174122051996614177=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5B1/3=5D_d?=
 =?utf-8?q?rm/xe=3A_Change_the_name_of_frequency_sysfs_attributes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Fri, 08 Dec 2023 13:23:41 -0000
Message-ID: <170204182154.7327.7832851576474268272@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231208051153.664055-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231208051153.664055-1-rodrigo.vivi@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============1174122051996614177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] drm/xe: Change the name of frequency sysfs attributes (rev2)
URL   : https://patchwork.freedesktop.org/series/127544/
State : failure

== Summary ==

CI Bug Log - changes from xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995_BAT -> xe-pw-127544v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-127544v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-127544v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-127544v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_guc_pc@freq_range_idle:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-dg2-oem2/igt@xe_guc_pc@freq_range_idle.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-dg2-oem2/igt@xe_guc_pc@freq_range_idle.html
    - bat-atsm-2:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-atsm-2/igt@xe_guc_pc@freq_range_idle.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-atsm-2/igt@xe_guc_pc@freq_range_idle.html

  
Known issues
------------

  Here are the changes found in xe-pw-127544v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_guc_pc@freq_basic_api:
    - bat-adlp-7:         [PASS][7] -> [FAIL][8] ([Intel XE#935])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
    - bat-dg2-oem2:       [PASS][9] -> [FAIL][10] ([Intel XE#935])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html
    - bat-atsm-2:         [PASS][11] -> [FAIL][12] ([Intel XE#935])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html
    - bat-pvc-2:          [PASS][13] -> [FAIL][14] ([Intel XE#935])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html

  * igt@xe_guc_pc@freq_fixed_idle:
    - bat-dg2-oem2:       [PASS][15] -> [FAIL][16] ([Intel XE#940])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html
    - bat-atsm-2:         [PASS][17] -> [FAIL][18] ([Intel XE#940])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html
    - bat-adlp-7:         [PASS][19] -> [FAIL][20] ([Intel XE#940])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-adlp-7/igt@xe_guc_pc@freq_fixed_idle.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-adlp-7/igt@xe_guc_pc@freq_fixed_idle.html

  
  [Intel XE#935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/935
  [Intel XE#940]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/940


Build changes
-------------

  * Linux: xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995 -> xe-pw-127544v2

  IGT_7628: 431c2d2dd5828b25fcbe1c82afbac865f4771aee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995: c4235ef53c0265159d2c5f34459a3b6c37ab1995
  xe-pw-127544v2: 127544v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/index.html

--===============1174122051996614177==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] drm/xe: Change the name of frequency sysfs attributes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127544/">https://patchwork.freedesktop.org/series/127544/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995_BAT -&gt; xe-pw-127544v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-127544v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-127544v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-127544v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_guc_pc@freq_range_idle:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-dg2-oem2/igt@xe_guc_pc@freq_range_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-dg2-oem2/igt@xe_guc_pc@freq_range_idle.html">FAIL</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-atsm-2/igt@xe_guc_pc@freq_range_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-atsm-2/igt@xe_guc_pc@freq_range_idle.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127544v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_guc_pc@freq_basic_api:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>)</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>)</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>)</p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_fixed_idle:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>)</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>)</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995/bat-adlp-7/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127544v2/bat-adlp-7/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995 -&gt; xe-pw-127544v2</li>
</ul>
<p>IGT_7628: 431c2d2dd5828b25fcbe1c82afbac865f4771aee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-561-c4235ef53c0265159d2c5f34459a3b6c37ab1995: c4235ef53c0265159d2c5f34459a3b6c37ab1995<br />
  xe-pw-127544v2: 127544v2</p>

</body>
</html>

--===============1174122051996614177==--
