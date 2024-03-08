Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B6CC54E41
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 12:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B451E10E8FA;
	Fri,  8 Mar 2024 12:55:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EECE10E8FA;
 Fri,  8 Mar 2024 12:55:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3005435981829805930=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Modify_minimum_of_vari?=
 =?utf-8?q?ous_scheduler_timeout_to_0=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 Mar 2024 12:55:28 -0000
Message-ID: <170990252845.612256.6074020620424256935@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240308110058.2479126-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240308110058.2479126-1-himal.prasad.ghimiray@intel.com>
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

--===============3005435981829805930==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Modify minimum of various scheduler timeout to 0.
URL   : https://patchwork.freedesktop.org/series/130913/
State : failure

== Summary ==

CI Bug Log - changes from xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38_BAT -> xe-pw-130913v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-130913v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-130913v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-130913v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_sysfs_defaults@engine-defaults:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] +5 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-dg2-oem2/igt@xe_sysfs_defaults@engine-defaults.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v1/bat-dg2-oem2/igt@xe_sysfs_defaults@engine-defaults.html

  * igt@xe_sysfs_defaults@engine-defaults@ccs:
    - bat-atsm-2:         [PASS][3] -> [FAIL][4] +5 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-atsm-2/igt@xe_sysfs_defaults@engine-defaults@ccs.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v1/bat-atsm-2/igt@xe_sysfs_defaults@engine-defaults@ccs.html

  
Known issues
------------

  Here are the changes found in xe-pw-130913v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-dg2-oem2:       [TIMEOUT][5] ([Intel XE#1167]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  [Intel XE#1167]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167


Build changes
-------------

  * Linux: xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38 -> xe-pw-130913v1

  IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38: 024301d28b0b2cf492ffdb3ce688044cd9923f38
  xe-pw-130913v1: 130913v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v1/index.html

--===============3005435981829805930==
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
<tr><td><b>Series:</b></td><td>drm/xe: Modify minimum of various scheduler timeout to 0.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130913/">https://patchwork.freedesktop.org/series/130913/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38_BAT -&gt; xe-pw-130913v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-130913v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-130913v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-130913v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_sysfs_defaults@engine-defaults:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-dg2-oem2/igt@xe_sysfs_defaults@engine-defaults.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v1/bat-dg2-oem2/igt@xe_sysfs_defaults@engine-defaults.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_defaults@engine-defaults@ccs:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-atsm-2/igt@xe_sysfs_defaults@engine-defaults@ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v1/bat-atsm-2/igt@xe_sysfs_defaults@engine-defaults@ccs.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-130913v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-fd-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167">Intel XE#1167</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130913v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38 -&gt; xe-pw-130913v1</li>
</ul>
<p>IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-923-024301d28b0b2cf492ffdb3ce688044cd9923f38: 024301d28b0b2cf492ffdb3ce688044cd9923f38<br />
  xe-pw-130913v1: 130913v1</p>

</body>
</html>

--===============3005435981829805930==--
