Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07C5C55167
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 04:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E44E10E169;
	Fri, 31 Jul 2026 04:16:32 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C29710E164;
 Fri, 31 Jul 2026 04:16:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3907458352480239319=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Prioritize_BO_ev?=
 =?utf-8?q?iction_based_on_VM_exec_queue_priority_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jul 2026 04:16:31 -0000
Message-ID: <178547139149.7464.5235958610883675378@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260731022439.2446486-1-matthew.brost@intel.com>
In-Reply-To: <20260731022439.2446486-1-matthew.brost@intel.com>
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

--===============3907458352480239319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Prioritize BO eviction based on VM exec queue priority (rev5)
URL   : https://patchwork.freedesktop.org/series/170454/
State : success

== Summary ==

CI Bug Log - changes from xe-5511-374d957e1908042c257b8c239974317bb93b83dc_FULL -> xe-pw-170454v5_FULL
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

  Here are the changes found in xe-pw-170454v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - shard-bmg:          [PASS][1] -> [SKIP][2] ([Intel XE#2134])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@fbdev@write.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@fbdev@write.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1407]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1124])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#7679])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#367]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2887]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#3432])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#3432])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2252]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7358])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#7358])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#373]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#3304] / [Intel XE#7374])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#7642])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][19] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-10/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2320]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1424])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#309] / [Intel XE#7343]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#4354] / [Intel XE#5870])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#8680])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1421]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7178] / [Intel XE#7351])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#7178] / [Intel XE#7351])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2311]) +18 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7905]) +9 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#6312])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#4141]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1469] / [Intel XE#7399])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#7061]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#7399])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2313]) +13 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2352] / [Intel XE#7399])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#7865]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#656] / [Intel XE#7905]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7061]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#8303]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7283])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1131])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#8710] / [Intel XE#8714])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_pm_rpm@legacy-planes-dpms.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2893] / [Intel XE#7304])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1489]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1406])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1406] / [Intel XE#7345])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1406] / [Intel XE#4609])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-10/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2509] / [Intel XE#7437])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_evict@evict-cm-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#6540] / [Intel XE#688])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_evict@evict-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#8370])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_evict@evict-small-multi-queue.html

  * igt@xe_exec_balancer@once-cm-parallel-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#7482]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_exec_balancer@once-cm-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1392]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#8374]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#8374]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#8364]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#8364]) +10 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@multi-queue-cancel:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#8369])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_exec_reset@multi-queue-cancel.html

  * igt@xe_exec_system_allocator@threads-many-large-new:
    - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#8714]) +315 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-large-new.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-large-new.html

  * igt@xe_exec_threads@threads-fd-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#8714]) +23 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#8378]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#8378]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:
    - shard-bmg:          [PASS][70] -> [ABORT][71] ([Intel XE#8007]) +1 other test abort
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [PASS][72] -> [FAIL][73] ([Intel XE#8714])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@xe_module_load@reload.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_module_load@reload.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#6964])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2284] / [Intel XE#7370])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#944])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#3342])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@default-enabled-fair-scheduling:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#8339])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_sriov_scheduling@default-enabled-fair-scheduling.html

  
#### Possible fixes ####

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][80] ([Intel XE#2134]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@fbdev@nullptr.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@fbdev@nullptr.html

  * igt@kms_async_flips@test-time-stamp-atomic:
    - shard-lnl:          [INCOMPLETE][82] ([Intel XE#8606]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-lnl-8/igt@kms_async_flips@test-time-stamp-atomic.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_async_flips@test-time-stamp-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][84] ([Intel XE#301]) -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][86] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:
    - shard-bmg:          [INCOMPLETE][88] ([Intel XE#1727] / [Intel XE#6819]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@xe_configfs@engines-allowed-invalid:
    - shard-bmg:          [ABORT][90] ([Intel XE#8007]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-4/igt@xe_configfs@engines-allowed-invalid.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_configfs@engines-allowed-invalid.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [FAIL][92] ([Intel XE#8578]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-8/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_system_allocator@process-many-large-malloc-race:
    - shard-bmg:          [SKIP][94] ([Intel XE#8714]) -> [PASS][95] +330 other tests pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-malloc-race.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-malloc-race.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [SKIP][96] ([Intel XE#2229]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          [SKIP][98] ([Intel XE#8714]) -> [SKIP][99] ([Intel XE#2327]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][100] ([Intel XE#2327]) -> [SKIP][101] ([Intel XE#8714]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-bmg:          [SKIP][102] ([Intel XE#8714]) -> [SKIP][103] ([Intel XE#1124]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][104] ([Intel XE#1124]) -> [SKIP][105] ([Intel XE#8714]) +5 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][106] ([Intel XE#8714]) -> [SKIP][107] ([Intel XE#7679])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][108] ([Intel XE#7679]) -> [SKIP][109] ([Intel XE#8714])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][110] ([Intel XE#367]) -> [SKIP][111] ([Intel XE#8714]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][112] ([Intel XE#8714]) -> [SKIP][113] ([Intel XE#367])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][114] ([Intel XE#8714]) -> [SKIP][115] ([Intel XE#3432])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][116] ([Intel XE#2887]) -> [SKIP][117] ([Intel XE#8714]) +4 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][118] ([Intel XE#8714]) -> [SKIP][119] ([Intel XE#2887]) +8 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][120] ([Intel XE#2652]) -> [SKIP][121] ([Intel XE#8714])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][122] ([Intel XE#2724] / [Intel XE#7449]) -> [SKIP][123] ([Intel XE#8714])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][124] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][125] ([Intel XE#8714]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][126] ([Intel XE#8714]) -> [SKIP][127] ([Intel XE#2325] / [Intel XE#7358])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_chamelium_color@degamma.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-bmg:          [SKIP][128] ([Intel XE#2252]) -> [SKIP][129] ([Intel XE#8714]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          [SKIP][130] ([Intel XE#8714]) -> [SKIP][131] ([Intel XE#2252]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-storm.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-bmg:          [SKIP][132] ([Intel XE#8714]) -> [FAIL][133] ([Intel XE#3304] / [Intel XE#7374])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][134] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][135] ([Intel XE#8714])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-0.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][136] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][137] ([Intel XE#8714])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_content_protection@srm.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][138] ([Intel XE#7642]) -> [SKIP][139] ([Intel XE#8714])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_content_protection@type1.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          [SKIP][140] ([Intel XE#8714]) -> [SKIP][141] ([Intel XE#2321] / [Intel XE#7355])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][142] ([Intel XE#8714]) -> [SKIP][143] ([Intel XE#2320]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][144] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][145] ([Intel XE#8714])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-bmg:          [SKIP][146] ([Intel XE#2320]) -> [SKIP][147] ([Intel XE#8714])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][148] ([Intel XE#4331] / [Intel XE#7227]) -> [SKIP][149] ([Intel XE#8714])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-bmg:          [SKIP][150] ([Intel XE#8265]) -> [SKIP][151] ([Intel XE#8714]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-bmg:          [SKIP][152] ([Intel XE#8714]) -> [SKIP][153] ([Intel XE#8265])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][154] ([Intel XE#8714]) -> [SKIP][155] ([Intel XE#2374] / [Intel XE#6127])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_feature_discovery@psr1.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][156] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][157] ([Intel XE#8714])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][158] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][159] ([Intel XE#8714]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-bmg:          [SKIP][160] ([Intel XE#8714]) -> [SKIP][161] ([Intel XE#7179])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][162] ([Intel XE#8714]) -> [SKIP][163] ([Intel XE#7178] / [Intel XE#7351])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][164] ([Intel XE#2311]) -> [SKIP][165] ([Intel XE#8714]) +30 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][166] ([Intel XE#8714]) -> [SKIP][167] ([Intel XE#2311]) +28 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-shrfb-msflip-blt.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][168] ([Intel XE#8714]) -> [SKIP][169] ([Intel XE#4141]) +10 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][170] ([Intel XE#4141]) -> [SKIP][171] ([Intel XE#8714]) +3 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][172] ([Intel XE#2313]) -> [SKIP][173] ([Intel XE#8714]) +26 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][174] ([Intel XE#8714]) -> [SKIP][175] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][176] ([Intel XE#7061]) -> [SKIP][177] ([Intel XE#8714]) +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][178] ([Intel XE#8714]) -> [SKIP][179] ([Intel XE#7061]) +4 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][180] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][181] ([Intel XE#8714]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][182] ([Intel XE#8714]) -> [SKIP][183] ([Intel XE#2313]) +25 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][184] ([Intel XE#8714]) -> [SKIP][185] ([Intel XE#6901]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][186] ([Intel XE#8714]) -> [SKIP][187] ([Intel XE#7283]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - shard-bmg:          [SKIP][188] ([Intel XE#7283]) -> [SKIP][189] ([Intel XE#8714]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][190] ([Intel XE#8714]) -> [SKIP][191] ([Intel XE#2393])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][192] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][193] ([Intel XE#8714])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][194] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][195] ([Intel XE#8714])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-bmg:          [SKIP][196] ([Intel XE#8714]) -> [SKIP][197] ([Intel XE#6927])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][198] ([Intel XE#8714]) -> [SKIP][199] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][200] ([Intel XE#1489]) -> [SKIP][201] ([Intel XE#8714]) +3 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][202] ([Intel XE#8714]) -> [SKIP][203] ([Intel XE#1489]) +2 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][204] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][205] ([Intel XE#8714])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][206] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][207] ([Intel XE#8714]) +4 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-bmg:          [SKIP][208] ([Intel XE#8714]) -> [SKIP][209] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_psr@psr2-primary-page-flip.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][210] ([Intel XE#2234]) -> [SKIP][211] ([Intel XE#8714])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_psr@psr2-primary-render.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][212] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][213] ([Intel XE#8714])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-90.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][214] ([Intel XE#8714]) -> [SKIP][215] ([Intel XE#6503])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_sharpness_filter@filter-basic.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-bmg:          [SKIP][216] ([Intel XE#6503]) -> [SKIP][217] ([Intel XE#8714]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaler.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][218] ([Intel XE#1499]) -> [SKIP][219] ([Intel XE#8714])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_vrr@flip-dpms.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          [SKIP][220] ([Intel XE#8714]) -> [SKIP][221] ([Intel XE#8397])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_vrr@lobf-dc3co.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_vrr@lobf-dc3co.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][222] ([Intel XE#8714]) -> [SKIP][223] ([Intel XE#1499])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          [SKIP][224] ([Intel XE#6599]) -> [SKIP][225] ([Intel XE#8714])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_compute@ccs-mode-compute-kernel.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-bmg:          [SKIP][226] ([Intel XE#8608]) -> [SKIP][227] ([Intel XE#8714])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@xe_cw_post_sync@walker-post-sync.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][228] ([Intel XE#6321] / [Intel XE#8355]) -> [SKIP][229] ([Intel XE#8714])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          [SKIP][230] ([Intel XE#8714]) -> [SKIP][231] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-bmg:          [SKIP][232] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][233] ([Intel XE#8714]) +3 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-null.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          [SKIP][234] ([Intel XE#8714]) -> [SKIP][235] ([Intel XE#8374]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          [SKIP][236] ([Intel XE#8374]) -> [SKIP][237] ([Intel XE#8714]) +5 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@many-execs-close-fd-smem:
    - shard-bmg:          [SKIP][238] ([Intel XE#8364]) -> [SKIP][239] ([Intel XE#8714]) +12 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-close-fd-smem.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_exec_multi_queue@many-execs-close-fd-smem.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority-smem:
    - shard-bmg:          [SKIP][240] ([Intel XE#8714]) -> [SKIP][241] ([Intel XE#8364]) +15 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority-smem.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          [SKIP][242] ([Intel XE#8714]) -> [SKIP][243] ([Intel XE#8369])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
    - shard-bmg:          [SKIP][244] ([Intel XE#8369]) -> [SKIP][245] ([Intel XE#8714]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          [SKIP][246] ([Intel XE#8714]) -> [INCOMPLETE][247] ([Intel XE#7098] / [Intel XE#8159])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-bmg:          [SKIP][248] ([Intel XE#8378]) -> [SKIP][249] ([Intel XE#8714]) +4 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          [SKIP][250] ([Intel XE#8714]) -> [SKIP][251] ([Intel XE#8378]) +5 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
    - shard-bmg:          [SKIP][252] ([Intel XE#6964] / [Intel XE#8714]) -> [SKIP][253] ([Intel XE#6964]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          [SKIP][254] ([Intel XE#8714]) -> [SKIP][255] ([Intel XE#7793])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_page_reclaim@basic-mixed.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          [SKIP][256] ([Intel XE#8714]) -> [SKIP][257] ([Intel XE#7590])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_pat@xa-app-transient-media-off.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][258] ([Intel XE#5694] / [Intel XE#7370]) -> [SKIP][259] ([Intel XE#8714])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_pm@d3cold-i2c.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          [SKIP][260] ([Intel XE#8714]) -> [SKIP][261] ([Intel XE#4733] / [Intel XE#7417])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_pxp@display-black-pxp-fb.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][262] ([Intel XE#8714]) -> [SKIP][263] ([Intel XE#944]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          [SKIP][264] ([Intel XE#944]) -> [SKIP][265] ([Intel XE#8714])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
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
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8606]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8606
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710
  [Intel XE#8714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5511-374d957e1908042c257b8c239974317bb93b83dc -> xe-pw-170454v5

  IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5511-374d957e1908042c257b8c239974317bb93b83dc: 374d957e1908042c257b8c239974317bb93b83dc
  xe-pw-170454v5: 170454v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/index.html

--===============3907458352480239319==
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
<tr><td><b>Series:</b></td><td>drm/xe: Prioritize BO eviction based on VM exec queue priority (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170454/">https://patchwork.freedesktop.org/series/170454/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5511-374d957e1908042c257b8c239974317bb93b83dc_FULL -&gt; xe-pw-170454v5_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-170454v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-10/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710">Intel XE#8710</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-10/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_evict@evict-cm-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_evict@evict-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_exec_balancer@once-cm-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_exec_reset@multi-queue-cancel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-large-new.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-large-new.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +315 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_mmio_probe_early.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@xe_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@default-enabled-fair-scheduling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@xe_sriov_scheduling@default-enabled-fair-scheduling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-lnl-8/igt@kms_async_flips@test-time-stamp-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8606">Intel XE#8606</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-2/igt@kms_async_flips@test-time-stamp-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_configfs@engines-allowed-invalid:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-4/igt@xe_configfs@engines-allowed-invalid.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-5/igt@xe_configfs@engines-allowed-invalid.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-8/igt@xe_exec_fault_mode@atomic-many.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-malloc-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-malloc-race.html">PASS</a> +330 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_content_protection@atomic-dpms-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127">Intel XE#6127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927">Intel XE#6927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaler.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaler.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_vrr@lobf-dc3co.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_vrr@lobf-dc3co.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">Intel XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_exec_multi_queue@many-execs-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-conflict:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-6/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5511-374d957e1908042c257b8c239974317bb93b83dc/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170454v5/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5511-374d957e1908042c257b8c239974317bb93b83dc -&gt; xe-pw-170454v5</li>
</ul>
<p>IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5511-374d957e1908042c257b8c239974317bb93b83dc: 374d957e1908042c257b8c239974317bb93b83dc<br />
  xe-pw-170454v5: 170454v5</p>

</body>
</html>

--===============3907458352480239319==--
