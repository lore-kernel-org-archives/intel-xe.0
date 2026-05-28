Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7A8CD5BD5
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 04:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04E210EBE7;
	Thu, 28 May 2026 04:40:26 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436B710EBE7;
 Thu, 28 May 2026 04:40:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9156547733041655675=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/mmio=3A_Assert_MMIO?=
 =?utf-8?q?_is_available?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 May 2026 04:40:25 -0000
Message-ID: <177994322526.18055.663247532506977023@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260527175437.22585-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260527175437.22585-1-michal.wajdeczko@intel.com>
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

--===============9156547733041655675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/mmio: Assert MMIO is available
URL   : https://patchwork.freedesktop.org/series/167403/
State : failure

== Summary ==

CI Bug Log - changes from xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb_FULL -> xe-pw-167403v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-167403v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-167403v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-167403v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          NOTRUN -> [ABORT][1] +3 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@core_hotunplug@unplug-rescan.html

  * igt@xe_configfs@ctx-restore-post-bb-invalid:
    - shard-lnl:          [PASS][2] -> [ABORT][3] +19 other tests abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-7/igt@xe_configfs@ctx-restore-post-bb-invalid.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-1/igt@xe_configfs@ctx-restore-post-bb-invalid.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-lnl:          NOTRUN -> [ABORT][4] +2 other tests abort
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][5] -> [ABORT][6] +24 other tests abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  
#### Warnings ####

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][7] ([Intel XE#6703]) -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-10/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  
Known issues
------------

  Here are the changes found in xe-pw-167403v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][9] ([Intel XE#3718] / [Intel XE#7265]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#607] / [Intel XE#7361])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#7679])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#367]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#7676])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#3432])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2652]) +17 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2325] / [Intel XE#7358])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2252])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7642])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2320]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1424]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#309] / [Intel XE#7343])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#4354] / [Intel XE#7386])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#4422] / [Intel XE#7442])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#301]) +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#7178] / [Intel XE#7349])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7178] / [Intel XE#7349])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#7178] / [Intel XE#7351])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#656] / [Intel XE#7905]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#4141]) +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2311]) +18 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#6312] / [Intel XE#651])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#6312]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7061])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7399])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#7905]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7061] / [Intel XE#7356])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2313]) +18 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7865]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1503] / [Intel XE#7915])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#7915]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-10/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-3/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@static-toggle@pipe-a-edp-1-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#7915]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_hdr@static-toggle@pipe-a-edp-1-xrgb2101010.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7130]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7283]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#5021] / [Intel XE#7377])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2499])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#2893] / [Intel XE#7304])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1489]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1406]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2426] / [Intel XE#5848])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2450] / [Intel XE#5857])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#7636]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-1/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#7636])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#7482])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2322] / [Intel XE#7372])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1392])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#7136]) +6 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#7136])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#6874]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#6874]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_reset@long-spin-many-preempt-gt1-threads:
    - shard-bmg:          [PASS][67] -> [FAIL][68] ([Intel XE#7956])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-4/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#7866])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7138]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-multi-queue-rebind-err:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#7138])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-rebind-err.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2229])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#6964])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#7793])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-bmg:          NOTRUN -> [FAIL][75] ([Intel XE#7695])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#4733] / [Intel XE#7417])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-topology:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#944])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@xe_query@multigpu-query-topology.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][78] ([Intel XE#301]) -> [PASS][79] +1 other test pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-bmg:          [DMESG-FAIL][80] ([Intel XE#5545] / [Intel XE#7774]) -> [PASS][81] +1 other test pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-10/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@xe_exec_system_allocator@madvise-range-invalidate-change-attr:
    - shard-bmg:          [SKIP][82] ([Intel XE#6703]) -> [PASS][83] +4 other tests pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_exec_system_allocator@madvise-range-invalidate-change-attr.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-10/igt@xe_exec_system_allocator@madvise-range-invalidate-change-attr.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [SKIP][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-1/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-8/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-1/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-2/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-7/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-2/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-3/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-3/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-3/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-7/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-7/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-2/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-5/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-6/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-6/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-7/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-8/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-8/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-3/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-5/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-4/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-4/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-4/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-1/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-7/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-4/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-6/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-4/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-7/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-8/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-1/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-3/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-6/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-6/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-1/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-7/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-3/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-3/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-8/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-8/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-3/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-6/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-1/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [SKIP][154]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-9/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-9/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-6/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-6/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-4/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-4/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-5/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-5/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-5/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-3/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-7/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-10/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-1/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-8/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-1/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-3/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-10/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-10/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-10/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-3/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-9/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-4/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-10/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-1/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-3/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-6/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-6/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-3/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-8/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-10/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-9/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-1/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-4/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-8/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-4/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-8/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][180] ([Intel XE#6703]) -> [SKIP][181] ([Intel XE#2311])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][182] ([Intel XE#6703]) -> [SKIP][183] ([Intel XE#2313])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-msflip-blt.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:
    - shard-bmg:          [SKIP][184] ([Intel XE#6703]) -> [SKIP][185] ([Intel XE#6503])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-bmg:          [SKIP][186] ([Intel XE#6703]) -> [SKIP][187] ([Intel XE#7636])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-10/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_exec_multi_queue@max-queues-dyn-priority-smem:
    - shard-bmg:          [SKIP][188] ([Intel XE#6703]) -> [SKIP][189] ([Intel XE#6874])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-dyn-priority-smem.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-10/igt@xe_exec_multi_queue@max-queues-dyn-priority-smem.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          [SKIP][190] ([Intel XE#6703]) -> [SKIP][191] ([Intel XE#7793])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_page_reclaim@boundary-split.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-10/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          [SKIP][192] ([Intel XE#6703]) -> [SKIP][193] ([Intel XE#4733] / [Intel XE#7417])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7676
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7956]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb -> xe-pw-167403v1

  IGT_8939: 8939
  xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb: 11a8456527f00d86dc8b23035c324da194fbbadb
  xe-pw-167403v1: 167403v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/index.html

--===============9156547733041655675==
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
<tr><td><b>Series:</b></td><td>drm/xe/mmio: Assert MMIO is available</td></=
tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/167403/">https://patchwork.freedesktop.org/series/167403/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-167403v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-167403v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5138-11a8456527f00d86dc8b23035c324da19=
4fbbadb_FULL -&gt; xe-pw-167403v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-167403v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-167403v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1674=
03v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@core_hotunplug@unplug-rescan.=
html">ABORT</a> +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@ctx-restore-post-bb-invalid:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-7/igt@xe_confi=
gfs@ctx-restore-post-bb-invalid.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-1/igt@xe_configfs@c=
tx-restore-post-bb-invalid.html">ABORT</a> +19 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@xe_fault_injection@exec-queue=
-create-fail-xe_pxp_exec_queue_add.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-10/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/sh=
ard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_e=
arly.html">ABORT</a> +24 other tests abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_fault=
_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
167403v1/shard-bmg-10/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_=
exec_queue_add.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167403v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_async_flips@alternate-syn=
c-async-flip@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>) +1 oth=
er test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_bw@connected-linear-tilin=
g-3-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@kms_bw@linear-tiling-2-displa=
ys-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_bw@linear-tiling-4-displa=
ys-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7676">Intel XE#7676</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +17 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-stor=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@kms_content_protection@lic-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding=
-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_cursor_legacy@2x-long-fli=
p-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@kms_dp_link_training@uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7=
349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE=
#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-=
1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-rend=
er:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbch=
dr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcp=
srhdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-=
2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-=
abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psrh=
dr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psrh=
dr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_hdr@static-toggle.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/150=
3">Intel XE#1503</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7915">Intel XE#7915</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-10/igt@kms_hdr=
@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-3/i=
gt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel X=
E#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-edp-1-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_hdr@static-toggle@pipe-a-=
edp-1-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-1/igt@kms_plane@pixel-format-4-tile=
d-bmg-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@kms_plane@pixel-format-4-tile=
d-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-=
yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499=
">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@kms_psr@fbc-pr-cursor-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-1/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2450">Intel XE#2450</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@xe_create@multigpu-create-mas=
sive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2504">Intel XE#2504</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-1/igt@xe_eudebug_online@set-breakpo=
int-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@xe_eudebug_online@writes-cach=
ing-sram-bb-sram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@xe_exec_balancer@many-execque=
ues-cm-parallel-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-3/igt@xe_exec_basic@multigpu-once-u=
serptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@xe_exec_fault_mode@twice-mult=
i-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7136">Intel XE#7136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@xe_exec_multi_queue@many-queu=
es-preempt-mode-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@xe_exec_multi_queue@two-queue=
s-preempt-mode-fault-priority.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt-gt1-threads:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_exec_=
reset@long-spin-many-preempt-gt1-threads.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-4/igt@xe_e=
xec_reset@long-spin-many-preempt-gt1-threads.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7956">Intel XE#7956</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@xe_exec_reset@multi-queue-clo=
se-execqueues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7866">Intel XE#7866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@xe_exec_threads@threads-multi=
-queue-mixed-fd-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind-err:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@xe_exec_threads@threads-multi=
-queue-rebind-err.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@xe_multigpu_svm@mgpu-pagefaul=
t-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@xe_page_reclaim@boundary-spli=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@xe_pat@pat-sw-hw-compare.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@xe_query@multigpu-query-topol=
ogy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shar=
d-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@kms_pipe=
_crc_basic@nonblocking-crc.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/=
shard-bmg-10/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> +1 other=
 test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-range-invalidate-change-attr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_exec_=
system_allocator@madvise-range-invalidate-change-attr.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#67=
03</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
7403v1/shard-bmg-10/igt@xe_exec_system_allocator@madvise-range-invalidate-c=
hange-attr.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/sha=
rd-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fb=
badb/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da1=
94fbbadb/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c32=
4da194fbbadb/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b2303=
5c324da194fbbadb/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b=
23035c324da194fbbadb/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86=
dc8b23035c324da194fbbadb/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f0=
0d86dc8b23035c324da194fbbadb/shard-lnl-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a84565=
27f00d86dc8b23035c324da194fbbadb/shard-lnl-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8=
456527f00d86dc8b23035c324da194fbbadb/shard-lnl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-=
11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-5/igt@xe_mod=
ule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-=
lnl-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/sha=
rd-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-4/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-167403v1/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-167403v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/sha=
rd-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-8/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-167403v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-167403v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/sha=
rd-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-167403v1/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-167403v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/sha=
rd-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-1/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-167403v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-167403v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/sha=
rd-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-8/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-167403v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-lnl-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-167403v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</=
a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-9/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-9=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/sha=
rd-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fb=
badb/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da1=
94fbbadb/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c32=
4da194fbbadb/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b2303=
5c324da194fbbadb/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86dc8b=
23035c324da194fbbadb/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f00d86=
dc8b23035c324da194fbbadb/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456527f0=
0d86dc8b23035c324da194fbbadb/shard-bmg-10/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a8456=
527f00d86dc8b23035c324da194fbbadb/shard-bmg-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138-11a=
8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5138=
-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-1/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-10/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-10/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-1=
0/igt@xe_module_load@load.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard=
-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-167403v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-9/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-167403v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard=
-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-167403v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-167403v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shar=
d-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-167403v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-10/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-167403v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/sha=
rd-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-2/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-167403v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-167403v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-4/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-167403v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-167403v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</=
a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-rend=
er:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">In=
tel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-167403v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-off=
screen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
167403v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-sh=
rfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@kms_shar=
pness_filter@invalid-filter-with-nearest-neighbor.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1674=
03v1/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-nearest-neig=
hbor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_eudeb=
ug_online@writes-caching-sram-bb-sram-target-sram.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1674=
03v1/shard-bmg-10/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-=
sram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_exec_=
multi_queue@max-queues-dyn-priority-smem.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-=
bmg-10/igt@xe_exec_multi_queue@max-queues-dyn-priority-smem.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel=
 XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_page_=
reclaim@boundary-split.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-10/igt@xe_page=
_reclaim@boundary-split.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb/shard-bmg-2/igt@xe_pxp@p=
xp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167403v1/shard-bmg-10/igt@=
xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417=
</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb -&gt; xe-pw-167=
403v1</li>
</ul>
<p>IGT_8939: 8939<br />
  xe-5138-11a8456527f00d86dc8b23035c324da194fbbadb: 11a8456527f00d86dc8b230=
35c324da194fbbadb<br />
  xe-pw-167403v1: 167403v1</p>

</body>
</html>

--===============9156547733041655675==--
