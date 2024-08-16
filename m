Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D067C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 16:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0818A899A3;
	Fri, 16 Aug 2024 16:29:28 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68709899A3;
 Fri, 16 Aug 2024 16:29:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4354993784125230212=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5B01/12=5D?=
 =?utf-8?q?_drm/xe=3A_Removed_unused_xe=5Fggtt=5Fprintk?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Aug 2024 16:29:27 -0000
Message-ID: <172382576741.658442.17707783917208756242@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816150243.87596-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240816150243.87596-1-rodrigo.vivi@intel.com>
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

--===============4354993784125230212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [01/12] drm/xe: Removed unused xe_ggtt_printk
URL   : https://patchwork.freedesktop.org/series/137398/
State : failure

== Summary ==

CI Bug Log - changes from xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425_BAT -> xe-pw-137398v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137398v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137398v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137398v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-adlp-vf/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-adlp-vf/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-adlp-7:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-atsm-2:         [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-dg2-oem2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-lnl-1/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-lnl-1/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-bmg-1/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-bmg-1/igt@xe_module_load@load.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_force_connector_basic@force-connector-state:
    - {bat-bmg-2}:        [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  
Known issues
------------

  Here are the changes found in xe-pw-137398v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][15] -> [SKIP][16] ([Intel XE#1192]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][17] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][18] ([Intel XE#1192])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425 -> xe-pw-137398v1

  IGT_7973: 9c3a20d0403a2fe80bde618de5c2ef83b7e08d50 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425: cfdb0d68f7d07eecfafb5fda99e6dc313359d425
  xe-pw-137398v1: 137398v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/index.html

--===============4354993784125230212==
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
<tr><td><b>Series:</b></td><td>series starting with [01/12] drm/xe: Removed unused xe_ggtt_printk</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137398/">https://patchwork.freedesktop.org/series/137398/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425_BAT -&gt; xe-pw-137398v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137398v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137398v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137398v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-adlp-vf/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-adlp-vf/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-lnl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_force_connector_basic@force-connector-state:<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137398v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137398v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425 -&gt; xe-pw-137398v1</li>
</ul>
<p>IGT_7973: 9c3a20d0403a2fe80bde618de5c2ef83b7e08d50 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1782-cfdb0d68f7d07eecfafb5fda99e6dc313359d425: cfdb0d68f7d07eecfafb5fda99e6dc313359d425<br />
  xe-pw-137398v1: 137398v1</p>

</body>
</html>

--===============4354993784125230212==--
