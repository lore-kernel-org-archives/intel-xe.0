Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0FFC88E40
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 14:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3B710E00D;
	Thu, 10 Sep 2026 14:19:14 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A3C10E00D;
 Thu, 10 Sep 2026 14:19:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4748408435588544687=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Skip_clearing_pu?=
 =?utf-8?q?rged_page-table_BOs_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Sep 2026 14:19:13 -0000
Message-ID: <178904995328.147469.10514030836734427547@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260909111620.1276402-2-tejas.upadhyay@intel.com>
In-Reply-To: <20260909111620.1276402-2-tejas.upadhyay@intel.com>
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

--===============4748408435588544687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Skip clearing purged page-table BOs (rev5)
URL   : https://patchwork.freedesktop.org/series/173375/
State : success

== Summary ==

CI Bug Log - changes from xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d_FULL -> xe-pw-173375v5_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-173375v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#1466])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1124])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1428] / [Intel XE#7387])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#2887]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#373]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][9] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-5/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@type1:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#7642])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1424])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#309] / [Intel XE#7343])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#8265])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][14] -> [FAIL][15] ([Intel XE#3321]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1421])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#352])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2311]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1469] / [Intel XE#7399])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#6312] / [Intel XE#651])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#6312]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#656] / [Intel XE#7905]) +8 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#7865]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#7905]) +8 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2313])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#7061]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2486])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7283])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1489])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1091] / [Intel XE#2849])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][34] -> [INCOMPLETE][35] ([Intel XE#6321] / [Intel XE#8355])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7482]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_exec_balancer@many-cm-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1392])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#8374]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#8364]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd.html

  * igt@xe_exec_reset@multi-queue-cat-error:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#8369])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_exec_reset@multi-queue-cat-error.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-basic:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#8378])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-basic.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#8378]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html

  * igt@xe_madvise@atomic-device:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#7980])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_madvise@atomic-device.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#6964])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_peer2peer@read.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#944])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_admin@default-sched-attributes-vfs-disabled:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#7174])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_sriov_admin@default-sched-attributes-vfs-disabled.html

  * igt@xe_sriov_vfio@open-basic:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#7724])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_sriov_vfio@open-basic.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [INCOMPLETE][51] ([Intel XE#6819] / [Intel XE#8151]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-bmg-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][53] ([Intel XE#301]) -> [PASS][54] +1 other test pass
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [SKIP][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-1/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-2/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-3/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-1/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-5/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-7/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-3/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-2/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-7/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-7/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-3/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-1/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-4/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-8/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-7/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-5/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-4/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-3/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-8/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-2/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-2/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-8/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-8/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-4/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-4/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-1/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-1/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-7/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-7/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-1/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-7/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-5/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-5/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-5/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-2/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-2/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-1/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-8/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-4/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-4/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-4/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-8/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-2/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-8/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_cdclk@mode-transition:
    - shard-lnl:          [SKIP][102] ([Intel XE#9204]) -> [SKIP][103] ([Intel XE#9204] / [Intel XE#9205]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-7/igt@kms_cdclk@mode-transition.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][104] ([Intel XE#3544]) -> [SKIP][105] ([Intel XE#3374] / [Intel XE#3544])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][106] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][107] ([Intel XE#1729] / [Intel XE#7424])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [DMESG-WARN][108] ([Intel XE#9130]) -> [ABORT][109] ([Intel XE#9131] / [Intel XE#9145])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-bmg-6/igt@xe_exec_reset@gt-reset-fault-injection.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-7/igt@xe_exec_reset@gt-reset-fault-injection.html
    - shard-lnl:          [ABORT][110] ([Intel XE#9140] / [Intel XE#9145]) -> [DMESG-WARN][111] ([Intel XE#9130])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-4/igt@xe_exec_reset@gt-reset-fault-injection.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][112] ([Intel XE#8963]) -> [ABORT][113] ([Intel XE#8591] / [Intel XE#8963])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-bmg-8/igt@xe_wedged@basic-wedged.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-3/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7724
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9131
  [Intel XE#9140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9140
  [Intel XE#9145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145
  [Intel XE#9204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9204
  [Intel XE#9205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9205
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d -> xe-pw-173375v5

  IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d: a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d
  xe-pw-173375v5: 173375v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/index.html

--===============4748408435588544687==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/xe: Skip clearing purged page-table BOs =
(rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/173375/">https://patchwork.freedesktop.org/series/173375/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-173375v5/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-173375v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f=
3d4611d_FULL -&gt; xe-pw-173375v5_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173375v5_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_big_fb@y-tiled-8bpp-rotat=
e-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1428">Intel XE#1428</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-bmg-10/igt@kms_ccs=
@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-6/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#=
8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_chamelium_audio@hdmi-audi=
o-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-bmg-5/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +=
1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_content_protection@type1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_cursor_crc@cursor-onscree=
n-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-=
flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-formats-=
ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-2/igt@kms=
_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_flip@2x-flip-vs-panning.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_force_connector_basic@for=
ce-connector-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs=
-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-=
abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-=
tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1469">Intel XE#1469</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-rend=
er:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) =
+8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-indfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcp=
srhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_frontbuffer_tracking@psrh=
dr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-bmg-5/igt@kms_frontbuffer_tracking@psrh=
dr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_frontbuffer_tracking@psrh=
dr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-bmg-5/igt@kms_panel_fitting@legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_plane@pixel-format-4-tile=
d-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-bmg-5/igt@kms_psr2_sf@psr2-cursor-plane=
-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@sriov_basic@enable-vfs-autopr=
obe-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-bmg-6/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-7/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE=
#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit=
-parallel-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_exec_balancer@many-cm-virt=
ual-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_exec_multi_queue@many-queu=
es-preempt-mode-fault-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_exec_reset@multi-queue-cat=
-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-bmg-5/igt@xe_exec_threads@threads-multi=
-queue-cm-shared-vm-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_exec_threads@threads-multi=
-queue-fd-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-device:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_madvise@atomic-device.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_multigpu_svm@mgpu-atomic-o=
p-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">I=
ntel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/366">Intel XE#366</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_query@multigpu-query-oa-un=
its.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@default-sched-attributes-vfs-disabled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_sriov_admin@default-sched-=
attributes-vfs-disabled.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@open-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_sriov_vfio@open-basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7724">Intel XE#7724</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-bmg-3/igt@kms_curs=
or_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">In=
tel XE#6819</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8151">Intel XE#8151</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-173375v5/shard-bmg-5/igt@kms_cursor_legacy@cursor-vs-f=
lip-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-5=
/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-l=
nl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/sha=
rd-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4=
611d/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8=
f3d4611d/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c=
2fa8f3d4611d/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d=
0e3c2fa8f3d4611d/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1=
cc9d0e3c2fa8f3d4611d/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc=
90d1cc9d0e3c2fa8f3d4611d/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6=
dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f=
33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7=
d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-5/igt@xe_module_load@load.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5717-=
a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-=
lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/sh=
ard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611=
d/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173=
375v5/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-173375v5/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173=
375v5/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-173375v5/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173=
375v5/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-173375v5/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173=
375v5/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-173375v5/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173=
375v5/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-7/igt@kms_cdcl=
k@mode-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9204">Intel XE#9204</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-lnl-3/igt@kms_cdclk@mod=
e-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/9204">Intel XE#9204</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9205">Intel XE#9205</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-bmg-9/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-7/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-bmg-8/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shar=
d-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">In=
tel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-bmg-6/igt@xe_exec_=
reset@gt-reset-fault-injection.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-=
7/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/9131">Intel XE#9131</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel=
 XE#9145</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-lnl-4/igt@xe_exec_=
reset@gt-reset-fault-injection.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9140">Intel XE#9140</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/s=
hard-lnl-3/igt@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel=
 XE#9130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d/shard-bmg-8/igt@xe_wedge=
d@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173375v5/shard-bmg-3/igt@xe_wedged@=
basic-wedged.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8591">Intel XE#8591</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d -&gt; xe-pw-173=
375v5</li>
</ul>
<p>IGT_9088: 55a88d20e327d5c440cd3f3d661684fb83f29027 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5717-a3a7d02f33d6dacc90d1cc9d0e3c2fa8f3d4611d: a3a7d02f33d6dacc90d1cc9=
d0e3c2fa8f3d4611d<br />
  xe-pw-173375v5: 173375v5</p>

</body>
</html>

--===============4748408435588544687==--
