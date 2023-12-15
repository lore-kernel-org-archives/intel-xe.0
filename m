Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8836C35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 23:57:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807BC10EA7B;
	Fri, 15 Dec 2023 23:57:52 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E6AB010EA7B;
 Fri, 15 Dec 2023 23:57:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DE375AADDD;
 Fri, 15 Dec 2023 23:57:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2019039146787444983=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Fix_UBSAN_splat_in_add?=
 =?utf-8?q?=5Fpreempt=5Ffences=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Fri, 15 Dec 2023 23:57:49 -0000
Message-ID: <170268466990.27832.2816047080968938809@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231215211245.718686-1-matthew.brost@intel.com>
In-Reply-To: <20231215211245.718686-1-matthew.brost@intel.com>
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

--===============2019039146787444983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix UBSAN splat in add_preempt_fences()
URL   : https://patchwork.freedesktop.org/series/127892/
State : failure

== Summary ==

CI Bug Log - changes from xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12_BAT -> xe-pw-127892v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-127892v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-127892v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-127892v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] +7 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
#### Warnings ####

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][3] ([Intel XE#977]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][5] ([Intel XE#979]) -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_psr@psr-cursor-plane-move}:
    - bat-dg2-oem2:       [SKIP][7] ([Intel XE#929]) -> [SKIP][8] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * {igt@xe_gt_freq@freq_basic_api}:
    - bat-dg2-oem2:       [PASS][9] -> [SKIP][10] +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html

  
Known issues
------------

  Here are the changes found in xe-pw-127892v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - bat-dg2-oem2:       [PASS][11] -> [SKIP][12] ([i915#2575]) +48 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-dg2-oem2:       [PASS][13] -> [SKIP][14] ([Intel XE#941])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][15] -> [SKIP][16] ([Intel XE#852]) +138 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][17] -> [FAIL][18] ([Intel XE#859])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_module_load@load.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [PASS][19] -> [FAIL][20] ([Intel XE#999])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][21] ([Intel XE#623]) -> [SKIP][22] ([i915#2575])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][23] ([Intel XE#455]) -> [SKIP][24] ([Intel XE#852])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [FAIL][25] ([Intel XE#906]) -> [SKIP][26] ([i915#2575])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][27] ([i915#5274]) -> [SKIP][28] ([i915#2575])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [FAIL][29] ([Intel XE#608]) -> [SKIP][30] ([Intel XE#852])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][31] ([Intel XE#400] / [Intel XE#616]) -> [SKIP][32] ([i915#2575])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_compute@compute-square:
    - bat-dg2-oem2:       [SKIP][33] ([Intel XE#672]) -> [SKIP][34] ([Intel XE#852])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_compute@compute-square.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_compute@compute-square.html

  * igt@xe_exec_fault_mode@many-basic:
    - bat-dg2-oem2:       [SKIP][35] ([Intel XE#288]) -> [SKIP][36] ([Intel XE#852]) +32 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][37] ([Intel XE#255]) -> [SKIP][38] ([Intel XE#852])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
  [Intel XE#852]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/852
  [Intel XE#859]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/859
  [Intel XE#906]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/906
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/941
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274


Build changes
-------------

  * Linux: xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12 -> xe-pw-127892v1

  IGT_7644: 2a2b716161007f885855d6dfcb90b526183e624e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12: a8ff56e160bbbac0d66e60990001cee38e90cb12
  xe-pw-127892v1: 127892v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/index.html

--===============2019039146787444983==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix UBSAN splat in add_preempt_fences()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127892/">https://patchwork.freedesktop.org/series/127892/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12_BAT -&gt; xe-pw-127892v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-127892v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-127892v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-127892v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_psr@psr-cursor-plane-move}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_gt_freq@freq_basic_api}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_gt_freq@freq_basic_api.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127892v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/941">Intel XE#941</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>) +138 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/859">Intel XE#859</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/906">Intel XE#906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127892v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/852">Intel XE#852</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12 -&gt; xe-pw-127892v1</li>
</ul>
<p>IGT_7644: 2a2b716161007f885855d6dfcb90b526183e624e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-582-a8ff56e160bbbac0d66e60990001cee38e90cb12: a8ff56e160bbbac0d66e60990001cee38e90cb12<br />
  xe-pw-127892v1: 127892v1</p>

</body>
</html>

--===============2019039146787444983==--
