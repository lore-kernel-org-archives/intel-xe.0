Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C3DD12678
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 10:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A7410E557;
	Tue,  5 Nov 2024 10:31:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0570510E557;
 Tue,  5 Nov 2024 10:31:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1267582505760481081=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_MSI-X_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ilia Levi" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Nov 2024 10:31:15 -0000
Message-ID: <173080267501.1411311.9106465672261523690@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241105092412.11871-1-ilia.levi@intel.com>
In-Reply-To: <20241105092412.11871-1-ilia.levi@intel.com>
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

--===============1267582505760481081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: MSI-X support (rev3)
URL   : https://patchwork.freedesktop.org/series/140877/
State : failure

== Summary ==

CI Bug Log - changes from xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1_BAT -> xe-pw-140877v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140877v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140877v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140877v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-adlp-7:         [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-atsm-2:         [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-basic:
    - bat-adlp-vf:        [PASS][5] -> [SKIP][6] +74 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html

  
#### Warnings ####

  * igt@kms_addfb_basic@unused-offsets:
    - bat-adlp-vf:        [SKIP][7] ([Intel XE#2461]) -> [SKIP][8] +30 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@kms_addfb_basic@unused-offsets.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@kms_addfb_basic@unused-offsets.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-adlp-vf:        [SKIP][9] ([Intel XE#2463]) -> [SKIP][10] +14 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@kms_flip@basic-flip-vs-modeset.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_force_connector_basic@force-edid:
    - bat-adlp-vf:        [SKIP][11] ([Intel XE#540]) -> [SKIP][12] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@kms_force_connector_basic@force-edid.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-vf:        [SKIP][13] ([Intel XE#829]) -> [SKIP][14] +6 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-adlp-vf:        [SKIP][15] ([Intel XE#780]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@kms_prop_blob@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@kms_prop_blob@basic.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-adlp-vf:        [SKIP][17] ([Intel XE#2460] / [Intel XE#2849]) -> [SKIP][18] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-adlp-vf:        [SKIP][19] ([Intel XE#261] / [Intel XE#688]) -> [SKIP][20] +13 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_evict@evict-beng-small-cm.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-adlp-vf:        [SKIP][21] ([Intel XE#688]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_fault_mode@twice-rebind:
    - bat-adlp-vf:        [SKIP][23] ([Intel XE#288]) -> [SKIP][24] +27 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_exec_fault_mode@twice-rebind.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_exec_fault_mode@twice-rebind.html

  * igt@xe_gt_freq@freq_range_idle:
    - bat-adlp-vf:        [SKIP][25] ([Intel XE#2464]) -> [SKIP][26] +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_gt_freq@freq_range_idle.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_gt_freq@freq_range_idle.html

  
Known issues
------------

  Here are the changes found in xe-pw-140877v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][27] -> [FAIL][28] ([Intel XE#886]) +2 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][29] -> [FAIL][30] ([Intel XE#1861])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [PASS][31] -> [INCOMPLETE][32] ([Intel XE#2874]) +1 other test incomplete
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_query@query-invalid-size:
    - bat-adlp-vf:        [PASS][33] -> [SKIP][34] ([Intel XE#1130]) +60 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_query@query-invalid-size.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_query@query-invalid-size.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-adlp-vf:        [SKIP][35] ([Intel XE#261] / [Intel XE#688]) -> [SKIP][36] ([Intel XE#1130]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-vf:        [SKIP][37] ([Intel XE#688]) -> [SKIP][38] ([Intel XE#1130])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_evict_ccs@evict-overcommit-simple.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue:
    - bat-adlp-vf:        [SKIP][39] ([Intel XE#288]) -> [SKIP][40] ([Intel XE#1130]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_exec_fault_mode@twice-bindexecqueue.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_exec_fault_mode@twice-bindexecqueue.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-adlp-vf:        [SKIP][41] ([Intel XE#2464]) -> [SKIP][42] ([Intel XE#1130])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_mmap@vram:
    - bat-adlp-vf:        [SKIP][43] ([Intel XE#1008]) -> [SKIP][44] ([Intel XE#1130])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_mmap@vram.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-vf:        [SKIP][45] ([Intel XE#2839] / [Intel XE#977]) -> [SKIP][46] ([Intel XE#1130])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-adlp-vf:        [SKIP][47] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][48] ([Intel XE#1130])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_pat@pat-index-xehpc.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-adlp-vf:        [SKIP][49] ([Intel XE#979]) -> [SKIP][50] ([Intel XE#1130])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_pat@pat-index-xelpg.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-adlp-vf:        [SKIP][51] ([Intel XE#2468]) -> [SKIP][52] ([Intel XE#1130])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2460]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2460
  [Intel XE#2461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2461
  [Intel XE#2463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463
  [Intel XE#2464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464
  [Intel XE#2468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1 -> xe-pw-140877v3

  IGT_8097: 2e7c8e4b88a50e33e10d6c13286818aa833bef9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1: caa2b9acb44792908e9418d1faf890d72fb327e1
  xe-pw-140877v3: 140877v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/index.html

--===============1267582505760481081==
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
<tr><td><b>Series:</b></td><td>MSI-X support (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140877/">https://patchwork.freedesktop.org/series/140877/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1_BAT -&gt; xe-pw-140877v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140877v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140877v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140877v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-basic:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_exec_balancer@no-exec-cm-virtual-basic.html">SKIP</a> +74 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2461">Intel XE#2461</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463">Intel XE#2463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@kms_force_connector_basic@force-edid.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@kms_prop_blob@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2460">Intel XE#2460</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_exec_fault_mode@twice-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_exec_fault_mode@twice-rebind.html">SKIP</a> +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464">Intel XE#2464</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140877v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-invalid-size:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_query@query-invalid-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_query@query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +60 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_exec_fault_mode@twice-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_exec_fault_mode@twice-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464">Intel XE#2464</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468">Intel XE#2468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140877v3/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1 -&gt; xe-pw-140877v3</li>
</ul>
<p>IGT_8097: 2e7c8e4b88a50e33e10d6c13286818aa833bef9b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2164-caa2b9acb44792908e9418d1faf890d72fb327e1: caa2b9acb44792908e9418d1faf890d72fb327e1<br />
  xe-pw-140877v3: 140877v3</p>

</body>
</html>

--===============1267582505760481081==--
