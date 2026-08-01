Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F922C55171
	for <intel-xe@archiver.kernel.org>; Sat,  1 Aug 2026 01:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B636910E26A;
	Sat,  1 Aug 2026 01:44:28 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0394610E266;
 Sat,  1 Aug 2026 01:44:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3118392537535939863=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/guc=5Fads=3A_alloca?=
 =?utf-8?q?te_UM_queues_in_a_separate_UC_BO_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 01 Aug 2026 01:44:28 -0000
Message-ID: <178554866800.11709.8613041783798306886@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260731232232.548015-1-jia.yao@intel.com>
In-Reply-To: <20260731232232.548015-1-jia.yao@intel.com>
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

--===============3118392537535939863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc_ads: allocate UM queues in a separate UC BO (rev4)
URL   : https://patchwork.freedesktop.org/series/169535/
State : success

== Summary ==

CI Bug Log - changes from xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e_FULL -> xe-pw-169535v4_FULL
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

  Here are the changes found in xe-pw-169535v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          [PASS][1] -> [SKIP][2] ([Intel XE#8714]) +317 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_addfb_basic@unused-handle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1407])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-lnl:          [PASS][4] -> [ABORT][5] ([Intel XE#4760])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#8365])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#7358])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#373])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1424])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#8265])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1421])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#7178] / [Intel XE#7351])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#7905]) +4 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#6312] / [Intel XE#651])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#656] / [Intel XE#7905]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#7865])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#6901])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#7283])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1447] / [Intel XE#7469])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_exec_balancer@once-parallel-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#7482]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@xe_exec_balancer@once-parallel-userptr-rebind.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#8364]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:
    - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#7850])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-lnl-1/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-5/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html

  * igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#8369])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#7954])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2229])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [PASS][32] -> [FAIL][33] ([Intel XE#8714]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@xe_module_load@reload.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_module_load@reload.html

  * igt@xe_pm_residency@aspm_link_residency:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7271])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@xe_pm_residency@aspm_link_residency.html

  * igt@xe_sriov_scheduling@equal-throughput-normal-priority:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#8339])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@xe_sriov_scheduling@equal-throughput-normal-priority.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][36] ([Intel XE#301]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][38] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][39] +1 other test pass
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset:
    - shard-lnl:          [FAIL][40] ([Intel XE#8058]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-lnl-8/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][42] ([Intel XE#2327]) -> [SKIP][43] ([Intel XE#8714]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][44] ([Intel XE#1124]) -> [SKIP][45] ([Intel XE#8714]) +5 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][46] ([Intel XE#367]) -> [SKIP][47] ([Intel XE#8714]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][48] ([Intel XE#3432]) -> [SKIP][49] ([Intel XE#8714]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][50] ([Intel XE#2887]) -> [SKIP][51] ([Intel XE#8714]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][52] ([Intel XE#2724] / [Intel XE#7449]) -> [SKIP][53] ([Intel XE#8714])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_cdclk@plane-scaling.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-bmg:          [SKIP][54] ([Intel XE#2252]) -> [SKIP][55] ([Intel XE#8714]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_chamelium_audio@dp-audio-after-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          [SKIP][56] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][57] ([Intel XE#8714]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_chamelium_color@ctm-negative.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          [SKIP][58] ([Intel XE#6969] / [Intel XE#7006]) -> [SKIP][59] ([Intel XE#8714])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][60] ([Intel XE#7642]) -> [SKIP][61] ([Intel XE#8714])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_content_protection@content-type-change.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          [SKIP][62] ([Intel XE#6974]) -> [SKIP][63] ([Intel XE#8714])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-bmg:          [SKIP][64] ([Intel XE#2320]) -> [SKIP][65] ([Intel XE#8714]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][66] ([Intel XE#7809]) -> [SKIP][67] ([Intel XE#8714])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][68] ([Intel XE#4210] / [Intel XE#7467]) -> [SKIP][69] ([Intel XE#8714])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-bmg:          [SKIP][70] ([Intel XE#8265]) -> [SKIP][71] ([Intel XE#8714]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][72] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][73] ([Intel XE#8714])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][74] ([Intel XE#2374] / [Intel XE#6127]) -> [SKIP][75] ([Intel XE#8714])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_feature_discovery@psr1.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][76] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][77] ([Intel XE#8714]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][78] ([Intel XE#2311]) -> [SKIP][79] ([Intel XE#8714]) +27 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][80] ([Intel XE#4141]) -> [SKIP][81] ([Intel XE#8714]) +6 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          [SKIP][82] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][83] ([Intel XE#8714]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][84] ([Intel XE#2313]) -> [SKIP][85] ([Intel XE#8714]) +26 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][86] ([Intel XE#2350] / [Intel XE#7503]) -> [SKIP][87] ([Intel XE#8714])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:
    - shard-bmg:          [SKIP][88] ([Intel XE#7061]) -> [SKIP][89] ([Intel XE#8714]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          [SKIP][90] ([Intel XE#4298] / [Intel XE#5873]) -> [SKIP][91] ([Intel XE#8714])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_joiner@basic-max-non-joiner.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][92] ([Intel XE#2486]) -> [SKIP][93] ([Intel XE#8714])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_panel_fitting@legacy.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][94] ([Intel XE#7283]) -> [SKIP][95] ([Intel XE#8714]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][96] ([Intel XE#5021] / [Intel XE#7377]) -> [SKIP][97] ([Intel XE#8714])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][98] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][99] ([Intel XE#8714])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][100] ([Intel XE#1489]) -> [SKIP][101] ([Intel XE#8714]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][102] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][103] ([Intel XE#8714])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_psr2_su@page_flip-p010.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-bmg:          [SKIP][104] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][105] ([Intel XE#8714]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_psr@psr2-primary-page-flip.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][106] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][107] ([Intel XE#8714]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][108] ([Intel XE#2413]) -> [SKIP][109] ([Intel XE#8714])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_scaling_modes@scaling-mode-center.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][110] ([Intel XE#1435] / [Intel XE#8695]) -> [SKIP][111] ([Intel XE#8714])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          [SKIP][112] ([Intel XE#6503]) -> [SKIP][113] ([Intel XE#8714])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][114] ([Intel XE#1499]) -> [SKIP][115] ([Intel XE#8714])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_vrr@flip-suspend.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_vrr@flip-suspend.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-bmg:          [SKIP][116] ([Intel XE#8608]) -> [SKIP][117] ([Intel XE#8714])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_cw_post_sync@walker-post-sync.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          [SKIP][118] ([Intel XE#8370]) -> [SKIP][119] ([Intel XE#8714])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_evict@evict-small-multi-queue-cm.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][120] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][121] ([Intel XE#8714]) +4 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          [SKIP][122] ([Intel XE#8374]) -> [SKIP][123] ([Intel XE#8714]) +8 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          [SKIP][124] ([Intel XE#8364]) -> [SKIP][125] ([Intel XE#8714]) +14 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_reset@multi-queue-cancel:
    - shard-bmg:          [SKIP][126] ([Intel XE#8369]) -> [SKIP][127] ([Intel XE#8714])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@xe_exec_reset@multi-queue-cancel.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_exec_reset@multi-queue-cancel.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-bmg:          [SKIP][128] ([Intel XE#8378]) -> [SKIP][129] ([Intel XE#8714]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][130] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384]) -> [SKIP][131] ([Intel XE#8714])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_mmap@small-bar.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [SKIP][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157]) ([Intel XE#2457] / [Intel XE#7405]) -> ([ABORT][158], [PASS][159], [ABORT][160], [PASS][161], [PASS][162], [ABORT][163], [ABORT][164], [ABORT][165], [ABORT][166], [ABORT][167], [ABORT][168], [ABORT][169], [ABORT][170], [ABORT][171], [ABORT][172], [ABORT][173], [ABORT][174], [ABORT][175], [ABORT][176], [ABORT][177], [ABORT][178], [ABORT][179], [ABORT][180], [ABORT][181]) ([Intel XE#8007])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-7/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-1/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-7/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-7/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-1/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-5/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-5/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-5/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-3/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-3/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-9/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-2/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-2/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-8/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-8/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-9/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-7/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-7/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-3/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-7/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-6/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-6/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-5/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-5/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-1/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-1/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-10/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-10/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-8/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-8/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-6/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-6/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-3/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-3/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-5/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-9/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-9/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-2/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-2/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-2/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-4/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-4/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-4/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
    - shard-bmg:          [SKIP][182] ([Intel XE#6964]) -> [SKIP][183] ([Intel XE#6964] / [Intel XE#8714])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          [SKIP][184] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][185] ([Intel XE#8714])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_pm@d3cold-mmap-system.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          [SKIP][186] ([Intel XE#7599]) -> [SKIP][187] ([Intel XE#8714])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_prefetch_fault@prefetch-fault-svm.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][188] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][189] ([Intel XE#8714]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          [SKIP][190] ([Intel XE#944]) -> [SKIP][191] ([Intel XE#8714])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@xe_query@multigpu-query-gt-list.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_query@multigpu-query-gt-list.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7271
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7469
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8058]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8058
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e -> xe-pw-169535v4

  IGT_9036: 9036
  xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e: 493574493ae20ccb191c9626bc12f5173f9b1b0e
  xe-pw-169535v4: 169535v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/index.html

--===============3118392537535939863==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc_ads: allocate UM queues in a sepa=
rate UC BO (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/169535/">https://patchwork.freedesktop.org/series/169535/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-169535v4/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-169535v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5517-493574493ae20ccb191c9626bc12f5173=
f9b1b0e_FULL -&gt; xe-pw-169535v4_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169535v4_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_add=
fb_basic@unused-handle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_addfb_basic@unused=
-handle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8714">Intel XE#8714</a>) +317 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_big_fb@x-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-lnl-8/igt@kms_big_=
fb@x-tiled-8bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-7/igt@kms_big_fb@x-tiled=
-8bpp-rotate-180.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_chamelium_color_pipeline@=
plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_chamelium_hpd@common-hpd-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-m=
ovement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_dsc@dsc-fractional-bpp-bi=
gjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_flip@2x-nonexisting-fb-in=
terruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
hdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_frontbuffer_tracking@psrh=
dr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_plane@pixel-format-yf-til=
ed-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@kms_rotation_crc@primary-4-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@xe_compute@ccs-mode-compute-k=
ernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1447">Intel XE#1447</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7469">Intel XE#7469</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@xe_exec_balancer@once-paralle=
l-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-lnl-1/igt@xe_exec_=
reset@long-spin-sys-reuse-many-preempt-threads.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-5/ig=
t@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE=
#7850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@xe_exec_reset@multi-queue-lon=
g-spin-reuse-many-queue-switch.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@xe_gpgpu_fill@offset-4x4.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@xe_live=
_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_li=
ve_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@xe_modu=
le_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_module_load@reload.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714=
">Intel XE#8714</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@aspm_link_residency:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@xe_pm_residency@aspm_link_res=
idency.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7271">Intel XE#7271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-normal-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169535v4/shard-lnl-4/igt@xe_sriov_scheduling@equal-thr=
oughput-normal-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-lnl-8/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shar=
d-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-lnl-8/igt@xe_exec_=
system_allocator@threads-many-stride-mmap-huge-nomemset.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8058">Intel XE#=
8058</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
169535v4/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-stride-mmap-=
huge-nomemset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_big_=
fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_=
big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_big=
_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1=
124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
69535v4/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-=
async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_bw@=
linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-=
bmg-7/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel=
 XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_ccs=
@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/sh=
ard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714"=
>Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shar=
d-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">In=
tel XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_cdc=
lk@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/ig=
t@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_cham=
elium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/=
igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_cham=
elium_color@ctm-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bm=
g-7/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_col=
or_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v=
4/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel=
 XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_cont=
ent_protection@content-type-change.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/=
igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_con=
tent_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-=
7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_curs=
or_crc@cursor-sliding-128x42.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@km=
s_cursor_crc@cursor-sliding-128x42.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_dirt=
yfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4210">Intel XE#4210</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7467">Intel XE#7467</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7=
/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_dsc=
@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/=
igt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Int=
el XE#7442</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-169535v4/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-v=
isible-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6127">Intel XE#6127</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/ig=
t@kms_feature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE=
#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7351">Intel XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytil=
e-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard=
-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel=
 XE#8714</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1695=
35v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8714">Intel XE#8714</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356"=
>Intel XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161=
616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8714">Intel XE#8714</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE=
#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-169535v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-sh=
rfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8714">Intel XE#8714</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/s=
hard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#87=
14</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psrhdr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/sh=
ard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714=
">Intel XE#8714</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_joi=
ner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4298">Intel XE#4298</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bm=
g-7/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_pan=
el_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_panel_fit=
ting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_pla=
ne@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#72=
83</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
9535v4/shard-bmg-7/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-=
clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8714">Intel XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_pla=
ne_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg=
-7/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_pm_b=
acklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535=
v4/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_psr2=
_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/s=
hard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
14">Intel XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_psr=
2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/i=
gt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_psr=
@psr2-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg=
-7/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_rot=
ation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#58=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
9535v4/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@kms_sca=
ling_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/ig=
t@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_setm=
ode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE#8695</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/=
shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE=
#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_shar=
pness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/s=
hard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
14">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@kms_vrr@=
flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@kms_vrr@flip-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_cw_po=
st_sync@walker-post-sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_cw_=
post_sync@walker-post-sync.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_evict=
@evict-small-multi-queue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_=
evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Inte=
l XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7372">Intel XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-=
bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_exec_=
fault_mode@once-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#=
8374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
169535v4/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-userptr-invali=
date-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8714">Intel XE#8714</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@xe_exec=
_multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8=
364</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
69535v4/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-=
invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@xe_exec=
_reset@multi-queue-cancel.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_ex=
ec_reset@multi-queue-cancel.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_exec_=
threads@threads-multi-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v=
4/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8714">Intel XE#8714</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/586">Intel XE#586</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7=
/igt@xe_mmap@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/sha=
rd-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b=
1b0e/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f517=
3f9b1b0e/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12=
f5173f9b1b0e/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626=
bc12f5173f9b1b0e/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c=
9626bc12f5173f9b1b0e/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb=
191c9626bc12f5173f9b1b0e/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae2=
0ccb191c9626bc12f5173f9b1b0e/shard-bmg-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-49357449=
3ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-4935=
74493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5517-=
493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-9/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-3/igt@xe=
_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-=
10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard=
-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/=
shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1=
b0e/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7=
405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
169535v4/shard-bmg-5/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-169535v4/shard-bmg-5/igt@xe_module_load@load.html">ABORT</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shar=
d-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-169535v4/shard-bmg-1/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-1/igt@xe=
_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-169535v4/shard-bmg-10/igt@xe_module_load@load.html">ABOR=
T</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/=
shard-bmg-10/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-8/igt@xe_module_lo=
ad@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-169535v4/shard-bmg-8/igt@xe_module_load@load.html">ABORT</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-6=
/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-6/igt@xe_module_load@load.html=
">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
535v4/shard-bmg-3/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-3/igt@xe_modu=
le_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-169535v4/shard-bmg-5/igt@xe_module_load@load.html">ABORT</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-=
bmg-9/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-9/igt@xe_module_load@load=
.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-169535v4/shard-bmg-2/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-2/igt@xe=
_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-169535v4/shard-bmg-2/igt@xe_module_load@load.html">ABORT=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/s=
hard-bmg-4/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-4/igt@xe_module_load=
@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-169535v4/shard-bmg-4/igt@xe_module_load@load.html">ABORT</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#80=
07</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_multi=
gpu_svm@mgpu-xgpu-access-prefetch.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/i=
gt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_pm@d3=
cold-mmap-system.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/ig=
t@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_prefe=
tch_fault@prefetch-fault-svm.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe=
_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-4/igt@xe_pxp@p=
xp-termination-key-update-post-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#741=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
535v4/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
14">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e/shard-bmg-10/igt@xe_quer=
y@multigpu-query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169535v4/shard-bmg-7/igt@xe_query=
@multigpu-query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e -&gt; xe-pw-169=
535v4</li>
</ul>
<p>IGT_9036: 9036<br />
  xe-5517-493574493ae20ccb191c9626bc12f5173f9b1b0e: 493574493ae20ccb191c962=
6bc12f5173f9b1b0e<br />
  xe-pw-169535v4: 169535v4</p>

</body>
</html>

--===============3118392537535939863==--
