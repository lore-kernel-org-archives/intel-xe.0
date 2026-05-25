Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C14CD5BD0
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 13:05:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5580010E31B;
	Mon, 25 May 2026 13:05:38 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE9A10E318;
 Mon, 25 May 2026 13:05:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5412351342412248150=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Migrate_on_fault_for_devic?=
 =?utf-8?q?e_pages_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: mpenttil@redhat.com
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 May 2026 13:05:37 -0000
Message-ID: <177971433723.5829.2682386588475691245@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260525084524.139868-1-mpenttil@redhat.com>
In-Reply-To: <20260525084524.139868-1-mpenttil@redhat.com>
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

--===============5412351342412248150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Migrate on fault for device pages (rev4)
URL   : https://patchwork.freedesktop.org/series/165953/
State : failure

== Summary ==

CI Bug Log - changes from xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03_FULL -> xe-pw-165953v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-165953v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-165953v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-165953v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html

  
Known issues
------------

  Here are the changes found in xe-pw-165953v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][3] -> [ABORT][4] ([Intel XE#5545] / [Intel XE#6652] / [Intel XE#7814]) +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#6078])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1467] / [Intel XE#7367])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#7679])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#7676])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#367])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#3432])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#3432])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +6 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#4416] / [Intel XE#7381]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2325] / [Intel XE#7358])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#373]) +4 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2252])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#307] / [Intel XE#6974])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@type1:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#7642]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2321] / [Intel XE#7355])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1424]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#4354] / [Intel XE#7386])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#4294] / [Intel XE#7477])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#1138] / [Intel XE#7344])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1421]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#301] / [Intel XE#3149])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7178] / [Intel XE#7349])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#352]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7905]) +22 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7061])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4141]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#656] / [Intel XE#7905]) +18 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#6312] / [Intel XE#651]) +6 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2311]) +15 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#6312]) +9 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7061]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2313]) +14 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#7865]) +14 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1470])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#7915]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-2/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7283])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7283]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#5020] / [Intel XE#7348])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][55] -> [FAIL][56] ([Intel XE#8165])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-9/igt@kms_pm_rpm@i2c.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-10/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@package-g7:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#6813])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#4608])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#4608] / [Intel XE#7304])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1489]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#1406] / [Intel XE#7345])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1406] / [Intel XE#4609])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1406]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_psr@psr-suspend.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#3904] / [Intel XE#7342])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2426] / [Intel XE#5848])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#5191] / [Intel XE#7316] / [Intel XE#7346])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#7636]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#7636]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#4518] / [Intel XE#7404])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#6540] / [Intel XE#688]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#7482]) +9 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1392]) +4 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2322] / [Intel XE#7372])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#7136]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_exec_fault_mode@many-multi-queue-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#7136]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#6874]) +14 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#6874]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#7866])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#6196])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html

  * igt@xe_exec_system_allocator@twice-mmap-free-madvise:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#6703]) +72 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#7138]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#7138]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@xe_mmap@pci-membarrier.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#6964]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#6964]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#7590] / [Intel XE#7772]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2284] / [Intel XE#7370])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3hot-i2c:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7456])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#584] / [Intel XE#7369])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#4733] / [Intel XE#7417])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#944]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#944])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_vram@vf-access-after-resize-up:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_sriov_vram@vf-access-after-resize-up.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [PASS][102] -> [ABORT][103] ([Intel XE#8007])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-9/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:
    - shard-bmg:          [FAIL][104] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html

  * igt@kms_color@ctm-0-50:
    - shard-bmg:          [ABORT][106] ([Intel XE#5545] / [Intel XE#7814]) -> [PASS][107] +1 other test pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-2/igt@kms_color@ctm-0-50.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_color@ctm-0-50.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][108] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][109] +1 other test pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][110] ([Intel XE#301]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][112] ([Intel XE#7915]) -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][114] ([Intel XE#6321]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          [SKIP][116] ([Intel XE#1124]) -> [SKIP][117] ([Intel XE#6703])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][118] ([Intel XE#2887]) -> [SKIP][119] ([Intel XE#6703])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][120] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][121] ([Intel XE#6703])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_chamelium_color@degamma.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-bmg:          [SKIP][122] ([Intel XE#2252]) -> [SKIP][123] ([Intel XE#6703])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          [SKIP][124] ([Intel XE#2320]) -> [SKIP][125] ([Intel XE#6703])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][126] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][127] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][128] ([Intel XE#301]) -> [FAIL][129] ([Intel XE#301] / [Intel XE#3149])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][130] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][131] ([Intel XE#6703])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][132] ([Intel XE#2311]) -> [SKIP][133] ([Intel XE#6703]) +3 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][134] ([Intel XE#2313]) -> [SKIP][135] ([Intel XE#6703]) +4 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-bmg:          [SKIP][136] ([Intel XE#1489]) -> [SKIP][137] ([Intel XE#6703])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr@pr-basic:
    - shard-bmg:          [SKIP][138] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][139] ([Intel XE#6703])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_psr@pr-basic.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_psr@pr-basic.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][140] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][141] ([Intel XE#6703])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][142] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][143] ([Intel XE#1729] / [Intel XE#7424])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][144] ([Intel XE#2168] / [Intel XE#7444]) -> [SKIP][145] ([Intel XE#6703])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_vrr@lobf.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_vrr@lobf.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          [SKIP][146] ([Intel XE#7636]) -> [SKIP][147] ([Intel XE#6703]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][148] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][149] ([Intel XE#6703])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          [SKIP][150] ([Intel XE#7136]) -> [SKIP][151] ([Intel XE#6703]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-priority:
    - shard-bmg:          [SKIP][152] ([Intel XE#6874]) -> [SKIP][153] ([Intel XE#6703]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@xe_exec_multi_queue@many-execs-priority.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-priority.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:
    - shard-bmg:          [SKIP][154] ([Intel XE#7138]) -> [SKIP][155] ([Intel XE#6703])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          [SKIP][156] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][157] ([Intel XE#6703])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@xe_pxp@display-pxp-fb.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7316
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7346
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7381]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7381
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7404]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7404
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456
  [Intel XE#7477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7477
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7676
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772
  [Intel XE#7814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8165]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8165
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03 -> xe-pw-165953v4

  IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03: a79fb6644b307c0ced7b8fe967cdcac8ea884e03
  xe-pw-165953v4: 165953v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/index.html

--===============5412351342412248150==
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
<tr><td><b>Series:</b></td><td>Migrate on fault for device pages (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165953/">https://patchwork.freedesktop.org/series/165953/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03_FULL -&gt; xe-pw-165953v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-165953v4_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-165953v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-165953v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_setmaster@master-drop-set-user:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165953v4_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814">Intel XE#7814</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7676">Intel XE#7676</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416">Intel XE#4416</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7381">Intel XE#7381</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7477">Intel XE#7477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-2/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-9/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-10/igt@kms_pm_rpm@i2c.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8165">Intel XE#8165</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813">Intel XE#6813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-move@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191">Intel XE#5191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7316">Intel XE#7316</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7346">Intel XE#7346</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7404">Intel XE#7404</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_exec_fault_mode@many-multi-queue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_exec_reset@multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +72 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@xe_mmap@pci-membarrier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322">Intel XE#7322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-conflict:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772">Intel XE#7772</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-2/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456">Intel XE#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_pm_residency@cpg-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-3/igt@xe_sriov_vram@vf-access-after-resize-up.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-9/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-2/igt@kms_color@ctm-0-50.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814">Intel XE#7814</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-8/igt@kms_color@ctm-0-50.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Intel XE#7444</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@xe_exec_multi_queue@many-execs-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03/shard-bmg-7/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165953v4/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03 -&gt; xe-pw-165953v4</li>
</ul>
<p>IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5121-a79fb6644b307c0ced7b8fe967cdcac8ea884e03: a79fb6644b307c0ced7b8fe967cdcac8ea884e03<br />
  xe-pw-165953v4: 165953v4</p>

</body>
</html>

--===============5412351342412248150==--
