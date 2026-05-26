Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A32CD5BD1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 09:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFE210E484;
	Tue, 26 May 2026 09:03:34 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E35610E479;
 Tue, 26 May 2026 09:03:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6390901878097535148=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Fix_Adaptive-Sync_SDP_for_?=
 =?utf-8?q?PR_with_Link_ON_+_Auxless-ALPM_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 May 2026 09:03:32 -0000
Message-ID: <177978621243.9517.13363539883991079218@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260525052235.560741-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260525052235.560741-1-ankit.k.nautiyal@intel.com>
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

--===============6390901878097535148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix Adaptive-Sync SDP for PR with Link ON + Auxless-ALPM (rev5)
URL   : https://patchwork.freedesktop.org/series/164513/
State : success

== Summary ==

CI Bug Log - changes from xe-5127-6b6931ea69504481efd3df1cc99765141feb178c_FULL -> xe-pw-164513v5_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-5127-6b6931ea69504481efd3df1cc99765141feb178c_FULL and xe-pw-164513v5_FULL:

### New IGT tests (1) ###

  * igt@kms_flip_tiling:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in xe-pw-164513v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2327])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1407]) +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#7679])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#367]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +5 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#306] / [Intel XE#7358])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#373])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2252]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@atomic:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#7642])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2320])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#2321] / [Intel XE#7355])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1424])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1508])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2244])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2244])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1421]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][22] -> [FAIL][23] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#301]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7178] / [Intel XE#7349])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7178] / [Intel XE#7351])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2311]) +18 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7061])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#4141]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#6312] / [Intel XE#651]) +4 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#656] / [Intel XE#7905]) +11 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#6312]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7905]) +13 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#7061])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2313]) +14 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#7865]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#7915]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#6911] / [Intel XE#7378])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7283])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7283])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7130]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#1489]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#4608])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#4608] / [Intel XE#7304])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1406] / [Intel XE#7345])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-dpms@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1406] / [Intel XE#4609])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_psr@fbc-psr2-dpms@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#3904] / [Intel XE#7342])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#6503])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@xe_eudebug@basic-client:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#7636]) +5 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_eudebug@basic-client.html

  * igt@xe_eudebug@vma-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#7636]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_eudebug@vma-ufence.html

  * igt@xe_evict@evict-cm-threads-small-multi-queue:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_evict@evict-cm-threads-small-multi-queue.html

  * igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#7482]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_exec_balancer@many-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1392]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2322] / [Intel XE#7372])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#7136]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#7136]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#6874]) +9 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#6874]) +9 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html

  * igt@xe_exec_reset@multi-queue-cancel:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#7866])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_exec_reset@multi-queue-cancel.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][67] ([Intel XE#7098] / [Intel XE#8159])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#6196])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset:
    - shard-lnl:          NOTRUN -> [ABORT][69] ([Intel XE#8007])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-2/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#7138]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7138]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate.html

  * igt@xe_madvise@atomic-cpu:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#7980])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_madvise@atomic-cpu.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97]) -> ([PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [SKIP][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122]) ([Intel XE#378] / [Intel XE#7405])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-1/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-8/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-5/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-2/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-7/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-7/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-4/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-4/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-4/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-2/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-8/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-8/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-6/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-8/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-2/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-7/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-5/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-5/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-7/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-1/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-1/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-3/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-3/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-3/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-3/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-2/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-8/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-8/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-3/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-6/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-8/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-8/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-3/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-2/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-7/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-7/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-7/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-7/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-1/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-4/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-1/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-1/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-4/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-1/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-4/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-coherency-basic:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#6964])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_multigpu_svm@mgpu-coherency-basic.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#7793])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_page_reclaim@prl-invalidate-full:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#7793])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_page_reclaim@prl-invalidate-full.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#7590])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#5694] / [Intel XE#7370])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-5/igt@xe_pm@d3cold-i2c.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#7599])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#944]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#944])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_vfio@open-basic:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#7724])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_sriov_vfio@open-basic.html

  * igt@xe_vm@overcommit-nonfault-vram-no-lr:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#7892])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_vm@overcommit-nonfault-vram-no-lr.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-bmg:          [SKIP][134] ([Intel XE#6779]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@unused-pitches:
    - shard-bmg:          [SKIP][136] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_addfb_basic@unused-pitches.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_addfb_basic@unused-pitches.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][138] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-3:
    - shard-bmg:          [FAIL][140] ([Intel XE#6078]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-3.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-3.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][142] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [ABORT][144] ([Intel XE#2625]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][146] ([Intel XE#7915]) -> [PASS][147] +1 other test pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-3/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-9/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-bmg:          [ABORT][148] ([Intel XE#5545] / [Intel XE#7774] / [Intel XE#7814] / [Intel XE#7960]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_plane_lowres@tiling-4.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-4@pipe-a-dp-2:
    - shard-bmg:          [ABORT][150] ([Intel XE#5545] / [Intel XE#7774] / [Intel XE#7814]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_plane_lowres@tiling-4@pipe-a-dp-2.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_plane_lowres@tiling-4@pipe-a-dp-2.html

  * igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-3:
    - shard-bmg:          [FAIL][152] ([Intel XE#8018]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-3.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-3.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new:
    - shard-bmg:          [SKIP][154] ([Intel XE#6703]) -> [PASS][155] +81 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new.html

  * igt@xe_exec_system_allocator@process-many-stride-malloc-multi-fault:
    - shard-bmg:          [DMESG-WARN][156] ([Intel XE#7774]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_exec_system_allocator@process-many-stride-malloc-multi-fault.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@xe_exec_system_allocator@process-many-stride-malloc-multi-fault.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [ABORT][158] ([Intel XE#8007]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][160] ([Intel XE#6703]) -> [SKIP][161] ([Intel XE#2327])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          [SKIP][162] ([Intel XE#6703]) -> [SKIP][163] ([Intel XE#1124]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][164] ([Intel XE#6703]) -> [SKIP][165] ([Intel XE#2887]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          [SKIP][166] ([Intel XE#6703]) -> [SKIP][167] ([Intel XE#2252])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          [SKIP][168] ([Intel XE#6703]) -> [SKIP][169] ([Intel XE#7178] / [Intel XE#7351])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][170] ([Intel XE#6703]) -> [SKIP][171] ([Intel XE#2311]) +6 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][172] ([Intel XE#6703]) -> [SKIP][173] ([Intel XE#4141])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][174] ([Intel XE#6703]) -> [SKIP][175] ([Intel XE#7061])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][176] ([Intel XE#6703]) -> [SKIP][177] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][178] ([Intel XE#6703]) -> [SKIP][179] ([Intel XE#2313]) +4 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-plflip-blt.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][180] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916]) -> [SKIP][181] ([Intel XE#3544] / [Intel XE#7916])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][182] ([Intel XE#7915]) -> [SKIP][183] ([Intel XE#7916]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-2/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][184] ([Intel XE#6703]) -> [SKIP][185] ([Intel XE#7283])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][186] ([Intel XE#6703]) -> [SKIP][187] ([Intel XE#2234] / [Intel XE#2850])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][188] ([Intel XE#6703]) -> [SKIP][189] ([Intel XE#1435])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][190] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][191] ([Intel XE#1729] / [Intel XE#7424])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][192] ([Intel XE#8183]) -> [SKIP][193] ([Intel XE#2168] / [Intel XE#7444])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_vrr@lobf.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_vrr@lobf.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-bmg:          [SKIP][194] ([Intel XE#6703]) -> [SKIP][195] ([Intel XE#7140])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-priority-cm.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-bmg:          [SKIP][196] ([Intel XE#6703]) -> [SKIP][197] ([Intel XE#2322] / [Intel XE#7372])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-basic.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
    - shard-bmg:          [SKIP][198] ([Intel XE#6703]) -> [SKIP][199] ([Intel XE#7136]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@many-queues-userptr-invalidate:
    - shard-bmg:          [SKIP][200] ([Intel XE#6703]) -> [SKIP][201] ([Intel XE#6874]) +2 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          [SKIP][202] ([Intel XE#6703]) -> [SKIP][203] ([Intel XE#7793])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_page_reclaim@boundary-split.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@xe_page_reclaim@boundary-split.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7724
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7960]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7960
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8018
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8183]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8183
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5127-6b6931ea69504481efd3df1cc99765141feb178c -> xe-pw-164513v5

  IGT_8937: 8937
  xe-5127-6b6931ea69504481efd3df1cc99765141feb178c: 6b6931ea69504481efd3df1cc99765141feb178c
  xe-pw-164513v5: 164513v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/index.html

--===============6390901878097535148==
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
<tr><td><b>Series:</b></td><td>Fix Adaptive-Sync SDP for PR with Link ON + =
Auxless-ALPM (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/164513/">https://patchwork.freedesktop.org/series/164513/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-164513v5/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-164513v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5127-6b6931ea69504481efd3df1cc99765141=
feb178c_FULL -&gt; xe-pw-164513v5_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5127-6b6931ea69504481efd3df1cc=
99765141feb178c_FULL and xe-pw-164513v5_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_flip_tiling:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164513v5_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_big_fb@linear-32bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_bw@connected-linear-tilin=
g-3-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_bw@linear-tiling-1-displa=
ys-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_ccs@random-ccs-data-y-til=
ed-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_chamelium_hpd@dp-hpd-afte=
r-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-stor=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_content_protection@atomic=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_content_protection@atomic=
-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other t=
est fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_cursor_crc@cursor-offscre=
en-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_cursor_crc@cursor-random-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding=
-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_dsc@dsc-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-8/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-8/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE=
#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#73=
51</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
hdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905=
</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-shrfb-draw-blt:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_frontbuffer_tracking@fbch=
dr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +13 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-=
abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-=
argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_frontbuffer_tracking@psrh=
dr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_frontbuffer_tracking@psrh=
dr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_hdr@=
static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@k=
ms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_plane@pixel-format-4-tile=
d-lnl-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_plane@pixel-format-4-tile=
d-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_plane@pixel-format-x-tile=
d-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_pm_backlight@brightness-w=
ith-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2938">Intel XE#2938</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#730=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_psr@fbc-psr2-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_psr@fbc-psr2-dpms@edp-1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_psr@fbc-psr2-sprite-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-5/igt@kms_rotation_crc@sprite-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@kms_sharpness_filter@filter-s=
caler-downscale.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_eudebug@basic-client.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
636">Intel XE#7636</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_eudebug@vma-ufence.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/763=
6">Intel XE#7636</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-queue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_evict@evict-cm-threads-sma=
ll-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_exec_balancer@many-virtual=
-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_exec_basic@multigpu-once-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +5 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_exec_multi_queue@max-queue=
s-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +9 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-fault-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_exec_reset@multi-queue-can=
cel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7866">Intel XE#7866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_exec_system_allocator@many=
-stride-new-prefetch.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vm=
a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-uc-comp-single-vma.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemse=
t:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-2/igt@xe_exec_system_allocator@thre=
ads-many-execqueues-mmap-shared-nomemset.html">ABORT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_exec_threads@threads-multi=
-queue-cm-fd-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_exec_threads@threads-multi=
-queue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-cpu:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_madvise@atomic-cpu.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/798=
0">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">In=
tel XE#586</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7323">Intel XE#7323</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7384">Intel XE#7384</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-l=
nl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/sha=
rd-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb=
178c/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc9976514=
1feb178c/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc997=
65141feb178c/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1c=
c99765141feb178c/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3=
df1cc99765141feb178c/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481=
efd3df1cc99765141feb178c/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea6950=
4481efd3df1cc99765141feb178c/shard-lnl-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea=
69504481efd3df1cc99765141feb178c/shard-lnl-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b69=
31ea69504481efd3df1cc99765141feb178c/shard-lnl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-=
6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-=
lnl-3/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-3/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-164513v5/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-164513v5/shard-lnl-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-6/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-164513v5/shard-lnl-5/igt@xe_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-164513v5/shard-lnl-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-164513v5/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-7/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-164513v5/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-164513v5/shard-lnl-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-164513v5/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-164513v5/shard-lnl-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_multigpu_svm@mgpu-coherenc=
y-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_page_reclaim@invalid-1g.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-invalidate-full:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_page_reclaim@prl-invalidat=
e-full.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_pat@xa-app-transient-media=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_pm@d3cold-basic-exec.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/366">Intel XE#366</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">In=
tel XE#5694</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_prefetch_fault@prefetch-fa=
ult-svm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/igt@xe_query@multigpu-query-inval=
id-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@open-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_sriov_vfio@open-basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7724">Intel XE#7724</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-no-lr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-164513v5/shard-lnl-5/igt@xe_vm@overcommit-nonfault-vra=
m-no-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@core_hot=
unplug@unbind-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6779">Intel XE#6779</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@core_hotun=
plug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-pitches:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_addf=
b_basic@unused-pitches.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-=
1/igt@kms_addfb_basic@unused-pitches.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-6/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6=
078</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
64513v5/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-6/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-3.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE=
#6078</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-164513v5/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@=
pipe-c-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shar=
d-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-suspend.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-7/ig=
t@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-3/igt@kms_hdr@=
static-swap@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard=
-bmg-9/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_plan=
e_lowres@tiling-4.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7814">Intel XE#7814</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7960">Inte=
l XE#7960</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-164513v5/shard-bmg-3/igt@kms_plane_lowres@tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_plan=
e_lowres@tiling-4@pipe-a-dp-2.html">ABORT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814">Intel =
XE#7814</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-164513v5/shard-bmg-3/igt@kms_plane_lowres@tiling-4@pipe-a-dp-2.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_plan=
e_lowres@tiling-4@pipe-a-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8018">Intel XE#8018</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-3/i=
gt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_exec_=
system_allocator@many-large-execqueues-mmap-new.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5=
/shard-bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new.ht=
ml">PASS</a> +81 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-multi-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_exec_=
system_allocator@process-many-stride-malloc-multi-fault.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Int=
el XE#7774</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-164513v5/shard-bmg-1/igt@xe_exec_system_allocator@process-many-stride=
-malloc-multi-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-3/igt@xe_wedge=
d@wedged-mode-toggle.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-lnl-2/igt@xe_wedged=
@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_big_=
fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms=
_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1645=
13v5/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_ccs@=
ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-=
1/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_cham=
elium_audio@hdmi-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms=
_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-=
32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/sh=
ard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311=
">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
64513v5/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v=
5/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5=
/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
164513v5/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-ind=
fb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-8/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5=
/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel =
XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-8/igt@kms_hdr@=
brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5=
/shard-bmg-2/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7916">Intel XE#7916</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_plan=
e@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-164513v5/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modif=
ier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_psr@=
fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_=
psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_setm=
ode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/ig=
t@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-8/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shar=
d-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424"=
>Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8183">Intel XE#8183</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@kms_vrr@lobf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Int=
el XE#2168</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_evict=
@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-=
1/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_exec_=
basic@multigpu-no-exec-basic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@xe=
_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_exec_=
fault_mode@once-multi-queue-userptr-rebind.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shar=
d-bmg-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">In=
tel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_exec_=
multi_queue@many-queues-userptr-invalidate.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shar=
d-bmg-1/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">In=
tel XE#6874</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_page_=
reclaim@boundary-split.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164513v5/shard-bmg-1/igt@xe_page_=
reclaim@boundary-split.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5127-6b6931ea69504481efd3df1cc99765141feb178c -&gt; xe-pw-164=
513v5</li>
</ul>
<p>IGT_8937: 8937<br />
  xe-5127-6b6931ea69504481efd3df1cc99765141feb178c: 6b6931ea69504481efd3df1=
cc99765141feb178c<br />
  xe-pw-164513v5: 164513v5</p>

</body>
</html>

--===============6390901878097535148==--
