Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A89C61D85
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 10:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FB610E716;
	Thu, 23 Nov 2023 10:58:16 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1504D10E716;
 Thu, 23 Nov 2023 10:58:15 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0A93CAADE8;
 Thu, 23 Nov 2023 10:58:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3495167608610865967=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 23 Nov 2023 10:58:15 -0000
Message-ID: <170073709501.8136.11812373582212477832@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231122110359.4087-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231122110359.4087-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Assorted_memory-management_fixes?=
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

--===============3495167608610865967==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Assorted memory-management fixes
URL   : https://patchwork.freedesktop.org/series/126753/
State : success

== Summary ==

CI Bug Log - changes from xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc_BAT -> xe-pw-126753v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-126753v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] ([Intel XE#679])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - bat-dg2-oem2:       [PASS][3] -> [SKIP][4] ([i915#2575]) +49 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][5] -> [FAIL][6] ([Intel XE#480])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][7] -> [SKIP][8] ([Intel XE#852]) +125 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][9] -> [FAIL][10] ([Intel XE#859])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [FAIL][11] ([Intel XE#480]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][13] ([Intel XE#623]) -> [SKIP][14] ([i915#2575])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-oem2:       [SKIP][15] ([Intel XE#624]) -> [SKIP][16] ([i915#2575])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [FAIL][17] ([Intel XE#609]) -> [SKIP][18] ([i915#2575]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][19] ([Intel XE#423]) -> [SKIP][20] ([Intel XE#852])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][21] ([i915#5274]) -> [SKIP][22] ([i915#2575])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [FAIL][23] ([Intel XE#608]) -> [SKIP][24] ([Intel XE#852])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-7:         [DMESG-FAIL][25] ([Intel XE#282] / [i915#2017]) -> [FAIL][26] ([Intel XE#616] / [Intel XE#750])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][27] ([Intel XE#400] / [Intel XE#616]) -> [SKIP][28] ([i915#2575])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_compute@compute-square:
    - bat-dg2-oem2:       [SKIP][29] ([Intel XE#672]) -> [SKIP][30] ([Intel XE#852])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@xe_compute@compute-square.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@xe_compute@compute-square.html

  * igt@xe_exec_fault_mode@many-basic:
    - bat-dg2-oem2:       [SKIP][31] ([Intel XE#288]) -> [SKIP][32] ([Intel XE#852]) +17 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][33] ([Intel XE#255]) -> [SKIP][34] ([Intel XE#852])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
  [Intel XE#679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/679
  [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750
  [Intel XE#852]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/852
  [Intel XE#859]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/859
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/941
  [Intel XE#942]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/942
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274


Build changes
-------------

  * Linux: xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc -> xe-pw-126753v1

  IGT_7597: 380983dbd9bb2f7eea5e917e8fed0569bfe8cf9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc: 59f2e73469cace9c78aab7506284ae446d57b8bc
  xe-pw-126753v1: 126753v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/index.html

--===============3495167608610865967==
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
<tr><td><b>Series:</b></td><td>drm/xe: Assorted memory-management fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126753/">https://patchwork.freedesktop.org/series/126753/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc_BAT -&gt; xe-pw-126753v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126753v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/679">Intel XE#679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>) +125 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/859">Intel XE#859</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>)</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/750">Intel XE#750</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126753v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc -&gt; xe-pw-126753v1</li>
</ul>
<p>IGT_7597: 380983dbd9bb2f7eea5e917e8fed0569bfe8cf9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-516-59f2e73469cace9c78aab7506284ae446d57b8bc: 59f2e73469cace9c78aab7506284ae446d57b8bc<br />
  xe-pw-126753v1: 126753v1</p>

</body>
</html>

--===============3495167608610865967==--
