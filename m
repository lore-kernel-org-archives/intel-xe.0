Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6F9CD5BCF
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 06:31:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A296B10E496;
	Tue, 26 May 2026 06:31:33 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED99410E1BB;
 Tue, 26 May 2026 06:31:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5167343048060697224=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Introduce_cold_reset_recov?=
 =?utf-8?q?ery_method_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 May 2026 06:31:32 -0000
Message-ID: <177977709296.8228.579698893769736457@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260520113351.171119-7-mallesh.koujalagi@intel.com>
In-Reply-To: <20260520113351.171119-7-mallesh.koujalagi@intel.com>
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

--===============5167343048060697224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce cold reset recovery method (rev6)
URL   : https://patchwork.freedesktop.org/series/163428/
State : failure

== Summary ==

CI Bug Log - changes from xe-5127-6b6931ea69504481efd3df1cc99765141feb178c_FULL -> xe-pw-163428v6_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-163428v6_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-163428v6_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-163428v6_FULL:

### IGT changes ###

#### Warnings ####

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          [FAIL][1] ([Intel XE#7695]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-4/igt@xe_pat@pat-sw-hw-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-5/igt@xe_pat@pat-sw-hw-suspend.html
    - shard-lnl:          [FAIL][3] ([Intel XE#7695]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-3/igt@xe_pat@pat-sw-hw-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-4/igt@xe_pat@pat-sw-hw-suspend.html

  
Known issues
------------

  Here are the changes found in xe-pw-163428v6_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1407]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#7679])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#367]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#2887]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#306] / [Intel XE#7358])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2252]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-4/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#373])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#7642])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2320])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2321] / [Intel XE#7355])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1424])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_edge_walk@256x256-top-edge:
    - shard-bmg:          [PASS][21] -> [FAIL][22] ([Intel XE#6841]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-top-edge.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1508])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2244])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#2244])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1421]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7178] / [Intel XE#7349])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7178] / [Intel XE#7351])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2311]) +18 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7061])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#4141]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#6312]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#6312] / [Intel XE#651]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#656] / [Intel XE#7905]) +11 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2313]) +14 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#7905]) +13 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#7061])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#7865]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#7915]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#6911] / [Intel XE#7378])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7283])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7283])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#7130]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#1489]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#4608])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#4608] / [Intel XE#7304])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1406] / [Intel XE#7345])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-dpms@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1406] / [Intel XE#4609])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_psr@fbc-psr2-dpms@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-bmg:          [PASS][55] -> [ABORT][56] ([Intel XE#7774])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-3/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#3904] / [Intel XE#7342])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#6503])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-3/igt@kms_vrr@flipline.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-4/igt@kms_vrr@flipline.html

  * igt@xe_eudebug@attach-debug-metadata:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#7636]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_eudebug@attach-debug-metadata.html

  * igt@xe_eudebug@basic-client:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#7636]) +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_eudebug@basic-client.html

  * igt@xe_evict@evict-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_evict@evict-threads-small.html

  * igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#7482]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_exec_balancer@many-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2322] / [Intel XE#7372])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1392]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#7136]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race-imm:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#7136]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#6874]) +9 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic-smem:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#6874]) +9 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic-smem.html

  * igt@xe_exec_reset@multi-queue-cancel:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#7866])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_exec_reset@multi-queue-cancel.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][73] ([Intel XE#7098] / [Intel XE#8159])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#6196])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset:
    - shard-lnl:          NOTRUN -> [ABORT][75] ([Intel XE#8007])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-4/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#7138]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#7138]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate.html

  * igt@xe_madvise@atomic-cpu:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#7980])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_madvise@atomic-cpu.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103]) -> ([PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [SKIP][128]) ([Intel XE#378] / [Intel XE#7405])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-1/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-8/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-5/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-2/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-7/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-7/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-4/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-4/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-4/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-2/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-8/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-8/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-6/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-8/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-2/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-7/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-5/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-5/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-7/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-1/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-1/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-3/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-3/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-3/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-8/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-1/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-3/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-3/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-8/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-8/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-3/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-3/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-1/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-2/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-8/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-2/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-1/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-7/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-7/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-2/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-4/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-4/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-7/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-1/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-4/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-coherency-basic:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#6964])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_multigpu_svm@mgpu-coherency-basic.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#7793])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_page_reclaim@prl-invalidate-full:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#7793])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_page_reclaim@prl-invalidate-full.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#7590])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#5694] / [Intel XE#7370])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-4/igt@xe_pm@d3cold-i2c.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#7599])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#944]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#944])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_vfio@open-basic:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#7724])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_sriov_vfio@open-basic.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [PASS][139] -> [DMESG-WARN][140] ([Intel XE#6627] / [Intel XE#7419])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-8/igt@xe_survivability@runtime-survivability.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-10/igt@xe_survivability@runtime-survivability.html

  * igt@xe_vm@overcommit-nonfault-vram-no-lr:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#7892])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_vm@overcommit-nonfault-vram-no-lr.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-bmg:          [SKIP][142] ([Intel XE#6779]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@unused-pitches:
    - shard-bmg:          [SKIP][144] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_addfb_basic@unused-pitches.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_addfb_basic@unused-pitches.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][146] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-3:
    - shard-bmg:          [FAIL][148] ([Intel XE#6078]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-3.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-3.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][150] ([Intel XE#7571]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [ABORT][152] ([Intel XE#2625]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][154] ([Intel XE#6703]) -> [PASS][155] +81 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][156] ([Intel XE#7915]) -> [PASS][157] +1 other test pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-7/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-6/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-bmg:          [ABORT][158] ([Intel XE#5545] / [Intel XE#7774] / [Intel XE#7814] / [Intel XE#7960]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_plane_lowres@tiling-4.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_lowres@tiling-4@pipe-a-dp-2:
    - shard-bmg:          [ABORT][160] ([Intel XE#5545] / [Intel XE#7774] / [Intel XE#7814]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_plane_lowres@tiling-4@pipe-a-dp-2.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_plane_lowres@tiling-4@pipe-a-dp-2.html

  * igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-3:
    - shard-bmg:          [FAIL][162] -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-3.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-3.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][164] ([Intel XE#6321]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@process-many-stride-malloc-multi-fault:
    - shard-bmg:          [DMESG-WARN][166] ([Intel XE#7774]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_exec_system_allocator@process-many-stride-malloc-multi-fault.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@xe_exec_system_allocator@process-many-stride-malloc-multi-fault.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [ABORT][168] ([Intel XE#8007]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][170] ([Intel XE#6703]) -> [SKIP][171] ([Intel XE#2327])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          [SKIP][172] ([Intel XE#6703]) -> [SKIP][173] ([Intel XE#1124]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][174] ([Intel XE#6703]) -> [SKIP][175] ([Intel XE#2887]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          [SKIP][176] ([Intel XE#6703]) -> [SKIP][177] ([Intel XE#2252])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][178] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][179] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          [SKIP][180] ([Intel XE#6703]) -> [SKIP][181] ([Intel XE#7178] / [Intel XE#7351])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][182] ([Intel XE#6703]) -> [SKIP][183] ([Intel XE#2311]) +6 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:
    - shard-bmg:          [SKIP][184] ([Intel XE#6703]) -> [SKIP][185] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][186] ([Intel XE#6703]) -> [SKIP][187] ([Intel XE#4141])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][188] ([Intel XE#6703]) -> [SKIP][189] ([Intel XE#7061])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][190] ([Intel XE#6703]) -> [SKIP][191] ([Intel XE#2313]) +4 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-blt.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][192] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916]) -> [SKIP][193] ([Intel XE#3544] / [Intel XE#7916])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][194] ([Intel XE#7915]) -> [SKIP][195] ([Intel XE#7916]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-10/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][196] ([Intel XE#6703]) -> [SKIP][197] ([Intel XE#7283])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][198] ([Intel XE#6703]) -> [SKIP][199] ([Intel XE#2234] / [Intel XE#2850])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][200] ([Intel XE#6703]) -> [SKIP][201] ([Intel XE#1435])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][202] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][203] ([Intel XE#1729] / [Intel XE#7424])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][204] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][205] ([Intel XE#2426] / [Intel XE#5848])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][206] -> [SKIP][207] ([Intel XE#2168] / [Intel XE#7444])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_vrr@lobf.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_vrr@lobf.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-bmg:          [SKIP][208] ([Intel XE#6703]) -> [SKIP][209] ([Intel XE#7140])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-priority-cm.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-bmg:          [SKIP][210] ([Intel XE#6703]) -> [SKIP][211] ([Intel XE#2322] / [Intel XE#7372])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-basic.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
    - shard-bmg:          [SKIP][212] ([Intel XE#6703]) -> [SKIP][213] ([Intel XE#7136]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@many-queues-userptr-invalidate:
    - shard-bmg:          [SKIP][214] ([Intel XE#6703]) -> [SKIP][215] ([Intel XE#6874]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          [SKIP][216] ([Intel XE#6703]) -> [SKIP][217] ([Intel XE#7793])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_page_reclaim@boundary-split.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@xe_page_reclaim@boundary-split.html

  
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
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
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
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841
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
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
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
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7960]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7960
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5127-6b6931ea69504481efd3df1cc99765141feb178c -> xe-pw-163428v6

  IGT_8937: 8937
  xe-5127-6b6931ea69504481efd3df1cc99765141feb178c: 6b6931ea69504481efd3df1cc99765141feb178c
  xe-pw-163428v6: 163428v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/index.html

--===============5167343048060697224==
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
<tr><td><b>Series:</b></td><td>Introduce cold reset recovery method (rev6)<=
/td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/163428/">https://patchwork.freedesktop.org/series/163428/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-163428v6/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-163428v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5127-6b6931ea69504481efd3df1cc99765141=
feb178c_FULL -&gt; xe-pw-163428v6_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-163428v6_FULL need to be verifie=
d<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-163428v6_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1634=
28v6_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pat@pat-sw-hw-suspend:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-4/igt@xe_pat@p=
at-sw-hw-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-5/igt@xe_pat@pat-sw-=
hw-suspend.html">FAIL</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-3/igt@xe_pat@p=
at-sw-hw-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-4/igt@xe_pat@pat-sw-=
hw-suspend.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163428v6_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_big_fb@x-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_bw@connected-linear-tilin=
g-3-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_bw@linear-tiling-1-displa=
ys-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_ccs@random-ccs-data-y-til=
ed-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-4/igt@kms_chamelium_frames@dp-crc-s=
ingle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_chamelium_hpd@dp-hpd-afte=
r-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_content_protection@atomic=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_content_protection@atomic=
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
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_cursor_crc@cursor-offscre=
en-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_cursor_crc@cursor-random-=
512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding=
-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-3/igt@kms_curs=
or_edge_walk@256x256-top-edge.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-2/igt@kms_cursor_edge=
_walk@256x256-top-edge.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6841">Intel XE#6841</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-=
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
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_dsc@dsc-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
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
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bp=
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
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs=
-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs=
hdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
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
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905=
</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcp=
sr-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-blt:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcp=
srhdr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +13 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_frontbuffer_tracking@hdr-=
abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_frontbuffer_tracking@psrh=
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
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@k=
ms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_plane@pixel-format-4-tile=
d-lnl-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_plane@pixel-format-4-tile=
d-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_plane@pixel-format-x-tile=
d-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_pm_backlight@brightness-w=
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
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
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
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
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
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_psr@fbc-psr2-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_psr@fbc-psr2-dpms@edp-1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_psr@fbc-psr2-sprite-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-3/igt@kms_rota=
tion_crc@multiplane-rotation-cropping-bottom.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-2/ig=
t@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#=
7774</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@kms_rotation_crc@primary-y-ti=
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
/tree/intel-xe/xe-pw-163428v6/shard-bmg-4/igt@kms_rotation_crc@sprite-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_sharpness_filter@filter-s=
caler-downscale.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-3/igt@kms_vrr@=
flipline.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-163428v6/shard-lnl-4/igt@kms_vrr@flipline.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#=
4227</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@attach-debug-metadata:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_eudebug@attach-debug-metad=
ata.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7636">Intel XE#7636</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_eudebug@basic-client.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
636">Intel XE#7636</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_evict@evict-threads-small.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_exec_balancer@many-virtual=
-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_exec_basic@multigpu-once-b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-4/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-ra=
ce-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-1/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr-invalidat=
e:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_exec_multi_queue@many-queu=
es-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +9 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_exec_multi_queue@max-queue=
s-preempt-mode-fault-basic-smem.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +9 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_exec_reset@multi-queue-can=
cel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7866">Intel XE#7866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_exec_system_allocator@many=
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
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-uc-comp-single-vma.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-shared-nomemse=
t:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-4/igt@xe_exec_system_allocator@thre=
ads-many-execqueues-mmap-shared-nomemset.html">ABORT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_exec_threads@threads-multi=
-queue-cm-fd-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_exec_threads@threads-multi=
-queue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-cpu:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_madvise@atomic-cpu.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/798=
0">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_mmap@small-bar.html">SKIP<=
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
el-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-163428v6/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-163428v6/shard-lnl-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-163428v6/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-163428v6/shard-lnl-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-163428v6/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-163428v6/shard-lnl-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-163428v6/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-163428v6/shard-lnl-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-163428v6/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6=
/shard-lnl-5/igt@xe_module_load@load.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_multigpu_svm@mgpu-coherenc=
y-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_page_reclaim@invalid-1g.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-invalidate-full:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_page_reclaim@prl-invalidat=
e-full.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_pat@xa-app-transient-media=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_pm@d3cold-basic-exec.html"=
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
/tree/intel-xe/xe-pw-163428v6/shard-bmg-4/igt@xe_pm@d3cold-i2c.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">In=
tel XE#5694</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_prefetch_fault@prefetch-fa=
ult-svm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@xe_query@multigpu-query-inval=
id-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@open-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_sriov_vfio@open-basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7724">Intel XE#7724</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-8/igt@xe_survi=
vability@runtime-survivability.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-10/igt@xe_survivabil=
ity@runtime-survivability.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-no-lr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-163428v6/shard-lnl-5/igt@xe_vm@overcommit-nonfault-vra=
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
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@core_hotun=
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
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-=
7/igt@kms_addfb_basic@unused-pitches.html">PASS</a></li>
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
63428v6/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.ht=
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
-163428v6/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@=
pipe-c-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-8/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-2/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-suspend.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-1/ig=
t@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#67=
03</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
3428v6/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-f=
ullscreen.html">PASS</a> +81 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-7/igt@kms_hdr@=
static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/=
shard-bmg-6/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html=
">PASS</a> +1 other test pass</li>
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
e-pw-163428v6/shard-bmg-9/igt@kms_plane_lowres@tiling-4.html">PASS</a></li>
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
pw-163428v6/shard-bmg-9/igt@kms_plane_lowres@tiling-4@pipe-a-dp-2.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_plan=
e_lowres@tiling-4@pipe-a-hdmi-a-3.html">FAIL</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-9/igt@kms_plane_l=
owres@tiling-4@pipe-a-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-3/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shar=
d-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
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
xe-pw-163428v6/shard-bmg-7/igt@xe_exec_system_allocator@process-many-stride=
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
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-lnl-4/igt@xe_wedged=
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
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms=
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
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1634=
28v6/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-=
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
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-=
7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=
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
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms=
_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-lnl-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel X=
E#7343</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-163428v6/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
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
-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-=
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
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/sh=
ard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311=
">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shar=
d-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">In=
tel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7356">Intel XE#7356</a>) +1 other test skip</li>
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
63428v6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-=
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
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v=
6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psrhdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
63428v6/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
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
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6=
/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel=
 XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-8/igt@kms_hdr@=
brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1634=
28v6/shard-bmg-10/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161=
616f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7916">Intel XE#7916</a>) +1 other test skip</li>
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
pw-163428v6/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modif=
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
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_=
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
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/ig=
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
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shar=
d-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">In=
tel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-6/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel X=
E#7437</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-163428v6/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@kms_vrr@=
lobf.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-163428v6/shard-bmg-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Int=
el XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5127-6b6931ea69504481efd3df1cc99765141feb178c/shard-bmg-2/igt@xe_evict=
@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-=
7/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href=
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
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@xe=
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
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shar=
d-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html">SKIP</=
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
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shar=
d-bmg-7/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</=
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
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163428v6/shard-bmg-7/igt@xe_page_=
reclaim@boundary-split.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5127-6b6931ea69504481efd3df1cc99765141feb178c -&gt; xe-pw-163=
428v6</li>
</ul>
<p>IGT_8937: 8937<br />
  xe-5127-6b6931ea69504481efd3df1cc99765141feb178c: 6b6931ea69504481efd3df1=
cc99765141feb178c<br />
  xe-pw-163428v6: 163428v6</p>

</body>
</html>

--===============5167343048060697224==--
