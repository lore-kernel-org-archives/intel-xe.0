Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B9FC54E5D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 17:06:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA9D112F35;
	Tue, 12 Mar 2024 17:06:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEFF112F30;
 Tue, 12 Mar 2024 17:06:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0920441013068392484=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5BCI=2C1/7?=
 =?utf-8?q?=5D_drm/xe=3A_Make_TLB_invalidation_fences_unordered?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 12 Mar 2024 17:06:46 -0000
Message-ID: <171026320645.696620.17586272372073903186@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240312153459.10185-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240312153459.10185-1-thomas.hellstrom@linux.intel.com>
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

--===============0920441013068392484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/7] drm/xe: Make TLB invalidation fences unordered
URL   : https://patchwork.freedesktop.org/series/131036/
State : failure

== Summary ==

CI Bug Log - changes from xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d_BAT -> xe-pw-131036v1_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-131036v1_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-131036v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-131036v1_BAT:

### IGT changes ###

#### Warnings ####

  * igt@xe_evict@evict-beng-small:
    - bat-pvc-2:          [FAIL][1] ([Intel XE#1000]) -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-pvc-2/igt@xe_evict@evict-beng-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-pvc-2/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][3] ([Intel XE#482]) -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html

  
Known issues
------------

  Here are the changes found in xe-pw-131036v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [SKIP][5] ([Intel XE#1136]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - bat-dg2-oem2:       [SKIP][7] ([i915#2575]) -> [PASS][8] +49 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [SKIP][9] ([Intel XE#1134]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [SKIP][11] ([Intel XE#1130]) -> [PASS][12] +155 other tests pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [FAIL][13] ([Intel XE#1132]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][15] ([i915#2575]) -> [SKIP][16] ([Intel XE#623])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][17] ([Intel XE#1134]) -> [SKIP][18] ([Intel XE#455])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][19] ([i915#2575]) -> [SKIP][20] ([i915#5274])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-dg2-oem2:       [SKIP][21] ([i915#2575]) -> [SKIP][22] ([Intel XE#417])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][23] ([Intel XE#1134]) -> [SKIP][24] ([Intel XE#929]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@xe_exec_fault_mode@many-basic:
    - bat-dg2-oem2:       [SKIP][25] ([Intel XE#1130]) -> [SKIP][26] ([Intel XE#288]) +22 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][27] ([Intel XE#1130]) -> [SKIP][28] ([Intel XE#255])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][29] ([Intel XE#1130]) -> [SKIP][30] ([Intel XE#977])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][31] ([Intel XE#1130]) -> [SKIP][32] ([Intel XE#979]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1132
  [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
  [Intel XE#1136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1136
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274


Build changes
-------------

  * Linux: xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d -> xe-pw-131036v1

  IGT_7756: 7756
  xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d: 1dfbf3ced62236dd318c701e3f21f5a33c226d0d
  xe-pw-131036v1: 131036v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/index.html

--===============0920441013068392484==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/7] drm/xe: Make TLB invalidation fences unordered</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131036/">https://patchwork.freedesktop.org/series/131036/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d_BAT -&gt; xe-pw-131036v1_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-131036v1_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-131036v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-131036v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-pvc-2/igt@xe_evict@evict-beng-small.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-pvc-2/igt@xe_evict@evict-beng-small.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131036v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1136">Intel XE#1136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a> +49 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> +155 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1132">Intel XE#1132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131036v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d -&gt; xe-pw-131036v1</li>
</ul>
<p>IGT_7756: 7756<br />
  xe-930-1dfbf3ced62236dd318c701e3f21f5a33c226d0d: 1dfbf3ced62236dd318c701e3f21f5a33c226d0d<br />
  xe-pw-131036v1: 131036v1</p>

</body>
</html>

--===============0920441013068392484==--
