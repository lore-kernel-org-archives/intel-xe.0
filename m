Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70634C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 12:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB0010E2D7;
	Wed, 26 Feb 2025 12:34:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC0910E2D6;
 Wed, 26 Feb 2025 12:34:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5774108703745329706=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/uapi=3A_Use_hint_fo?=
 =?utf-8?q?r_guc_to_set_GT_frequency_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Feb 2025 12:34:44 -0000
Message-ID: <174057328499.2326754.9597188351635305410@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250226095224.650351-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250226095224.650351-1-tejas.upadhyay@intel.com>
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

--===============5774108703745329706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Use hint for guc to set GT frequency (rev8)
URL   : https://patchwork.freedesktop.org/series/143793/
State : failure

== Summary ==

CI Bug Log - changes from xe-2713-add427957df4346354020266b1a4c8241ee44331_full -> xe-pw-143793v8_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143793v8_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143793v8_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143793v8_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@basic:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@core_getversion@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@core_getversion@basic.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bd-hdmi-a6-dp4.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@blocking-wf_vblank@b-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][6] +2 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_flip@blocking-wf_vblank@b-dp2.html

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a3:
    - shard-bmg:          [PASS][7] -> [DMESG-FAIL][8] +3 other tests dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_flip@blocking-wf_vblank@b-hdmi-a3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_flip@blocking-wf_vblank@b-hdmi-a3.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][9] +17 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@xe_dma_buf_sync@export-dma-buf-many-write-read-sync:
    - shard-bmg:          [PASS][10] -> [SKIP][11] +39 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@xe_dma_buf_sync@export-dma-buf-many-write-read-sync.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@xe_dma_buf_sync@export-dma-buf-many-write-read-sync.html

  * igt@xe_drm_fdinfo@virtual-utilization-single-full-load:
    - shard-bmg:          [PASS][12] -> [INCOMPLETE][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@xe_drm_fdinfo@virtual-utilization-single-full-load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@xe_drm_fdinfo@virtual-utilization-single-full-load.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][15] -> [DMESG-WARN][16] +3 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-8/igt@xe_module_load@many-reload.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@xe_module_load@many-reload.html
    - shard-dg2-set2:     [PASS][17] -> [DMESG-WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@xe_module_load@many-reload.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@xe_module_load@many-reload.html
    - shard-lnl:          [PASS][19] -> [DMESG-WARN][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-lnl-7/igt@xe_module_load@many-reload.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-8/igt@xe_module_load@many-reload.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][21] ([Intel XE#2370]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-bmg:          [SKIP][23] ([Intel XE#1124]) -> [SKIP][24] +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][25] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][27] ([Intel XE#2887]) -> [SKIP][28] +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][29] ([Intel XE#2325]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-8/igt@kms_chamelium_color@ctm-0-25.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-bmg:          [SKIP][31] ([Intel XE#2252]) -> [SKIP][32] +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][33] ([Intel XE#2341]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          [SKIP][35] ([Intel XE#2320]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-32x10.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][37] ([Intel XE#2321]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x170.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [DMESG-WARN][39] ([Intel XE#4330]) -> [SKIP][40] +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][41] ([Intel XE#2286]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][43] ([Intel XE#2380]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][45] ([Intel XE#4141]) -> [SKIP][46] +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][47] ([Intel XE#2311]) -> [SKIP][48] +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][49] ([Intel XE#2313]) -> [SKIP][50] +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][51] ([Intel XE#1158]) -> [SKIP][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          [SKIP][53] ([Intel XE#2350]) -> [SKIP][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][55] ([Intel XE#870]) -> [SKIP][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@kms_pm_backlight@bad-brightness.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][57] ([Intel XE#1489]) -> [SKIP][58] +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          [SKIP][59] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][60] +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_psr@psr-cursor-plane-onoff.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][61] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@kms_rotation_crc@bad-pixel-format.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-bmg:          [SKIP][63] ([Intel XE#2905]) -> [SKIP][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@xe_eudebug_online@preempt-breakpoint.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][65] ([Intel XE#2322]) -> [SKIP][66] +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_pm@s3-basic:
    - shard-bmg:          [DMESG-WARN][67] ([Intel XE#4330] / [Intel XE#569]) -> [SKIP][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@xe_pm@s3-basic.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@xe_pm@s3-basic.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][69] ([Intel XE#944]) -> [SKIP][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@xe_query@multigpu-query-invalid-extension.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html

  
New tests
---------

  New tests have been introduced between xe-2713-add427957df4346354020266b1a4c8241ee44331_full and xe-pw-143793v8_full:

### New IGT tests (4) ###

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  

Known issues
------------

  Here are the changes found in xe-pw-143793v8_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][71] -> [DMESG-WARN][72] ([Intel XE#4330] / [Intel XE#4353])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#873])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][74] -> [DMESG-WARN][75] ([Intel XE#4330]) +72 other tests dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2327]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#619])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#3658])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#316]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1407]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [PASS][81] -> [DMESG-FAIL][82] ([Intel XE#4330]) +5 other tests dmesg-fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#316]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][84] ([Intel XE#4330]) +3 other tests dmesg-fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1124]) +7 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1124]) +14 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1124]) +11 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#619])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#1124]) +8 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#2191])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][91] -> [SKIP][92] ([Intel XE#2314] / [Intel XE#2894])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#2191]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#2191]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1512]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#367]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#367]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#367]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#367])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#455] / [Intel XE#787]) +29 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-9/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2887]) +6 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#2887]) +12 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#787]) +151 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#455] / [Intel XE#787]) +41 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#2907])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2907])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#2669]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#3432])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#3432]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#787]) +44 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][112] -> [INCOMPLETE][113] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2652] / [Intel XE#787]) +16 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#306]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#306]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#306]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@kms_chamelium_color@ctm-red-to-blue.html
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2325]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#373]) +8 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#2252]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#373]) +6 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#373]) +8 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#307]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2390])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#307])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-2/igt@kms_content_protection@dp-mst-type-1.html
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#307])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#455]) +17 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@kms_content_protection@legacy.html
    - shard-bmg:          NOTRUN -> [FAIL][128] ([Intel XE#1178]) +1 other test fail
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][129] ([Intel XE#1178]) +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@kms_content_protection@legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#3278]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][131] ([Intel XE#4330]) +1 other test dmesg-fail
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][132] ([Intel XE#4330]) +1 other test dmesg-fail
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#1424]) +5 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#308]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2320]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#308]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-3/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2321])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#2321]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][139] -> [SKIP][140] ([Intel XE#2291]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#309]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#309]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2291])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#323])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2286])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#4302])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@kms_display_modes@extended-mode-basic.html
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#4302])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#4302])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#4302])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#2244]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#2244]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#455]) +19 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#4156])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#776])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-9/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#1137])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@kms_feature_discovery@dp-mst.html
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#1137])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [PASS][157] -> [DMESG-WARN][158] ([Intel XE#2955]) +2 other tests dmesg-warn
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-436/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][159] -> [SKIP][160] ([Intel XE#310]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-436/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#310]) +6 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][162] ([Intel XE#301] / [Intel XE#3321])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][163] ([Intel XE#3321]) +6 other tests fail
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#1421]) +6 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][165] ([Intel XE#2955])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [PASS][166] -> [SKIP][167] ([Intel XE#2316]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          NOTRUN -> [SKIP][168] ([Intel XE#2316])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][169] ([Intel XE#310])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][170] -> [FAIL][171] ([Intel XE#886]) +1 other test fail
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html
    - shard-bmg:          [PASS][172] -> [DMESG-FAIL][173] ([Intel XE#1727])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_flip@blocking-wf_vblank.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@a-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][174] ([Intel XE#1727])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_flip@blocking-wf_vblank@a-dp2.html

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a3:
    - shard-bmg:          [PASS][175] -> [DMESG-WARN][176] ([Intel XE#1727])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_flip@blocking-wf_vblank@c-hdmi-a3.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_flip@blocking-wf_vblank@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a2:
    - shard-dg2-set2:     [PASS][177] -> [FAIL][178] ([Intel XE#301])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a2.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][179] ([Intel XE#301]) +4 other tests fail
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-bmg:          [PASS][180] -> [DMESG-WARN][181] ([Intel XE#2955]) +3 other tests dmesg-warn
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_flip@flip-vs-panning-interruptible.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:
    - shard-bmg:          [PASS][182] -> [DMESG-WARN][183] ([Intel XE#4330]) +43 other tests dmesg-warn
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][184] ([Intel XE#886]) +1 other test fail
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][185] ([Intel XE#2882]) +1 other test fail
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#1397]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#2293] / [Intel XE#2380])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][188] ([Intel XE#1401] / [Intel XE#1745])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#1401])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#2293])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#1397] / [Intel XE#1745]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         [PASS][192] -> [DMESG-FAIL][193] ([Intel XE#324] / [Intel XE#4330]) +1 other test dmesg-fail
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][194] ([Intel XE#352])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][195] ([Intel XE#2311]) +14 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][196] ([Intel XE#651]) +14 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][197] ([Intel XE#656]) +37 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#2312]) +8 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#656]) +5 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#651]) +32 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          NOTRUN -> [SKIP][201] ([Intel XE#4141]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [PASS][202] -> [SKIP][203] ([Intel XE#656]) +4 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][204] ([Intel XE#1151])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#651]) +14 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][206] ([Intel XE#2313]) +12 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][207] ([Intel XE#656]) +37 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][208] ([Intel XE#653]) +11 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][209] ([Intel XE#653]) +27 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][210] ([Intel XE#3374] / [Intel XE#3544])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_hdr@brightness-with-hdr.html
    - shard-bmg:          NOTRUN -> [SKIP][211] ([Intel XE#3544])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][212] ([Intel XE#1503])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#1503])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-4/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][214] ([Intel XE#346])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][215] ([Intel XE#346])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][216] ([Intel XE#346])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2-set2:     [PASS][217] -> [SKIP][218] ([Intel XE#4328])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-lnl:          NOTRUN -> [SKIP][219] ([Intel XE#4329])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][220] ([Intel XE#1035])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-adlp:         NOTRUN -> [WARN][221] ([Intel XE#2078]) +1 other test warn
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][222] ([Intel XE#4330]) +12 other tests dmesg-warn
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][223] ([Intel XE#616]) +3 other tests fail
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][224] ([Intel XE#2393])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html
    - shard-lnl:          NOTRUN -> [SKIP][225] ([Intel XE#599])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][226] ([Intel XE#2493]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.html
    - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#2493]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-8/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][228] ([Intel XE#2566] / [Intel XE#4330]) +3 other tests dmesg-warn
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][229] ([Intel XE#2763]) +7 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][230] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][231] ([Intel XE#2763]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][232] ([Intel XE#2763]) +9 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][233] ([Intel XE#2938])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-adlp:         NOTRUN -> [SKIP][234] ([Intel XE#2938])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-1/igt@kms_pm_backlight@brightness-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][235] ([Intel XE#2938])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][236] ([Intel XE#3309])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][237] ([Intel XE#908])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#2499])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][239] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [PASS][240] -> [SKIP][241] ([Intel XE#836])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][242] ([Intel XE#836])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-lnl:          NOTRUN -> [SKIP][243] ([Intel XE#1439] / [Intel XE#3141])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     [PASS][244] -> [DMESG-WARN][245] ([Intel XE#2042])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-436/igt@kms_pm_rpm@universal-planes-dpms.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-463/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][246] ([Intel XE#2893]) +3 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][247] ([Intel XE#1489]) +11 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][248] ([Intel XE#1489]) +7 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-bmg:          NOTRUN -> [SKIP][249] ([Intel XE#1489]) +6 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][250] ([Intel XE#1122])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][251] ([Intel XE#2850] / [Intel XE#929]) +17 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          NOTRUN -> [SKIP][252] ([Intel XE#1406]) +6 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][253] ([Intel XE#2850] / [Intel XE#929]) +15 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][254] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][255] ([Intel XE#2939])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-bmg:          NOTRUN -> [SKIP][256] ([Intel XE#2414])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][257] ([Intel XE#2939])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][258] ([Intel XE#3414]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
    - shard-lnl:          NOTRUN -> [SKIP][259] ([Intel XE#3414] / [Intel XE#3904]) +4 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][260] ([Intel XE#3414]) +4 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-bmg:          NOTRUN -> [SKIP][261] ([Intel XE#3414] / [Intel XE#3904]) +3 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][262] ([Intel XE#2413])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [PASS][263] -> [SKIP][264] ([Intel XE#455])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-432/igt@kms_vrr@negative-basic.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][265] ([Intel XE#1499])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output:
    - shard-adlp:         NOTRUN -> [SKIP][266] ([Intel XE#756]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][267] ([Intel XE#756])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html
    - shard-lnl:          NOTRUN -> [SKIP][268] ([Intel XE#756]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][269] ([Intel XE#1091] / [Intel XE#2849])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-lnl:          NOTRUN -> [SKIP][270] ([Intel XE#1091] / [Intel XE#2849])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-bmg:          NOTRUN -> [SKIP][271] ([Intel XE#1091] / [Intel XE#2849])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         NOTRUN -> [SKIP][272] ([Intel XE#455] / [Intel XE#488])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-9/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][273] ([Intel XE#2905]) +7 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][274] ([Intel XE#3889])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
    - shard-lnl:          NOTRUN -> [SKIP][275] ([Intel XE#3889])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
    - shard-adlp:         NOTRUN -> [SKIP][276] ([Intel XE#3889])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
    - shard-bmg:          NOTRUN -> [SKIP][277] ([Intel XE#3889])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@discovery-empty:
    - shard-adlp:         NOTRUN -> [SKIP][278] ([Intel XE#2905]) +11 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][279] ([Intel XE#2905]) +10 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_evict@evict-beng-large:
    - shard-adlp:         NOTRUN -> [SKIP][280] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@xe_evict@evict-beng-large.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-bmg:          [PASS][281] -> [DMESG-WARN][282] ([Intel XE#1473] / [Intel XE#4330])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@xe_evict@evict-beng-small-multi-vm.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][283] ([Intel XE#688]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
    - shard-lnl:          NOTRUN -> [SKIP][284] ([Intel XE#688]) +4 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][285] ([Intel XE#1392]) +5 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][286] ([Intel XE#1392]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][287] -> [SKIP][288] ([Intel XE#1392]) +4 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][289] ([Intel XE#1392]) +5 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
    - shard-bmg:          NOTRUN -> [SKIP][290] ([Intel XE#2322]) +3 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
    - shard-adlp:         NOTRUN -> [SKIP][291] ([Intel XE#288]) +25 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][292] ([Intel XE#288]) +26 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-adlp:         NOTRUN -> [SKIP][293] ([Intel XE#2360])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][294] ([Intel XE#2360])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-lnl:          NOTRUN -> [SKIP][295] ([Intel XE#2905]) +11 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-136x136:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][296] ([Intel XE#4330]) +35 other tests dmesg-warn
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-136x136.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][297] ([Intel XE#2229])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][298] ([Intel XE#2229])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - shard-lnl:          NOTRUN -> [SKIP][299] ([Intel XE#2229])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@force-load:
    - shard-adlp:         NOTRUN -> [SKIP][300] ([Intel XE#378])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-1/igt@xe_module_load@force-load.html
    - shard-lnl:          NOTRUN -> [SKIP][301] ([Intel XE#378])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-4/igt@xe_module_load@force-load.html

  * igt@xe_oa@enable-disable:
    - shard-adlp:         NOTRUN -> [SKIP][302] ([Intel XE#2541] / [Intel XE#3573]) +6 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-2/igt@xe_oa@enable-disable.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][303] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         NOTRUN -> [SKIP][304] ([Intel XE#977])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-9/igt@xe_pat@pat-index-xe2.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][305] ([Intel XE#977])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-434/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][306] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-bmg:          [PASS][307] -> [FAIL][308] ([Intel XE#3290])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@xe_pm@d3hot-mmap-system.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@xe_pm@d3hot-mmap-system.html
    - shard-lnl:          [PASS][309] -> [FAIL][310] ([Intel XE#3290])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-lnl-4/igt@xe_pm@d3hot-mmap-system.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-8/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][311] ([Intel XE#1948])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-1/igt@xe_pm@d3hot-mmap-vram.html
    - shard-lnl:          NOTRUN -> [SKIP][312] ([Intel XE#1948])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-4/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s3-basic:
    - shard-lnl:          NOTRUN -> [SKIP][313] ([Intel XE#584])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-8/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][314] ([Intel XE#4330] / [Intel XE#569])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-bmg:          [PASS][315] -> [DMESG-WARN][316] ([Intel XE#4330] / [Intel XE#569])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-8/igt@xe_pm@s3-mocs.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         NOTRUN -> [ABORT][317] ([Intel XE#4268])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@xe_pm@s4-basic-exec.html
    - shard-lnl:          NOTRUN -> [ABORT][318] ([Intel XE#4268])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-1/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][319] ([Intel XE#579])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
    - shard-lnl:          NOTRUN -> [SKIP][320] ([Intel XE#579])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-1/igt@xe_pm@vram-d3cold-threshold.html
    - shard-adlp:         NOTRUN -> [SKIP][321] ([Intel XE#579])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-3/igt@xe_pm@vram-d3cold-threshold.html
    - shard-bmg:          NOTRUN -> [SKIP][322] ([Intel XE#579])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-adlp:         NOTRUN -> [SKIP][323] ([Intel XE#944]) +4 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@xe_query@multigpu-query-cs-cycles.html
    - shard-bmg:          NOTRUN -> [SKIP][324] ([Intel XE#944]) +2 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][325] ([Intel XE#944]) +2 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][326] ([Intel XE#944]) +4 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-1/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-lnl:          NOTRUN -> [SKIP][327] ([Intel XE#4130])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][328] ([Intel XE#3342])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][329] ([Intel XE#4351])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind:
    - shard-adlp:         [DMESG-WARN][330] ([Intel XE#4173]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-adlp-1/igt@core_hotunplug@hotrebind.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@core_hotunplug@hotrebind.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][332] ([Intel XE#4330]) -> [PASS][333] +7 other tests pass
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][334] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#2191]) -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [DMESG-WARN][338] ([Intel XE#4199]) -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][340] ([Intel XE#877]) -> [PASS][341] +1 other test pass
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_color@ctm-signed@pipe-b-hdmi-a-3.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_color@ctm-signed@pipe-b-hdmi-a-3.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][342] ([Intel XE#2291]) -> [PASS][343] +3 other tests pass
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][344] ([Intel XE#2373]) -> [PASS][345]
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][346] ([Intel XE#2955]) -> [PASS][347] +2 other tests pass
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-434/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#310]) -> [PASS][349] +3 other tests pass
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][350] ([Intel XE#2316]) -> [PASS][351] +5 other tests pass
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-dg2-set2:     [FAIL][352] ([Intel XE#301]) -> [PASS][353] +1 other test pass
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][354] ([Intel XE#301]) -> [PASS][355] +1 other test pass
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][356] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][357] +1 other test pass
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-bmg:          [DMESG-WARN][358] ([Intel XE#2955]) -> [PASS][359] +1 other test pass
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [DMESG-WARN][360] ([Intel XE#4330]) -> [PASS][361] +26 other tests pass
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][362] ([Intel XE#324] / [Intel XE#4330]) -> [PASS][363] +1 other test pass
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#656]) -> [PASS][365] +1 other test pass
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:
    - shard-dg2-set2:     [DMESG-WARN][366] ([Intel XE#2566] / [Intel XE#4330]) -> [PASS][367] +1 other test pass
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:
    - shard-bmg:          [DMESG-WARN][368] ([Intel XE#2566] / [Intel XE#4330]) -> [PASS][369] +3 other tests pass
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#836]) -> [PASS][371]
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-463/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [DMESG-WARN][372] -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-436/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-50:
    - shard-adlp:         [DMESG-WARN][374] ([Intel XE#2953]) -> [PASS][375] +1 other test pass
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-adlp-1/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-1/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html

  * igt@kms_properties@invalid-properties-legacy:
    - shard-adlp:         [DMESG-WARN][376] -> [PASS][377] +1 other test pass
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-adlp-1/igt@kms_properties@invalid-properties-legacy.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-1/igt@kms_properties@invalid-properties-legacy.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#455]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-434/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_evict@evict-large-cm:
    - shard-dg2-set2:     [DMESG-WARN][380] ([Intel XE#1473] / [Intel XE#4330]) -> [PASS][381]
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@xe_evict@evict-large-cm.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@xe_evict@evict-large-cm.html

  * igt@xe_evict@evict-small:
    - shard-bmg:          [DMESG-WARN][382] ([Intel XE#1473] / [Intel XE#4330]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@xe_evict@evict-small.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@xe_evict@evict-small.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#1392]) -> [PASS][385] +1 other test pass
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0:
    - shard-bmg:          [DMESG-WARN][386] ([Intel XE#4330]) -> [PASS][387] +27 other tests pass
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [FAIL][388] ([Intel XE#1999]) -> [PASS][389] +2 other tests pass
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400], [PASS][401], [SKIP][402], [PASS][403], [PASS][404], [PASS][405], [PASS][406], [PASS][407], [PASS][408], [PASS][409], [PASS][410], [PASS][411], [PASS][412], [PASS][413], [PASS][414], [PASS][415]) ([Intel XE#2457]) -> ([PASS][416], [PASS][417], [PASS][418], [PASS][419], [PASS][420], [PASS][421], [PASS][422], [PASS][423], [PASS][424], [PASS][425], [PASS][426], [PASS][427], [PASS][428], [PASS][429], [PASS][430], [PASS][431], [PASS][432], [PASS][433], [PASS][434], [PASS][435], [PASS][436], [PASS][437], [PASS][438], [PASS][439])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@xe_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@xe_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@xe_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-8/igt@xe_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@xe_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-8/igt@xe_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-8/igt@xe_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-8/igt@xe_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@xe_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@xe_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@xe_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@xe_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@xe_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@xe_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@xe_module_load@load.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@xe_module_load@load.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@xe_module_load@load.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@xe_module_load@load.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@xe_module_load@load.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@xe_module_load@load.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@xe_module_load@load.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@xe_module_load@load.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@xe_module_load@load.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@xe_module_load@load.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@xe_module_load@load.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@xe_module_load@load.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@xe_module_load@load.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@xe_module_load@load.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@xe_module_load@load.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@xe_module_load@load.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@xe_module_load@load.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@xe_module_load@load.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@xe_module_load@load.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@xe_module_load@load.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@xe_module_load@load.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@xe_module_load@load.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@xe_module_load@load.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@xe_module_load@load.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@xe_module_load@load.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@xe_module_load@load.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@xe_module_load@load.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@xe_module_load@load.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@xe_module_load@load.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@xe_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@xe_module_load@load.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@xe_module_load@load.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@xe_module_load@load.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@xe_module_load@load.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@xe_module_load@load.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@xe_module_load@load.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][440] ([Intel XE#4330] / [Intel XE#569]) -> [PASS][441]
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-463/igt@xe_pm@s3-basic-exec.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@xe_pm@s3-basic-exec.html
    - shard-bmg:          [DMESG-WARN][442] ([Intel XE#4330] / [Intel XE#569]) -> [PASS][443]
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@xe_pm@s3-basic-exec.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@xe_pm@s3-basic-exec.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][444] ([Intel XE#4330]) -> [DMESG-FAIL][445] ([Intel XE#4330]) +2 other tests dmesg-fail
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-463/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#787]) -> [SKIP][447] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-436/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][449] ([Intel XE#787]) +6 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][450] ([Intel XE#1178]) -> [DMESG-FAIL][451] ([Intel XE#4330]) +2 other tests dmesg-fail
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@kms_content_protection@lic-type-0.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-434/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][452] ([Intel XE#3304]) -> [DMESG-FAIL][453] ([Intel XE#4330])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [DMESG-FAIL][454] ([Intel XE#4330]) -> [FAIL][455] ([Intel XE#1178]) +1 other test fail
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_content_protection@srm.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     [DMESG-FAIL][456] ([Intel XE#4330]) -> [FAIL][457] ([Intel XE#1178]) +1 other test fail
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][458] ([Intel XE#1188]) -> [DMESG-FAIL][459] ([Intel XE#4330]) +1 other test dmesg-fail
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@kms_content_protection@uevent.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][460] ([Intel XE#2291]) -> [DMESG-WARN][461] ([Intel XE#4330]) +2 other tests dmesg-warn
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#309]) -> [DMESG-WARN][463] ([Intel XE#4330]) +2 other tests dmesg-warn
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#310]) -> [DMESG-WARN][465] ([Intel XE#4330])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [DMESG-WARN][466] ([Intel XE#2955]) -> [SKIP][467] ([Intel XE#2316])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
    - shard-dg2-set2:     [DMESG-WARN][468] ([Intel XE#2955]) -> [SKIP][469] ([Intel XE#310])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][470] ([Intel XE#2316]) -> [DMESG-WARN][471] ([Intel XE#4330])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [FAIL][472] ([Intel XE#2882]) -> [SKIP][473] ([Intel XE#2316])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][474] ([Intel XE#2311]) -> [SKIP][475] ([Intel XE#2312]) +12 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][476] ([Intel XE#2312]) -> [SKIP][477] ([Intel XE#4141]) +5 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][478] ([Intel XE#656]) -> [DMESG-WARN][479] ([Intel XE#4330])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][480] ([Intel XE#4141]) -> [SKIP][481] ([Intel XE#2312]) +11 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][482] ([Intel XE#2312]) -> [SKIP][483] ([Intel XE#2311]) +16 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][484] ([Intel XE#656]) -> [SKIP][485] ([Intel XE#651]) +7 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#651]) -> [SKIP][487] ([Intel XE#656]) +3 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][488] ([Intel XE#2312]) -> [SKIP][489] ([Intel XE#2313]) +7 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#653]) -> [SKIP][491] ([Intel XE#656]) +9 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#656]) -> [SKIP][493] ([Intel XE#653]) +10 other tests skip
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][494] ([Intel XE#2313]) -> [SKIP][495] ([Intel XE#2312]) +16 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [DMESG-FAIL][496] ([Intel XE#4330]) -> [FAIL][497] ([Intel XE#1430])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#362]) -> [SKIP][499] ([Intel XE#1500])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][500] ([Intel XE#1173]) -> [SKIP][501] ([Intel XE#1061])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@xe_peer2peer@read.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][502] -> [ABORT][503] ([Intel XE#4268])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@xe_pm@s4-d3hot-basic-exec.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@xe_pm@s4-d3hot-basic-exec.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3290]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3290
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4199]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4199
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4353
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_8247 -> IGT_8248
  * Linux: xe-2713-add427957df4346354020266b1a4c8241ee44331 -> xe-pw-143793v8

  IGT_8247: 8247
  IGT_8248: 8248
  xe-2713-add427957df4346354020266b1a4c8241ee44331: add427957df4346354020266b1a4c8241ee44331
  xe-pw-143793v8: 143793v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/index.html

--===============5774108703745329706==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Use hint for guc to set GT freq=
uency (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143793/">https://patchwork.freedesktop.org/series/143793/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-143793v8/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143793v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2713-add427957df4346354020266b1a4c8241=
ee44331_full -&gt; xe-pw-143793v8_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143793v8_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-143793v8_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1437=
93v8_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@core_get=
version@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@core_getversion@basic.html">FAI=
L</a></li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-2.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-463/igt@kms_fl=
ip@2x-plain-flip-fb-recreate-interruptible@bd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/sha=
rd-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bd-hdmi-a6-=
dp4.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_flip@blocking-wf_vblank@b=
-dp2.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_flip=
@blocking-wf_vblank@b-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_flip@blocki=
ng-wf_vblank@b-hdmi-a3.html">DMESG-FAIL</a> +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.htm=
l">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-many-write-read-sync:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@xe_dma_b=
uf_sync@export-dma-buf-many-write-read-sync.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@x=
e_dma_buf_sync@export-dma-buf-many-write-read-sync.html">SKIP</a> +39 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@virtual-utilization-single-full-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@xe_drm_f=
dinfo@virtual-utilization-single-full-load.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@xe=
_drm_fdinfo@virtual-utilization-single-full-load.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@xe_exec_fault_mode@twice-bind=
execqueue-userptr-rebind-prefetch.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-8/igt@xe_modul=
e_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@xe_module_load@many-reload=
.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@xe_mod=
ule_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@xe_module_load@many-re=
load.html">DMESG-WARN</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-lnl-7/igt@xe_modul=
e_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-143793v8/shard-lnl-8/igt@xe_module_load@many-reload=
.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370=
">Intel XE#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset=
-transition-fencing-internal-panels.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_big_=
fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms=
_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143793v8/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x=
1440p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@kms_ccs@=
crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-b=
mg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-8/igt@kms_cham=
elium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_chamel=
ium_color@ctm-0-25.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-8/igt@kms_cham=
elium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/=
igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_cont=
ent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_=
content_protection@atomic-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_curs=
or_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@k=
ms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_curs=
or_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@km=
s_cursor_crc@cursor-random-512x170.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@kms_curs=
or_crc@cursor-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms=
_cursor_crc@cursor-suspend.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel =
XE#2286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143793v8/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor=
-atomic-transitions.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">I=
ntel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-143793v8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32=
bpp-4tiledg2rcccs-downscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1437=
93v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-143793v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
793v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-434/=
igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/ig=
t@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@kms_pm_b=
acklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_pm_ba=
cklight@bad-brightness.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@kms_psr2=
_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#=
1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143793v8/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-ex=
ceed-fully-sf.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_psr@=
psr-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-=
5/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@kms_rota=
tion_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-b=
mg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@xe_eudeb=
ug_online@preempt-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@xe=
_eudebug_online@preempt-breakpoint.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@xe_exec_=
basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-=
5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@xe_pm@s3=
-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@xe_pm@=
s3-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@xe_query=
@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/ig=
t@xe_query@multigpu-query-invalid-extension.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2713-add427957df4346354020266b=
1a4c8241ee44331_full and xe-pw-143793v8_full:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143793v8_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_=
async_flips@alternate-sync-async-flip-atomic.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4353"=
>Intel XE#4353</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@kms_async_flips@invalid-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@kms_at=
omic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-=
dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4330">Intel XE#4330</a>) +72 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_big_fb@x-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-adlp-8/igt@kms_big=
_fb@x-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-2/igt@kms_big_fb@x-tiled=
-8bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +5 other tests dmesg-fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-st=
ride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +3 othe=
r tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-4/igt@kms_big_fb@yf-tiled-16bpp-ro=
tate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-6/igt@kms_bw@connected-linear-tilin=
g-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-2/igt@kms_bw@connected-linear-tili=
ng-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</l=
i>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@kms_bw@connected-linear-til=
ing-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</=
li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-6/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@kms_bw@linear-tiling-1-displ=
ays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_bw@linear-tiling-2-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_bw@linear-tiling-3-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@kms_bw@linear-tiling-3-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-9/igt@kms_ccs@bad-aux-stride-4-til=
ed-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 other tests ski=
p</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-8/igt@kms_ccs@ccs-on-another-bo-4-t=
iled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +151 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-2/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +44 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg=
2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) +1 other test inco=
mplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +16 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_chamelium_color@ctm-lim=
ited-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/306">Intel XE#306</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_chamelium_color@ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@kms_chamelium_color@ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@kms_chamelium_color@ctm-red-t=
o-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-aft=
er-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-ena=
ble-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_content_protection@dp-m=
st-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-2/igt@kms_content_protection@dp-ms=
t-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@kms_content_protection@legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +17 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>) +1 other test fail</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@kms_content_protection@lega=
cy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1178">Intel XE#1178</a>) +1 other test fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-1/igt@kms_content_protection@legacy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +1 other test dmesg-fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@kms_content_protection@ueve=
nt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4330">Intel XE#4330</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_cursor_crc@cursor-offscre=
en-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@kms_cursor_crc@cursor-onscr=
een-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_cursor_crc@cursor-random-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-3/igt@kms_cursor_crc@cursor-random=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@kms_cursor_crc@cursor-random-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@kms_cursor_legacy@2x-long-fl=
ip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@kms_cursor_legacy@2x-nonblock=
ing-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip=
</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblock=
ing-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-434/igt@kms_cursor_legacy@basic-bus=
y-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-=
flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@kms_display_modes@extended-m=
ode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4302">Intel XE#4302</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_display_modes@extended-mo=
de-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4302">Intel XE#4302</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_display_modes@extended-=
mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4302">Intel XE#4302</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_display_modes@extended-mo=
de-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2244">Intel XE#2244</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_dsc@dsc-with-bpc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244=
">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-format=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-9/igt@kms_fbcon_fbt@psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">I=
ntel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@kms_feature_discovery@dp-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1137">Intel XE#1137</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_feature_discovery@dp-mst.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-436/igt@kms_fl=
ip@2x-dpms-vs-vblank-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@kms_flip@2x-dpms-=
vs-vblank-race.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) +2 other tests dmesg-warn=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_flip@2=
x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/310">Intel XE#310</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-v=
blank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-8/igt@kms_flip=
@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/ig=
t@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#=
2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-chec=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2316">Intel XE#2316</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-ch=
eck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-lnl-4/igt@kms_flip=
@blocking-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-8/igt@kms_flip@blocking-wf_vbla=
nk.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/886">Intel XE#886</a>) +1 other test fail</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_flip=
@blocking-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_flip@blocking-wf_vbla=
nk.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_flip@blocking-wf_vblank@a=
-dp2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_flip=
@blocking-wf_vblank@c-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-5/igt@kms_flip@blocki=
ng-wf_vblank@c-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-432/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@d-hdmi-a2.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-4=
32/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a2.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Int=
el XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_flip@flip-vs-expired-vb=
lank@a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/301">Intel XE#301</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_flip=
@flip-vs-panning-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_flip@flip-=
vs-panning-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) +3 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_flip=
@plain-flip-ts-check-interruptible@d-hdmi-a3.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/ig=
t@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Inte=
l XE#4330</a>) +43 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@=
a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_flip@plain-flip-ts-check@=
a-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2=
380</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1=
745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Inte=
l XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-adlp-1/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shar=
d-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscalin=
g.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/324">Intel XE#324</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +1 other test dmesg-fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_force_connector_basic@for=
ce-connector-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-3/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-1/igt@kms_frontbuffer_tracking@drr=
s-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +37 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@kms_frontbuffer_tracking@dr=
rs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/651">Intel XE#651</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shar=
d-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +37 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cpsr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"=
>Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-4/igt@kms_hdr@static-swap.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"=
>Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@kms_joiner@basic-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/346">Intel XE#346</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/346">Intel XE#346</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@kms_jo=
iner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_j=
oiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-3/igt@kms_plane@pixel-format-sourc=
e-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-3/igt@kms_plane@pixel-format-sourc=
e-clamping@pipe-a-plane-0.html">WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_plane@plane-panning-botto=
m-right-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +12 other tests dmesg-wa=
rn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2393">Intel XE#2393</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2493">Intel XE#2493</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-8/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2493">Intel XE#2493</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@kms_plane_scaling@plane-ups=
cale-20x20-with-modifiers.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) =
+3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_plane_scaling@planes-down=
scale-factor-0-5-upscale-20x20@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@kms_plane_scaling@planes-up=
scale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@kms_plane_scaling@planes-up=
scale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@kms_pm_backlight@brightness-w=
ith-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2938">Intel XE#2938</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-1/igt@kms_pm_backlight@brightness-=
with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2938">Intel XE#2938</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_pm_backlight@brightness=
-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"=
>Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499=
">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stres=
s-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-463/igt@kms_pm=
_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_pm_rpm@mod=
eset-non-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-=
stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/836">Intel XE#836</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-436/igt@kms_pm=
_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-463/igt@kms_pm_rpm@unive=
rsal-planes-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-overlay-pl=
ane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane=
-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-4/igt@kms_psr2_sf@psr2-cursor-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tes=
ts skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-pla=
ne-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-3/igt@kms_psr@pr-sprite-blt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@kms_psr@psr-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@kms_psr@psr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-4/igt@kms_psr_stress_test@invalida=
te-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_psr_stress_test@invalidat=
e-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@kms_psr_stress_test@invalid=
ate-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-434/igt@kms_rotation_crc@bad-tiling=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3414">Intel XE#3414</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@kms_rotation_crc@bad-tiling.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3904">Intel XE#3904</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@kms_rotation_crc@primary-rot=
ation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a>) +4 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_rotation_crc@primary-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@kms_scaling_modes@scaling-mod=
e-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-432/igt@kms_vr=
r@negative-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@kms_vrr@negative-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vr=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@kms_writeback@writeback-chec=
k-output.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@kms_writeback@writeback-fb-=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/756">Intel XE#756</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@kms_writeback@writeback-fb-id=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@sriov_basic@enable-vfs-bind=
-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-8/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-9/igt@xe_ccs@block-multicopy-inpla=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-meta=
data-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-uf=
ence-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufen=
ce-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-ufe=
nce-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufen=
ce-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@xe_eudebug@discovery-empty.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@xe_eudebug_online@preempt-b=
reakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@xe_evict@evict-beng-large.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@xe_evict=
@evict-beng-small-multi-vm.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@xe_evict@evict-ben=
g-small-multi-vm.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@xe_evict_ccs@evict-overcommi=
t-standalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</=
li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit=
-standalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@xe_exec_basic@multigpu-no-e=
xec-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-43=
2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Inte=
l XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests sk=
ip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@xe_exec_fault_mode@invalid-v=
a-scratch-nopagefault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@xe_exec_fault_mode@once-inv=
alid-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@xe_exec_mix_modes@exec-spinn=
er-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-7/igt@xe_exec_sip_eudebug@breakpoin=
t-writesip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy-inc-dimension@xmajor-vram01-vram01-136x136=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@xe_exercise_blt@fast-copy-i=
nc-dimension@xmajor-vram01-vram01-136x136.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>=
) +35 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@xe_live_ktest@xe_migrate@xe_=
validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe=
_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-2/igt@xe_live_ktest@xe_migrate@xe_v=
alidate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-1/igt@xe_module_load@force-load.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/378">Intel XE#378</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-4/igt@xe_module_load@force-load.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@enable-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-2/igt@xe_oa@enable-disable.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/254=
1">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-str=
eam-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-9/igt@xe_pat@pat-index-xe2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/97=
7">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@xe_pm@d3=
hot-mmap-system.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@xe_pm@d3hot-mmap-system.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
290">Intel XE#3290</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-lnl-4/igt@xe_pm@d3=
hot-mmap-system.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-8/igt@xe_pm@d3hot-mmap-system.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
290">Intel XE#3290</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-1/igt@xe_pm@d3hot-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/19=
48">Intel XE#1948</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-4/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-8/igt@xe_pm@s3-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel=
 XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@xe_pm@s3-d3hot-basic-exec.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-8/igt@xe_pm@s3=
-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143793v8/shard-bmg-7/igt@xe_pm@s3-mocs.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#=
4330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
69">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@xe_pm@s4-basic-exec.html">AB=
ORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/426=
8">Intel XE#4268</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-1/igt@xe_pm@s4-basic-exec.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268=
">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/579">Intel XE#579</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-1/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-3/igt@xe_pm@vram-d3cold-threshold.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/579">Intel XE#579</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-adlp-6/igt@xe_query@multigpu-query-cs-c=
ycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +4 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@xe_query@multigpu-query-cs-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@xe_query@multigpu-query-eng=
ines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-1/igt@xe_query@multigpu-query-inval=
id-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-lnl-5/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-463/igt@xe_sriov_flr@flr-each-isola=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@xe_sriov_scheduling@equal-t=
hroughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-adlp-1/igt@core_ho=
tunplug@hotrebind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-8/igt@core_h=
otunplug@hotrebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-adlp-1/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel=
 XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-143793v8/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143793v8/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/=
shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4199">Intel XE#4199</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/=
shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_colo=
r@ctm-signed@pipe-b-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/ig=
t@kms_color@ctm-signed@pipe-b-hdmi-a-3.html">PASS</a> +1 other test pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143793v8/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_fe=
ature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@kms_fl=
ip@2x-dpms-vs-vblank-race-interruptible.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/s=
hard-dg2-434/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/s=
hard-dg2-436/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html=
">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@kms_flip@2x-=
nonexisting-fb.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-432/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-dp2.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/sha=
rd-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-lnl-8/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shar=
d-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@kms_flip=
@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/i=
gt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a> +1 other test pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">I=
ntel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-143793v8/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-=
64bpp-4tile-downscaling.html">PASS</a> +26 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-adlp-1/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/324">Intel XE#324</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-9/igt@kms_flip_sca=
led_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793=
v8/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-=
blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@kms_pl=
ane_scaling@plane-scaler-unity-scaling-with-rotation.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel =
XE#2566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-=
unity-scaling-with-rotation.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@kms_plan=
e_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2566">Intel XE#2566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@kms_plane_scaling@pl=
anes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html">PASS</a> +3 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_pm=
_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-463/igt@k=
ms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-436/igt@kms_pm=
_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-436/igt@kms_pm=
_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-50:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-adlp-1/igt@kms_pm_=
rpm@universal-planes-dpms@plane-50.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-=
adlp-1/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@invalid-properties-legacy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-adlp-1/igt@kms_pro=
perties@invalid-properties-legacy.html">DMESG-WARN</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-adlp-1/igt@kms_=
properties@invalid-properties-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_se=
tmode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-434/igt@kms_=
setmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@xe_evi=
ct@evict-large-cm.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2=
-433/igt@xe_evict@evict-large-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@xe_evict=
@evict-small.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/ig=
t@xe_evict@evict-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-rebind.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-464/igt@=
xe_exec_basic@multigpu-once-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render=
0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@xe_exec_=
sip_eudebug@wait-writesip-nodebug@drm_xe_engine_class_render0.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/433=
0">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-143793v8/shard-bmg-8/igt@xe_exec_sip_eudebug@wait-writesip-node=
bug@drm_xe_engine_class_render0.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-434/igt@xe_liv=
e_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard=
-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a>=
 +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee4=
4331/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c824=
1ee44331/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4=
c8241ee44331/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266=
b1a4c8241ee44331/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df434635402=
0266b1a4c8241ee44331/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df43463=
54020266b1a4c8241ee44331/shard-bmg-6/igt@xe_module_load@load.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4=
346354020266b1a4c8241ee44331/shard-bmg-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add42795=
7df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-add4=
27957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2713-=
add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-=
bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee44331/sh=
ard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2713-add427957df4346354020266b1a4c8241ee4433=
1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43793v8/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143793v8/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43793v8/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143793v8/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43793v8/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143793v8/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43793v8/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143793v8/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43793v8/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-463/igt@xe_pm@=
s3-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4330">Intel XE#4330</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/=
igt@xe_pm@s3-basic-exec.html">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@xe_pm@s3=
-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4330">Intel XE#4330</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@x=
e_pm@s3-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-463/igt@kms_as=
ync_flips@async-flip-suspend-resume@pipe-d-dp-4.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#43=
30</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3793v8/shard-dg2-434/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-d=
p-4.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4330">Intel XE#4330</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-436/igt@kms_cc=
s@crc-primary-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/=
shard-dg2-464/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel=
 XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143793v8/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d=
-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@kms_co=
ntent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-434/igt@k=
ms_content_protection@lic-type-0.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +2 othe=
r tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@kms_co=
ntent_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-d=
g2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">In=
tel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_cont=
ent_protection@srm.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-4/igt@kms_co=
ntent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-435/igt@kms_co=
ntent_protection@srm@pipe-a-dp-4.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg=
2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-1/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-2/igt@kms_conte=
nt_protection@uevent.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +1 other test dmesg=
-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_curs=
or_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-b=
mg-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">In=
tel XE#4330</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-433=
/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#433=
0</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_fl=
ip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-433/=
igt@kms_flip@2x-blocking-absolute-wf_vblank.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg=
-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)=
</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-dpms-off-vs-modeset.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-d=
g2-464/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-=
bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">=
Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-2/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-=
4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
793v8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143793v8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793=
v8/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-ono=
ff.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143793v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3793v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-p=
gflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2311">Intel XE#2311</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Inte=
l XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-143793v8/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn=
-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3793v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1437=
93v8/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793=
v8/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793=
v8/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3793v8/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-bmg-7/igt@kms_pm_d=
c@dc6-dpms.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-bmg-8/igt@kms_pm_dc@dc6-=
dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v8/sha=
rd-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500=
">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-464/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-432/igt@xe_peer2peer@read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2713-add427957df4346354020266b1a4c8241ee44331/shard-dg2-433/igt@xe_pm@=
s4-d3hot-basic-exec.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-143793v8/shard-dg2-435/igt@xe_pm@s4-d3hot-basic-e=
xec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8247 -&gt; IGT_8248</li>
<li>Linux: xe-2713-add427957df4346354020266b1a4c8241ee44331 -&gt; xe-pw-143=
793v8</li>
</ul>
<p>IGT_8247: 8247<br />
  IGT_8248: 8248<br />
  xe-2713-add427957df4346354020266b1a4c8241ee44331: add427957df434635402026=
6b1a4c8241ee44331<br />
  xe-pw-143793v8: 143793v8</p>

</body>
</html>

--===============5774108703745329706==--
