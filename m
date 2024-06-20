Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8185C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 10:52:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4464610E8B5;
	Thu, 20 Jun 2024 10:52:53 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FED810E8B5;
 Thu, 20 Jun 2024 10:52:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4754656908620741701=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Adapt_the_driver_to_boot_on_the_?=
 =?utf-8?q?VF_device_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Jun 2024 10:52:51 -0000
Message-ID: <171888077158.127478.9366256395087035922@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240619214557.905-1-michal.wajdeczko@intel.com>
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

--===============4754656908620741701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Adapt the driver to boot on the VF device (rev3)
URL   : https://patchwork.freedesktop.org/series/135080/
State : failure

== Summary ==

CI Bug Log - changes from xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357_BAT -> xe-pw-135080v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-135080v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135080v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135080v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] +6 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][5] ([Intel XE#455]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][7] ([Intel XE#929]) -> [SKIP][8] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  
Known issues
------------

  Here are the changes found in xe-pw-135080v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [PASS][9] -> [SKIP][10] ([Intel XE#1885])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [PASS][11] -> [SKIP][12] ([i915#2575]) +50 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][13] -> [SKIP][14] ([Intel XE#1130]) +155 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       [PASS][15] -> [SKIP][16] ([Intel XE#455]) +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  
#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - {bat-lnl-1}:        [FAIL][17] ([Intel XE#1069]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][19] ([Intel XE#623]) -> [SKIP][20] ([i915#2575])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][21] ([i915#5274]) -> [SKIP][22] ([i915#2575])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-dg2-oem2:       [SKIP][23] ([Intel XE#288]) -> [SKIP][24] ([Intel XE#1130]) +32 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][25] ([Intel XE#255]) -> [SKIP][26] ([Intel XE#1130])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][27] ([Intel XE#977]) -> [SKIP][28] ([Intel XE#1130])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][29] ([Intel XE#979]) -> [SKIP][30] ([Intel XE#1130]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357 -> xe-pw-135080v3

  IGT_7893: a1840ca4270b765883d3b71a710b6af85ded8235 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357: 65ef303b3a8a20609f394e0a823ade01cb4f1357
  xe-pw-135080v3: 135080v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/index.html

--===============4754656908620741701==
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
<tr><td><b>Series:</b></td><td>Adapt the driver to boot on the VF device (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135080/">https://patchwork.freedesktop.org/series/135080/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357_BAT -&gt; xe-pw-135080v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-135080v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135080v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135080v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135080v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +155 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357 -&gt; xe-pw-135080v3</li>
</ul>
<p>IGT_7893: a1840ca4270b765883d3b71a710b6af85ded8235 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357: 65ef303b3a8a20609f394e0a823ade01cb4f1357<br />
  xe-pw-135080v3: 135080v3</p>

</body>
</html>

--===============4754656908620741701==--
