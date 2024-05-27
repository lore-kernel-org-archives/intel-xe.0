Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5534C25B79
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 22:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635E010E0E4;
	Mon, 27 May 2024 22:09:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1F310E0E4;
 Mon, 27 May 2024 22:09:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7363639547606826624=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Test_GSC_loading_with_Wa=5F22019?=
 =?utf-8?q?338487?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 May 2024 22:09:15 -0000
Message-ID: <171684775596.2213173.13759728651590783933@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240527211928.1179357-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240527211928.1179357-1-daniele.ceraolospurio@intel.com>
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

--===============7363639547606826624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Test GSC loading with Wa_22019338487
URL   : https://patchwork.freedesktop.org/series/134099/
State : success

== Summary ==

CI Bug Log - changes from xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c_BAT -> xe-pw-134099v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-134099v1_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {bat-lnl-1}:        [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134099v1/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-134099v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-dg2-oem2:       [PASS][3] -> [ABORT][4] ([Intel XE#1908] / [Intel XE#1939])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134099v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  
#### Possible fixes ####

  * igt@xe_gt_freq@freq_range_idle:
    - {bat-lnl-1}:        [SKIP][5] ([Intel XE#1462]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134099v1/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - {bat-lnl-1}:        [FAIL][7] ([Intel XE#1442]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134099v1/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
  [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
  [Intel XE#1939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939


Build changes
-------------

  * Linux: xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c -> xe-pw-134099v1

  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c: e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c
  xe-pw-134099v1: 134099v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134099v1/index.html

--===============7363639547606826624==
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
<tr><td><b>Series:</b></td><td>Test GSC loading with Wa_22019338487</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134099/">https://patchwork.freedesktop.org/series/134099/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134099v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134099v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c_BAT -&gt; xe-pw-134099v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-134099v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134099v1/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134099v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134099v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939">Intel XE#1939</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462">Intel XE#1462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134099v1/bat-lnl-1/igt@xe_gt_freq@freq_range_idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442">Intel XE#1442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134099v1/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c -&gt; xe-pw-134099v1</li>
</ul>
<p>IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1352-e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c: e3349a28c5e6fe986305d4c99b13e59eb7ca9b9c<br />
  xe-pw-134099v1: 134099v1</p>

</body>
</html>

--===============7363639547606826624==--
