Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B54C43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:57:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF1D10E529;
	Tue,  7 Jul 2026 22:57:39 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C93A10E529;
 Tue,  7 Jul 2026 22:57:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0588673520632893185=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/nvl/guc=3A_Add_NVL_?=
 =?utf-8?q?GuC_firmware_definitions_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Jul 2026 22:57:38 -0000
Message-ID: <178346505856.163327.10288546076458026954@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260707192547.50535-8-julia.filipchuk@intel.com>
In-Reply-To: <20260707192547.50535-8-julia.filipchuk@intel.com>
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

--===============0588673520632893185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/nvl/guc: Add NVL GuC firmware definitions (rev2)
URL   : https://patchwork.freedesktop.org/series/169961/
State : success

== Summary ==

CI Bug Log - changes from xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca_FULL -> xe-pw-169961v2_FULL
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

  Here are the changes found in xe-pw-169961v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#3718] / [Intel XE#6078])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#6078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2370])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2327]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +5 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#7679])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#367]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#2887])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2887]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#306] / [Intel XE#7358])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2252]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#373])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#7642])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2320]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1424])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#7571])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#8265]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2374] / [Intel XE#6128])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][24] -> [FAIL][25] ([Intel XE#3321]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#301])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7178] / [Intel XE#7349])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2311]) +25 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#4141]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#6312] / [Intel XE#651])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7905]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7399])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#656] / [Intel XE#7905]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2313]) +29 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#7865]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7061]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7591])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#8303]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7283]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2393])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@pr:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#8395]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation@pr.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#8396])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation@psr2.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#1489]) +4 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1128] / [Intel XE#7413])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2330] / [Intel XE#5813])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_sharpness_filter@filter-strength:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#6503])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_sharpness_filter@filter-strength.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1499]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_vrr@max-min.html

  * igt@xe_evict@evict-beng-small:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#6540] / [Intel XE#688])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-mixed-threads-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#8370])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@xe_evict@evict-mixed-threads-small-multi-queue.html

  * igt@xe_exec_balancer@many-cm-parallel-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#7482])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@xe_exec_balancer@many-cm-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#8374]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-queues-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#8364]) +9 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@xe_exec_multi_queue@many-queues-priority-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#8364])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-bmg:          [PASS][60] -> [FAIL][61] ([Intel XE#7850])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-2/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-5/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#8378]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue:
    - shard-bmg:          [PASS][63] -> [ABORT][64] ([Intel XE#8007]) +1 other test abort
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#7793]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#5694] / [Intel XE#7370])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@xe_pm@d3cold-i2c.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#7599])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4733] / [Intel XE#7417])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#944])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#944]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#4130] / [Intel XE#7366])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@xe_sriov_auto_provisioning@fair-allocation.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][72] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:
    - shard-bmg:          [FAIL][74] ([Intel XE#6078]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][76] ([Intel XE#301]) -> [PASS][77] +1 other test pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][78] ([Intel XE#1503]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:
    - shard-bmg:          [FAIL][80] ([Intel XE#7850]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-6/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-bmg:          [ABORT][82] ([Intel XE#8007]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  
#### Warnings ####

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-lnl:          [SKIP][84] ([Intel XE#373]) -> [ABORT][85] ([Intel XE#8007])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-lnl-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][86] ([Intel XE#3544]) -> [SKIP][87] ([Intel XE#3374] / [Intel XE#3544])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca -> xe-pw-169961v2

  IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca: 9834589b7c4190e4f600c20d80c4640aff8043ca
  xe-pw-169961v2: 169961v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/index.html

--===============0588673520632893185==
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
<tr><td><b>Series:</b></td><td>drm/xe/nvl/guc: Add NVL GuC firmware definitions (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169961/">https://patchwork.freedesktop.org/series/169961/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca_FULL -&gt; xe-pw-169961v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169961v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_content_protection@lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128">Intel XE#6128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@pr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation@pr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_sharpness_filter@filter-strength.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@xe_evict@evict-mixed-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@xe_exec_balancer@many-cm-parallel-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@xe_exec_multi_queue@many-queues-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-2/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-5/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@xe_prefetch_fault@prefetch-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-5/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-6/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@xe_exec_reset@long-spin-sys-reuse-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-lnl-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169961v2/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca -&gt; xe-pw-169961v2</li>
</ul>
<p>IGT_8991: c5721520bb6611ab8fcbe27db0c120b72d25b99e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5360-9834589b7c4190e4f600c20d80c4640aff8043ca: 9834589b7c4190e4f600c20d80c4640aff8043ca<br />
  xe-pw-169961v2: 169961v2</p>

</body>
</html>

--===============0588673520632893185==--
