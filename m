Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62202D3C90E
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 20:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170D110E72C;
	Wed, 10 Dec 2025 20:38:24 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E2310E0A8;
 Wed, 10 Dec 2025 20:38:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4373872758945139364=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/bo=3A_Don=27t_inclu?=
 =?utf-8?q?de_the_CCS_metadata_in_the_dma-buf_sg-table?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Dec 2025 20:38:23 -0000
Message-ID: <176539910346.74583.18284524558154580583@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251209204920.224374-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251209204920.224374-1-thomas.hellstrom@linux.intel.com>
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

--===============4373872758945139364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/bo: Don't include the CCS metadata in the dma-buf sg-table
URL   : https://patchwork.freedesktop.org/series/158721/
State : failure

== Summary ==

CI Bug Log - changes from xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985_FULL -> xe-pw-158721v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-158721v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-158721v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-158721v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-rmfb-interruptible@a-dp2:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +6 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-5/igt@kms_flip@flip-vs-rmfb-interruptible@a-dp2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@kms_flip@flip-vs-rmfb-interruptible@a-dp2.html

  
New tests
---------

  New tests have been introduced between xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985_FULL and xe-pw-158721v1_FULL:

### New IGT tests (1) ###

  * igt@kms_chamelium_frames:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in xe-pw-158721v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#367]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#2887])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#309])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#6816])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#3321]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [PASS][11] -> [FAIL][12] ([Intel XE#3098]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#3650]) +3 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-5/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
    - shard-bmg:          [PASS][15] -> [INCOMPLETE][16] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#656])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [ABORT][18] ([Intel XE#6740])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1406] / [Intel XE#2893])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@testdisplay:
    - shard-bmg:          [PASS][20] -> [ABORT][21] ([Intel XE#6740])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@testdisplay.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-5/igt@testdisplay.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1392])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-8/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-new:
    - shard-bmg:          [PASS][23] -> [ABORT][24] ([Intel XE#3970])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-execqueues-new.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-execqueues-new.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-bmg:          [PASS][25] -> [DMESG-WARN][26] ([Intel XE#4504])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-userptr.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0:
    - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#6251]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [SKIP][29] -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@core_hotunplug@unplug-rescan.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][31] ([Intel XE#367]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_flip@2x-busy-flip:
    - shard-bmg:          [SKIP][33] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_flip@2x-busy-flip.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@kms_flip@2x-busy-flip.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-2:
    - shard-bmg:          [ABORT][35] ([Intel XE#6740]) -> [PASS][36] +1 other test pass
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-5/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap:
    - shard-bmg:          [SKIP][37] ([Intel XE#6703]) -> [PASS][38] +1 other test pass
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:
    - shard-lnl:          [FAIL][39] ([Intel XE#6251]) -> [PASS][40] +1 other test pass
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html

  
#### Warnings ####

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [FAIL][41] ([Intel XE#6793]) -> [SKIP][42] ([Intel XE#4354])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][43] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][44] ([Intel XE#3544])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][45] ([Intel XE#1503]) -> [ABORT][46] ([Intel XE#6740])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][47] ([Intel XE#1729]) -> [SKIP][48] ([Intel XE#2426])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_exec_system_allocator@many-large-mmap-new-huge:
    - shard-bmg:          [SKIP][49] ([Intel XE#6703]) -> [SKIP][50] ([Intel XE#4943])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_exec_system_allocator@many-large-mmap-new-huge.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@xe_exec_system_allocator@many-large-mmap-new-huge.html

  
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3650
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6793
  [Intel XE#6816]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6816


Build changes
-------------

  * Linux: xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985 -> xe-pw-158721v1

  IGT_8662: 9410b6926f317e8bf824502394e09ee8753ff65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985: 2a9deeb5c3fd4dddbed361f10b26ce567072a985
  xe-pw-158721v1: 158721v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/index.html

--===============4373872758945139364==
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
<tr><td><b>Series:</b></td><td>drm/xe/bo: Don&#x27;t include the CCS metadata in the dma-buf sg-table</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158721/">https://patchwork.freedesktop.org/series/158721/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985_FULL -&gt; xe-pw-158721v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-158721v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-158721v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-158721v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@flip-vs-rmfb-interruptible@a-dp2:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-5/igt@kms_flip@flip-vs-rmfb-interruptible@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@kms_flip@flip-vs-rmfb-interruptible@a-dp2.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985_FULL and xe-pw-158721v1_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_chamelium_frames:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158721v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6816">Intel XE#6816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-5/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@kms_flip@flip-vs-rmfb-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3650">Intel XE#3650</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-1/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-5/igt@testdisplay.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-8/igt@xe_exec_basic@multigpu-once-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-execqueues-new.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-execqueues-new.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@xe_pm@s2idle-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@core_hotunplug@unplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_flip@2x-busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@kms_flip@2x-busy-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-5/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6793">Intel XE#6793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-8/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985/shard-bmg-2/igt@xe_exec_system_allocator@many-large-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158721v1/shard-bmg-3/igt@xe_exec_system_allocator@many-large-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985 -&gt; xe-pw-158721v1</li>
</ul>
<p>IGT_8662: 9410b6926f317e8bf824502394e09ee8753ff65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4215-2a9deeb5c3fd4dddbed361f10b26ce567072a985: 2a9deeb5c3fd4dddbed361f10b26ce567072a985<br />
  xe-pw-158721v1: 158721v1</p>

</body>
</html>

--===============4373872758945139364==--
