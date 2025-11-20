Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B276ACF64A5
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 02:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B2B10E6D6;
	Thu, 20 Nov 2025 02:36:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2CF10E6D6;
 Thu, 20 Nov 2025 02:36:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7340951412797276240=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/xe=3A_Track_pre-production_workaround_support?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Nov 2025 02:36:33 -0000
Message-ID: <176360619304.11426.2213263291969706804@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251119220459.3997343-3-matthew.d.roper@intel.com>
In-Reply-To: <20251119220459.3997343-3-matthew.d.roper@intel.com>
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

--===============7340951412797276240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Track pre-production workaround support
URL   : https://patchwork.freedesktop.org/series/157804/
State : failure

== Summary ==

CI Bug Log - changes from xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8_BAT -> xe-pw-157804v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157804v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157804v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157804v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] +3 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-2:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-ptl-1:          [PASS][5] -> [DMESG-WARN][6] +3 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_module_load@load:
    - bat-ptl-2:          [PASS][7] -> [DMESG-WARN][8] +3 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-ptl-2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-ptl-2/igt@xe_module_load@load.html
    - bat-dg2-oem2:       [PASS][9] -> [DMESG-WARN][10] +1 other test dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-dg2-oem2/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][11] -> [DMESG-WARN][12] +3 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-atsm-2/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-atsm-2/igt@xe_module_load@load.html
    - bat-adlp-vm:        [PASS][13] -> [DMESG-WARN][14] +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-adlp-vm/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-adlp-vm/igt@xe_module_load@load.html
    - bat-ptl-vm:         [PASS][15] -> [DMESG-WARN][16] +1 other test dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-ptl-vm/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-ptl-vm/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][17] -> [DMESG-WARN][18] +1 other test dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-lnl-1/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-lnl-1/igt@xe_module_load@load.html
    - bat-pvc-2:          [PASS][19] -> [DMESG-WARN][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-pvc-2/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-pvc-2/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][21] -> [DMESG-WARN][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-bmg-2/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-3:          [PASS][23] -> [DMESG-WARN][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-bmg-3/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-bmg-3/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-157804v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [PASS][25] -> [DMESG-WARN][26] ([Intel XE#4543]) +1 other test dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-bmg-2:          [PASS][27] -> [ABORT][28] ([Intel XE#1727] / [Intel XE#4760])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][29] -> [FAIL][30] ([Intel XE#6519])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-dg2-oem2/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][31] -> [FAIL][32] ([Intel XE#6520])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8633 -> IGT_8635
  * Linux: xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8 -> xe-pw-157804v1

  IGT_8633: 8633
  IGT_8635: 8635
  xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8: a95032b2166b5ae428c065917b843a1caf1e82b8
  xe-pw-157804v1: 157804v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/index.html

--===============7340951412797276240==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Track pre-production workaround support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157804/">https://patchwork.freedesktop.org/series/157804/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8_BAT -&gt; xe-pw-157804v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157804v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-157804v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-157804v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-ptl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-ptl-2/igt@xe_module_load@load.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-dg2-oem2/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-atsm-2/igt@xe_module_load@load.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-adlp-vm/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-adlp-vm/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-ptl-vm/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-ptl-vm/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-pvc-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-pvc-2/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-bmg-3/igt@xe_module_load@load.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157804v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@b-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157804v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8633 -&gt; IGT_8635</li>
<li>Linux: xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8 -&gt; xe-pw-157804v1</li>
</ul>
<p>IGT_8633: 8633<br />
  IGT_8635: 8635<br />
  xe-4131-a95032b2166b5ae428c065917b843a1caf1e82b8: a95032b2166b5ae428c065917b843a1caf1e82b8<br />
  xe-pw-157804v1: 157804v1</p>

</body>
</html>

--===============7340951412797276240==--
