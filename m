Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11A6C41535
	for <intel-xe@archiver.kernel.org>; Tue, 19 Dec 2023 07:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877F610E179;
	Tue, 19 Dec 2023 07:41:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D792510E179;
 Tue, 19 Dec 2023 07:41:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D3552A7E03;
 Tue, 19 Dec 2023 07:41:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0343934227583812200=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Remove_ci-only_GuC_FW_?=
 =?utf-8?q?definitions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Tue, 19 Dec 2023 07:41:35 -0000
Message-ID: <170297169586.17582.14897565239687777874@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231218212747.1136433-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20231218212747.1136433-1-daniele.ceraolospurio@intel.com>
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

--===============0343934227583812200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Remove ci-only GuC FW definitions
URL   : https://patchwork.freedesktop.org/series/127944/
State : failure

== Summary ==

CI Bug Log - changes from xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c_BAT -> xe-pw-127944v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-127944v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-127944v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-127944v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          [PASS][1] -> [SKIP][2] +174 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-pvc-2:          [SKIP][3] ([i915#6077]) -> [SKIP][4] +30 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-pvc-2:          [SKIP][5] ([Intel XE#1024] / [Intel XE#782]) -> [SKIP][6] +5 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-pvc-2:          [SKIP][7] ([Intel XE#1024] / [Intel XE#784]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_dsc@dsc-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-pvc-2:          [SKIP][9] ([Intel XE#1024] / [Intel XE#947]) -> [SKIP][10] +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-pvc-2:          [SKIP][11] ([Intel XE#540]) -> [SKIP][12] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-pvc-2:          [SKIP][13] ([Intel XE#1024] / [Intel XE#783]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-pvc-2:          [SKIP][15] ([Intel XE#829]) -> [SKIP][16] +6 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_prop_blob@basic:
    - bat-pvc-2:          [SKIP][17] ([Intel XE#780]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_prop_blob@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_prop_blob@basic.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][19] ([Intel XE#1000]) -> [SKIP][20] +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-pvc-2:          [DMESG-FAIL][21] ([Intel XE#482]) -> [SKIP][22] +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-pvc-2:          [INCOMPLETE][23] ([Intel XE#392]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          [SKIP][25] ([Intel XE#255]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_huc_copy@huc_copy.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          [SKIP][27] ([Intel XE#532]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_intel_bb@render.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_pat@pat-index-xe2:
    - bat-pvc-2:          [SKIP][29] ([Intel XE#977]) -> [SKIP][30] +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_pat@pat-index-xe2.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-pvc-2:          [SKIP][31] ([Intel XE#979]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          [SKIP][33] ([Intel XE#531]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-pvc-2:          [FAIL][35] ([Intel XE#999]) -> [SKIP][36] +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_psr@psr-cursor-plane-move}:
    - bat-pvc-2:          [SKIP][37] ([Intel XE#1024]) -> [SKIP][38] +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html

  * {igt@xe_gt_freq@freq_basic_api}:
    - bat-pvc-2:          [PASS][39] -> [SKIP][40] +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html

  * {igt@xe_gt_freq@freq_range_idle}:
    - bat-pvc-2:          [SKIP][41] ([Intel XE#1021]) -> [SKIP][42] +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html

  
Known issues
------------

  Here are the changes found in xe-pw-127944v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][43] -> [DMESG-FAIL][44] ([Intel XE#1033])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [PASS][45] -> [FAIL][46] ([Intel XE#999])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-adlp-7:         [FAIL][47] ([i915#2346]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - bat-adlp-7:         [FAIL][49] ([Intel XE#480]) -> [PASS][50] +2 other tests pass
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * Linux: xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c -> xe-pw-127944v1

  IGT_7647: c5db51a88823962e79d41cff10fe1bdd8ea92d89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c: 84e5d706cb0c11f2948a9f16d9e31ad5256b641c
  xe-pw-127944v1: 127944v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/index.html

--===============0343934227583812200==
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
<tr><td><b>Series:</b></td><td>drm/xe: Remove ci-only GuC FW definitions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127944/">https://patchwork.freedesktop.org/series/127944/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c_BAT -&gt; xe-pw-127944v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-127944v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-127944v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-127944v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_intel_bb@intel-bb-blit-y:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">SKIP</a> +174 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html">SKIP</a> +1 other test skip</li>
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
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@xe_gt_freq@freq_basic_api}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_gt_freq@freq_basic_api.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@xe_gt_freq@freq_range_idle}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021">Intel XE#1021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-pvc-2/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127944v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127944v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c -&gt; xe-pw-127944v1</li>
</ul>
<p>IGT_7647: c5db51a88823962e79d41cff10fe1bdd8ea92d89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-586-84e5d706cb0c11f2948a9f16d9e31ad5256b641c: 84e5d706cb0c11f2948a9f16d9e31ad5256b641c<br />
  xe-pw-127944v1: 127944v1</p>

</body>
</html>

--===============0343934227583812200==--
