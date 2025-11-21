Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DE2CFA747
	for <intel-xe@archiver.kernel.org>; Fri, 21 Nov 2025 08:10:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9C210E1ED;
	Fri, 21 Nov 2025 08:10:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD1D10E1ED;
 Fri, 21 Nov 2025 08:10:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5670708750059785550=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Multi_Queue_feat?=
 =?utf-8?q?ure_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Nov 2025 08:10:10 -0000
Message-ID: <176371261069.16577.11501196625776247807@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
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

--===============5670708750059785550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Multi Queue feature support (rev3)
URL   : https://patchwork.freedesktop.org/series/156865/
State : failure

== Summary ==

CI Bug Log - changes from xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7_FULL -> xe-pw-156865v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156865v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156865v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156865v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_queue_property@invalid-property:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-dg2-466/igt@xe_exec_queue_property@invalid-property.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-466/igt@xe_exec_queue_property@invalid-property.html
    - shard-lnl:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-lnl-3/igt@xe_exec_queue_property@invalid-property.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-lnl-3/igt@xe_exec_queue_property@invalid-property.html
    - shard-adlp:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-adlp-4/igt@xe_exec_queue_property@invalid-property.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-3/igt@xe_exec_queue_property@invalid-property.html

  
New tests
---------

  New tests have been introduced between xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7_FULL and xe-pw-156865v3_FULL:

### New IGT tests (1) ###

  * igt@kms_dirtyfb@default-dirtyfb-ioctl@a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  

Known issues
------------

  Here are the changes found in xe-pw-156865v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#316])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1124])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#2191])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#367])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#787]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#787]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#2907])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][18] -> [INCOMPLETE][19] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#373])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_color@ctm-blue-to-red:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][21] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#455])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#309])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][24] -> [DMESG-WARN][25] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#651])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#656])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#653]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#836])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1406] / [Intel XE#1489])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#4837]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1392] / [Intel XE#5575])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_fault_mode@once-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#288] / [Intel XE#5561]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@xe_exec_fault_mode@once-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#288]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#4915]) +36 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free.html

  * igt@xe_exec_system_allocator@process-many-large-new-bo-map-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#4915]) +10 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@xe_exec_system_allocator@process-many-large-new-bo-map-nomemset.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#3573]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#2284] / [Intel XE#366])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
    - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#6251]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#4733])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#944])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@xe_query@multigpu-query-oa-units.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [FAIL][44] ([Intel XE#6054]) -> [PASS][45] +3 other tests pass
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][46] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][48] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-adlp:         [DMESG-WARN][50] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][51] +6 other tests pass
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-adlp-3/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-9/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@xe_oa@non-zero-reason-all:
    - shard-lnl:          [FAIL][52] ([Intel XE#6332]) -> [PASS][53] +1 other test pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-lnl-3/igt@xe_oa@non-zero-reason-all.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-lnl-4/igt@xe_oa@non-zero-reason-all.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][54] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [INCOMPLETE][55] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-dg2-set2:     [INCOMPLETE][56] -> [INCOMPLETE][57] ([Intel XE#4842])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-dg2-463/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-436/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-adlp:         [DMESG-FAIL][58] ([Intel XE#3868] / [Intel XE#5213]) -> [DMESG-FAIL][59] ([Intel XE#3868] / [Intel XE#5213] / [Intel XE#5545]) +1 other test dmesg-fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-adlp-6/igt@xe_sriov_scheduling@equal-throughput.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-3/igt@xe_sriov_scheduling@equal-throughput.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6332]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6332
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7 -> xe-pw-156865v3

  IGT_8636: 254cd102396ff95d61f2ebe49fc09128878bf483 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7: 3d718db04a365cc44a3bc81ffa4db7bbd2e645d7
  xe-pw-156865v3: 156865v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/index.html

--===============5670708750059785550==
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
<tr><td><b>Series:</b></td><td>drm/xe: Multi Queue feature support (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156865/">https://patchwork.freedesktop.org/series/156865/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7_FULL -&gt; xe-pw-156865v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156865v3_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156865v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156865v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_queue_property@invalid-property:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-dg2-466/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-466/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-lnl-3/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-lnl-3/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-adlp-4/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-3/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7_FULL and xe-pw-156865v3_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_dirtyfb@default-dirtyfb-ioctl@a-hdmi-a-1:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156865v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_color@ctm-blue-to-red.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@xe_eudebug@vm-bind-clear-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@xe_exec_fault_mode@once-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-new-bo-map-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-8/igt@xe_exec_system_allocator@process-many-large-new-bo-map-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@xe_oa@create-destroy-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#6054</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-adlp-3/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-9/igt@kms_cursor_edge_walk@256x256-top-bottom.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-lnl-3/igt@xe_oa@non-zero-reason-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6332">Intel XE#6332</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-lnl-4/igt@xe_oa@non-zero-reason-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-dg2-463/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-dg2-436/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7/shard-adlp-6/igt@xe_sriov_scheduling@equal-throughput.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156865v3/shard-adlp-3/igt@xe_sriov_scheduling@equal-throughput.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7 -&gt; xe-pw-156865v3</li>
</ul>
<p>IGT_8636: 254cd102396ff95d61f2ebe49fc09128878bf483 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4135-3d718db04a365cc44a3bc81ffa4db7bbd2e645d7: 3d718db04a365cc44a3bc81ffa4db7bbd2e645d7<br />
  xe-pw-156865v3: 156865v3</p>

</body>
</html>

--===============5670708750059785550==--
