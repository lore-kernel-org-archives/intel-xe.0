Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE281C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 04:47:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932D410E428;
	Wed,  7 Aug 2024 04:47:33 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0465110E428;
 Wed,  7 Aug 2024 04:47:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8527343406308786101=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Parallel_submission_of_dma_fence?=
 =?utf-8?q?_jobs_and_LR_jobs_with_shared_hardware_resources_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Aug 2024 04:47:33 -0000
Message-ID: <172300605300.544996.8046796546545977956@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240806192739.1076344-1-francois.dugast@intel.com>
In-Reply-To: <20240806192739.1076344-1-francois.dugast@intel.com>
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

--===============8527343406308786101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Parallel submission of dma fence jobs and LR jobs with shared hardware resources (rev6)
URL   : https://patchwork.freedesktop.org/series/136192/
State : failure

== Summary ==

CI Bug Log - changes from xe-1723-406de6351ab6af1718a41112d733422fe142fe21_BAT -> xe-pw-136192v6_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136192v6_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136192v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136192v6_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-lnl-2:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1723-406de6351ab6af1718a41112d733422fe142fe21/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v6/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_module_load@load:
    - bat-lnl-1:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1723-406de6351ab6af1718a41112d733422fe142fe21/bat-lnl-1/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v6/bat-lnl-1/igt@xe_module_load@load.html

  


Build changes
-------------

  * IGT: IGT_7958 -> IGT_7959
  * Linux: xe-1723-406de6351ab6af1718a41112d733422fe142fe21 -> xe-pw-136192v6

  IGT_7958: 5e93c0e266d7ebd74ea12b3b03cb50253a2ab760 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7959: 245f155172e086a9533b9f5624be34e2cafba809 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1723-406de6351ab6af1718a41112d733422fe142fe21: 406de6351ab6af1718a41112d733422fe142fe21
  xe-pw-136192v6: 136192v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v6/index.html

--===============8527343406308786101==
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
<tr><td><b>Series:</b></td><td>Parallel submission of dma fence jobs and LR jobs with shared hardware resources (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136192/">https://patchwork.freedesktop.org/series/136192/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1723-406de6351ab6af1718a41112d733422fe142fe21_BAT -&gt; xe-pw-136192v6_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136192v6_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136192v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136192v6_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1723-406de6351ab6af1718a41112d733422fe142fe21/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v6/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1723-406de6351ab6af1718a41112d733422fe142fe21/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136192v6/bat-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7958 -&gt; IGT_7959</li>
<li>Linux: xe-1723-406de6351ab6af1718a41112d733422fe142fe21 -&gt; xe-pw-136192v6</li>
</ul>
<p>IGT_7958: 5e93c0e266d7ebd74ea12b3b03cb50253a2ab760 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7959: 245f155172e086a9533b9f5624be34e2cafba809 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1723-406de6351ab6af1718a41112d733422fe142fe21: 406de6351ab6af1718a41112d733422fe142fe21<br />
  xe-pw-136192v6: 136192v6</p>

</body>
</html>

--===============8527343406308786101==--
