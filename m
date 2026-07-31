Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF2DC5516D
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 17:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AB910F36A;
	Fri, 31 Jul 2026 17:39:55 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9DF10F36A;
 Fri, 31 Jul 2026 17:39:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4085490500399652197=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/guc=3A_Compress_GuC?=
 =?utf-8?q?_log_and_CTB_dump_with_zstd_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Jul 2026 17:39:54 -0000
Message-ID: <178551959411.10690.2587979087323796109@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260731155411.496975-1-zhanjun.dong@intel.com>
In-Reply-To: <20260731155411.496975-1-zhanjun.dong@intel.com>
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

--===============4085490500399652197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Compress GuC log and CTB dump with zstd (rev3)
URL   : https://patchwork.freedesktop.org/series/170589/
State : failure

== Summary ==

CI Bug Log - changes from xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a_FULL -> xe-pw-170589v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-170589v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-170589v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-170589v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@kms_pm_rpm@drm-resources-equal.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html

  
Known issues
------------

  Here are the changes found in xe-pw-170589v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@basic:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#8714])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@core_getversion@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@core_getversion@basic.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#2134]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@fbdev@nullptr.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@fbdev@nullptr.html

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#8714]) +658 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@kms_addfb_basic@unused-handle.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1407]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1124])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +6 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#7679])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-7/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7679])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +5 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#3432])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2887])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2652]) +16 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2724] / [Intel XE#7449])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2325] / [Intel XE#7358]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#373]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-5/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2252]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][25] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7642])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][27] ([Intel XE#6707] / [Intel XE#7439])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1424])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2320]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#309] / [Intel XE#7343]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4331] / [Intel XE#7227])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#8265]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][33] -> [FAIL][34] ([Intel XE#301])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][35] -> [FAIL][36] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7178] / [Intel XE#7349])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7178] / [Intel XE#7351])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2311]) +25 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#4141]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#656] / [Intel XE#7905]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7061]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7061]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7905]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#7865])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#8589]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2313]) +24 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7061] / [Intel XE#7356])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4090] / [Intel XE#7443])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7283]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#8303]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-framedrop-check@psr2-yuv420:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#8396]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@kms_pm_dc@dc3co-framedrop-check@psr2-yuv420.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1131])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-4/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][58] -> [FAIL][59] ([Intel XE#8399])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1489]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#2893] / [Intel XE#7304])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2387] / [Intel XE#7429])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#3904] / [Intel XE#7342])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#6503])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#6599])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_evict@evict-cm-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#6540] / [Intel XE#688])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-3/igt@xe_evict@evict-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][68] ([Intel XE#6321] / [Intel XE#8355]) +1 other test incomplete
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2322] / [Intel XE#7372]) +6 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1392])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-invalid-fault:
    - shard-bmg:          [PASS][71] -> [DMESG-FAIL][72] ([Intel XE#5545] / [Intel XE#6652] / [Intel XE#7774])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-8/igt@xe_exec_fault_mode@once-invalid-fault.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_exec_fault_mode@once-invalid-fault.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#8374]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#8374]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#8364]) +9 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#8364])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr.html

  * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#8369])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html

  * igt@xe_exec_system_allocator@once-mmap-new-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#8714]) +132 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#8378]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#8378]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#5694] / [Intel XE#7370])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2284] / [Intel XE#7370])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pmu@engine-activity-multi-client:
    - shard-bmg:          [PASS][83] -> [SKIP][84] ([Intel XE#8589]) +24 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@xe_pmu@engine-activity-multi-client.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_pmu@engine-activity-multi-client.html

  * igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#4733] / [Intel XE#7417])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_pxp@regular-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#944]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#944])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-6/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random:
    - shard-bmg:          NOTRUN -> [FAIL][88] ([Intel XE#7992])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#3342])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-1/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@default-enabled-fair-scheduling:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#8339])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-4/igt@xe_sriov_scheduling@default-enabled-fair-scheduling.html

  
#### Possible fixes ####

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [SKIP][91] ([Intel XE#5177] / [Intel XE#8714]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@intel_hwmon@hwmon-read.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][93] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3:
    - shard-bmg:          [FAIL][95] ([Intel XE#6078]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][97] ([Intel XE#3321]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][99] ([Intel XE#301]) -> [PASS][100] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][101] ([Intel XE#7308]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][103] ([Intel XE#8399]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          [ABORT][105] ([Intel XE#8007]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [SKIP][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-6/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-8/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-6/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-8/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-2/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-2/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_module_load@load.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [SKIP][158] ([Intel XE#8714]) -> [PASS][159] +750 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][160] ([Intel XE#2327]) -> [SKIP][161] ([Intel XE#8714]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          [SKIP][162] ([Intel XE#8714]) -> [SKIP][163] ([Intel XE#2327]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][164] ([Intel XE#8714]) -> [SKIP][165] ([Intel XE#7059] / [Intel XE#7085])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][166] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][167] ([Intel XE#8714])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][168] ([Intel XE#8714]) -> [SKIP][169] ([Intel XE#610] / [Intel XE#7387])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][170] ([Intel XE#8714]) -> [SKIP][171] ([Intel XE#1124]) +9 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][172] ([Intel XE#1124]) -> [SKIP][173] ([Intel XE#8714]) +8 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][174] ([Intel XE#8714]) -> [SKIP][175] ([Intel XE#607] / [Intel XE#7361])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][176] ([Intel XE#610] / [Intel XE#7387]) -> [SKIP][177] ([Intel XE#8589])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][178] ([Intel XE#7679]) -> [SKIP][179] ([Intel XE#8589])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][180] ([Intel XE#7679]) -> [SKIP][181] ([Intel XE#8714]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][182] ([Intel XE#8714]) -> [SKIP][183] ([Intel XE#7679]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][184] ([Intel XE#367]) -> [SKIP][185] ([Intel XE#8714]) +3 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][186] ([Intel XE#8714]) -> [SKIP][187] ([Intel XE#367]) +3 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][188] ([Intel XE#2887]) -> [SKIP][189] ([Intel XE#8589])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][190] ([Intel XE#8714]) -> [SKIP][191] ([Intel XE#2652])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][192] ([Intel XE#8714]) -> [SKIP][193] ([Intel XE#3432]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][194] ([Intel XE#3432]) -> [SKIP][195] ([Intel XE#8714]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][196] ([Intel XE#3432]) -> [SKIP][197] ([Intel XE#8589])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][198] ([Intel XE#8714]) -> [SKIP][199] ([Intel XE#2887]) +15 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][200] ([Intel XE#2887]) -> [SKIP][201] ([Intel XE#8714]) +14 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][202] ([Intel XE#8714]) -> [SKIP][203] ([Intel XE#2724] / [Intel XE#7449])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_cdclk@plane-scaling.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          [SKIP][204] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][205] ([Intel XE#8589])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-6/igt@kms_chamelium_color@ctm-0-75.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          [SKIP][206] ([Intel XE#8714]) -> [SKIP][207] ([Intel XE#2325] / [Intel XE#7358])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_chamelium_color@ctm-negative.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][208] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][209] ([Intel XE#8714]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_chamelium_color@degamma.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-bmg:          [SKIP][210] ([Intel XE#8714]) -> [SKIP][211] ([Intel XE#7358])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][212] ([Intel XE#8714]) -> [SKIP][213] ([Intel XE#2252]) +10 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-bmg:          [SKIP][214] ([Intel XE#2252]) -> [SKIP][215] ([Intel XE#8714]) +9 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][216] ([Intel XE#8714]) -> [SKIP][217] ([Intel XE#6507])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][218] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][219] ([Intel XE#8714]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_content_protection@atomic.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][220] ([Intel XE#8714]) -> [SKIP][221] ([Intel XE#6974])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][222] ([Intel XE#8714]) -> [SKIP][223] ([Intel XE#2390] / [Intel XE#6974])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          [SKIP][224] ([Intel XE#6974]) -> [SKIP][225] ([Intel XE#8589])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          [SKIP][226] ([Intel XE#8714]) -> [FAIL][227] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_content_protection@suspend-resume.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][228] ([Intel XE#8714]) -> [FAIL][229] ([Intel XE#6707] / [Intel XE#7439])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_content_protection@uevent.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][230] ([Intel XE#8714]) -> [SKIP][231] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          [SKIP][232] ([Intel XE#2320]) -> [SKIP][233] ([Intel XE#8714]) +6 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          [SKIP][234] ([Intel XE#8714]) -> [SKIP][235] ([Intel XE#2320]) +5 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][236] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][237] ([Intel XE#8714])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][238] ([Intel XE#8714]) -> [FAIL][239] ([Intel XE#7571])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][240] ([Intel XE#7571]) -> [SKIP][241] ([Intel XE#8714])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][242] ([Intel XE#4210] / [Intel XE#7467]) -> [SKIP][243] ([Intel XE#8714])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][244] ([Intel XE#1508]) -> [SKIP][245] ([Intel XE#8714])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:
    - shard-bmg:          [SKIP][246] ([Intel XE#8714]) -> [SKIP][247] ([Intel XE#8265]) +4 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-bmg:          [SKIP][248] ([Intel XE#8265]) -> [SKIP][249] ([Intel XE#8714]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][250] ([Intel XE#4156] / [Intel XE#7425]) -> [SKIP][251] ([Intel XE#8714])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][252] ([Intel XE#8714]) -> [SKIP][253] ([Intel XE#4156] / [Intel XE#7425])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][254] ([Intel XE#2372] / [Intel XE#7359]) -> [SKIP][255] ([Intel XE#8714])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_feature_discovery@chamelium.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][256] ([Intel XE#2375]) -> [SKIP][257] ([Intel XE#8714])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_feature_discovery@dp-mst.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-bmg:          [SKIP][258] ([Intel XE#7179]) -> [SKIP][259] ([Intel XE#8714])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][260] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][261] ([Intel XE#8714]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][262] ([Intel XE#8714]) -> [SKIP][263] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          [SKIP][264] ([Intel XE#8714]) -> [SKIP][265] ([Intel XE#7179]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][266] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][267] ([Intel XE#8714]) +4 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][268] ([Intel XE#7061]) -> [SKIP][269] ([Intel XE#8589])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][270] ([Intel XE#8714]) -> [SKIP][271] ([Intel XE#4141]) +18 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][272] ([Intel XE#4141]) -> [SKIP][273] ([Intel XE#8714]) +15 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-bmg:          [SKIP][274] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][275] ([Intel XE#8589])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][276] ([Intel XE#2311]) -> [SKIP][277] ([Intel XE#8714]) +49 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          [SKIP][278] ([Intel XE#8714]) -> [SKIP][279] ([Intel XE#7061] / [Intel XE#7356]) +5 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][280] ([Intel XE#2311]) -> [SKIP][281] ([Intel XE#8589])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-onoff.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][282] ([Intel XE#8714]) -> [SKIP][283] ([Intel XE#2311]) +61 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt:
    - shard-bmg:          [SKIP][284] ([Intel XE#8714]) -> [SKIP][285] ([Intel XE#7061]) +4 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][286] ([Intel XE#8714]) -> [SKIP][287] ([Intel XE#2313]) +60 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          [SKIP][288] ([Intel XE#2313]) -> [SKIP][289] ([Intel XE#8714]) +57 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][290] ([Intel XE#7061]) -> [SKIP][291] ([Intel XE#8714]) +5 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][292] ([Intel XE#8714]) -> [SKIP][293] ([Intel XE#2350] / [Intel XE#7503])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][294] ([Intel XE#2313]) -> [SKIP][295] ([Intel XE#8589])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][296] ([Intel XE#3544]) -> [SKIP][297] ([Intel XE#8714])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][298] ([Intel XE#6911] / [Intel XE#7466]) -> [SKIP][299] ([Intel XE#8714])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_joiner@basic-force-ultra-joiner.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          [SKIP][300] ([Intel XE#4298] / [Intel XE#5873]) -> [SKIP][301] ([Intel XE#8714])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][302] ([Intel XE#8714]) -> [SKIP][303] ([Intel XE#6911] / [Intel XE#7466])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][304] ([Intel XE#2486]) -> [SKIP][305] ([Intel XE#8714])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@kms_panel_fitting@legacy.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          [SKIP][306] ([Intel XE#8714]) -> [SKIP][307] ([Intel XE#6912] / [Intel XE#7375])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][308] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375]) -> [SKIP][309] ([Intel XE#8714])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][310] ([Intel XE#8714]) -> [SKIP][311] ([Intel XE#7283]) +3 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][312] ([Intel XE#7283]) -> [SKIP][313] ([Intel XE#8714]) +4 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-bmg:          [SKIP][314] ([Intel XE#7283]) -> [SKIP][315] ([Intel XE#8589])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][316] ([Intel XE#2393]) -> [SKIP][317] ([Intel XE#8714]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][318] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][319] ([Intel XE#8714]) +2 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][320] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][321] ([Intel XE#8714])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][322] ([Intel XE#8714]) -> [SKIP][323] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_pm_backlight@basic-brightness.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][324] ([Intel XE#8714]) -> [SKIP][325] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-framegap:
    - shard-bmg:          [SKIP][326] ([Intel XE#8714]) -> [SKIP][327] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-framegap.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-framegap.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-bmg:          [SKIP][328] ([Intel XE#6927]) -> [SKIP][329] ([Intel XE#8714])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_pm_dc@dc5-pageflip-negative.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][330] ([Intel XE#8714]) -> [SKIP][331] ([Intel XE#2505] / [Intel XE#7447])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][332] ([Intel XE#8714]) -> [SKIP][333] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][334] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][335] ([Intel XE#8714])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          [SKIP][336] ([Intel XE#6814] / [Intel XE#7428]) -> [SKIP][337] ([Intel XE#8714])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_pm_rpm@package-g7.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][338] ([Intel XE#8714]) -> [SKIP][339] ([Intel XE#1489]) +8 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][340] ([Intel XE#1489]) -> [SKIP][341] ([Intel XE#8714]) +7 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][342] ([Intel XE#8714]) -> [SKIP][343] ([Intel XE#2387] / [Intel XE#7429])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-bmg:          [SKIP][344] ([Intel XE#8714]) -> [SKIP][345] ([Intel XE#2234] / [Intel XE#2850]) +17 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_psr@fbc-psr2-primary-page-flip.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@psr-suspend:
    - shard-bmg:          [SKIP][346] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][347] ([Intel XE#8714]) +16 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@kms_psr@psr-suspend.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_psr@psr-suspend.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][348] ([Intel XE#8714]) -> [SKIP][349] ([Intel XE#3904] / [Intel XE#7342])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-270.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][350] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][351] ([Intel XE#8714]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][352] ([Intel XE#2413]) -> [SKIP][353] ([Intel XE#8714])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          [SKIP][354] ([Intel XE#8714]) -> [SKIP][355] ([Intel XE#6503])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_sharpness_filter@filter-scaler-downscale.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          [SKIP][356] ([Intel XE#6503]) -> [SKIP][357] ([Intel XE#8714]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_sharpness_filter@filter-toggle.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][358] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][359] ([Intel XE#2426] / [Intel XE#5848])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][360] ([Intel XE#2450] / [Intel XE#5857]) -> [SKIP][361] ([Intel XE#8714])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          [SKIP][362] ([Intel XE#8714]) -> [SKIP][363] ([Intel XE#8397])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_vrr@lobf-dc3co.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@kms_vrr@lobf-dc3co.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][364] ([Intel XE#1499]) -> [SKIP][365] ([Intel XE#8714]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_vrr@max-min.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_vrr@max-min.html

  * igt@xe_ccs@block-copy-uncompressed-inc-dimension:
    - shard-bmg:          [SKIP][366] ([Intel XE#8714]) -> [SKIP][367] ([Intel XE#8589]) +17 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_ccs@block-copy-uncompressed-inc-dimension.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_ccs@block-copy-uncompressed-inc-dimension.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][368] ([Intel XE#8714]) -> [SKIP][369] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-bmg:          [SKIP][370] ([Intel XE#8608]) -> [SKIP][371] ([Intel XE#8714])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@xe_cw_post_sync@walker-post-sync.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          [SKIP][372] ([Intel XE#8370]) -> [SKIP][373] ([Intel XE#8714]) +4 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@xe_evict@evict-small-multi-queue-cm.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          [SKIP][374] ([Intel XE#8714]) -> [SKIP][375] ([Intel XE#8370])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          [SKIP][376] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][377] ([Intel XE#8714]) +7 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          [SKIP][378] ([Intel XE#8714]) -> [SKIP][379] ([Intel XE#2322] / [Intel XE#7372]) +8 other tests skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [SKIP][380] ([Intel XE#8714]) -> [FAIL][381] ([Intel XE#8578])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_exec_fault_mode@atomic-many.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          [SKIP][382] ([Intel XE#8714]) -> [SKIP][383] ([Intel XE#8374]) +12 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          [SKIP][384] ([Intel XE#8374]) -> [SKIP][385] ([Intel XE#8589]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-imm:
    - shard-bmg:          [SKIP][386] ([Intel XE#8374]) -> [SKIP][387] ([Intel XE#8714]) +11 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-imm.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:
    - shard-bmg:          [SKIP][388] ([Intel XE#8364]) -> [SKIP][389] ([Intel XE#8589]) +2 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          [SKIP][390] ([Intel XE#8714]) -> [SKIP][391] ([Intel XE#8364]) +33 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          [SKIP][392] ([Intel XE#8364]) -> [SKIP][393] ([Intel XE#8714]) +28 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-priority.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          [SKIP][394] ([Intel XE#8714]) -> [SKIP][395] ([Intel XE#8369]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_exec_reset@cm-multi-queue-cat-error.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_reset@multi-queue-cancel:
    - shard-bmg:          [SKIP][396] ([Intel XE#8369]) -> [SKIP][397] ([Intel XE#8714]) +2 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@xe_exec_reset@multi-queue-cancel.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_exec_reset@multi-queue-cancel.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          [SKIP][398] ([Intel XE#8378]) -> [SKIP][399] ([Intel XE#8714]) +9 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          [SKIP][400] ([Intel XE#8714]) -> [SKIP][401] ([Intel XE#8378]) +10 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][402] ([Intel XE#6281] / [Intel XE#7426]) -> [SKIP][403] ([Intel XE#8714])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [ABORT][404] ([Intel XE#8007]) -> [SKIP][405] ([Intel XE#8714])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          [SKIP][406] ([Intel XE#7954]) -> [SKIP][407] ([Intel XE#8714])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@xe_gpgpu_fill@offset-4x4.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][408] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384]) -> [SKIP][409] ([Intel XE#8714])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@xe_mmap@small-bar.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_mmap@small-bar.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          [SKIP][410] ([Intel XE#6964] / [Intel XE#8714]) -> [SKIP][411] ([Intel XE#6964]) +3 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - shard-bmg:          [SKIP][412] ([Intel XE#6964]) -> [SKIP][413] ([Intel XE#6964] / [Intel XE#8714]) +2 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-bmg:          [SKIP][414] ([Intel XE#8714]) -> [SKIP][415] ([Intel XE#7793]) +2 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_page_reclaim@basic-mixed.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_page_reclaim@prl-invalidate-full:
    - shard-bmg:          [SKIP][416] ([Intel XE#7793]) -> [SKIP][417] ([Intel XE#8714])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@xe_page_reclaim@prl-invalidate-full.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_page_reclaim@prl-invalidate-full.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][418] ([Intel XE#8714]) -> [SKIP][419] ([Intel XE#2245] / [Intel XE#7590])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_pat@pat-index-xelp.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          [FAIL][420] ([Intel XE#7695]) -> [SKIP][421] ([Intel XE#8714]) +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@xe_pat@pat-sw-hw-reset-compare.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          [SKIP][422] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][423] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353] / [Intel XE#8714])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@xe_peer2peer@read.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          [SKIP][424] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][425] ([Intel XE#8714])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@xe_pm@d3cold-basic-exec.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][426] ([Intel XE#8714]) -> [SKIP][427] ([Intel XE#2284] / [Intel XE#7370]) +2 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-bmg:          [SKIP][428] ([Intel XE#7599]) -> [SKIP][429] ([Intel XE#8714])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@xe_prefetch_fault@prefetch-fault-svm.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          [SKIP][430] ([Intel XE#8714]) -> [SKIP][431] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][432] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][433] ([Intel XE#8714]) +2 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][434] ([Intel XE#8714]) -> [SKIP][435] ([Intel XE#944]) +2 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_query@multigpu-query-invalid-extension.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          [SKIP][436] ([Intel XE#944]) -> [SKIP][437] ([Intel XE#8714]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@xe_query@multigpu-query-invalid-query.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [SKIP][438] ([Intel XE#8714]) -> [FAIL][439] ([Intel XE#7992])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
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
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9034 -> IGT_9035
  * Linux: xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a -> xe-pw-170589v3

  IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9035: 61674acebe1520ef02165573257f552366c2879c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a: f9ef9f302ee01854066ec6da30550da6ea6cb03a
  xe-pw-170589v3: 170589v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/index.html

--===============4085490500399652197==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Compress GuC log and CTB dump wi=
th zstd (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/170589/">https://patchwork.freedesktop.org/series/170589/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-170589v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-170589v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5515-f9ef9f302ee01854066ec6da30550da6e=
a6cb03a_FULL -&gt; xe-pw-170589v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-170589v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-170589v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1705=
89v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pm_rpm@drm-resources-equal:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@kms_pm_r=
pm@drm-resources-equal.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_pm_rpm@drm-resourc=
es-equal.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-170589v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@core_get=
version@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@core_getversion@basic.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714"=
>Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@fbdev@nu=
llptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-170589v3/shard-bmg-7/igt@fbdev@nullptr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@kms_addf=
b_basic@unused-handle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_addfb_basic@unused-=
handle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8714">Intel XE#8714</a>) +658 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-5/igt@kms_big_fb@x-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-5/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-7/igt@kms_bw@connected-linear-tilin=
g-2-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_bw@linear-tiling-1-displa=
ys-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-t=
iled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-=
tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +16 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_cdclk@mode-transition-all=
-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_chamelium_color@ctm-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7358">Intel XE#7358</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-5/igt@kms_chamelium_frames@hdmi-fra=
me-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-afte=
r-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_content_protection@suspen=
d-resume@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_content_protection@type1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@kms_content_protection@ueven=
t@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-4/igt@kms_cursor_crc@cursor-onscree=
n-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding=
-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-=
flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@kms_dp_linktrain_fallback@ds=
c-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4331">Intel XE#4331</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_dsc@dsc-with-formats-bigj=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-7/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-7/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7=
349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs=
-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-=
2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/656">Intel XE#656</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbch=
dr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-8/igt@kms_frontbuffer_tracking@hdr-=
1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_frontbuffer_tracking@hdr-=
2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +24 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@kms_joiner@switch-modeset-ult=
ra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7443">Intel XE#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_plane@pixel-format-4-tile=
d-dg2-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_plane@pixel-format-x-tile=
d-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@kms_plane_scaling@planes-down=
scale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_pm_backlight@fade-with-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@kms_pm_dc@dc3co-framedrop-che=
ck@pr-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@psr2-yuv420:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@kms_pm_dc@dc3co-framedrop-che=
ck@psr2-yuv420.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8396">Intel XE#8396</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-4/igt@kms_pm_dc@dc5-dpms-negative.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-lnl-2/igt@kms_pm_d=
c@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-170589v3/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel=
 XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-=
update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@kms_rotation_crc@primary-rot=
ation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_sharpness_filter@invalid-=
filter-with-scaler.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@xe_compute@ccs-mode-compute-k=
ernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-3/igt@xe_evict@evict-cm-threads-sma=
ll-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@xe_evict@evict-mixed-many-thr=
eads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) +1 other test i=
ncomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)=
 +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-8/igt@xe_exec_=
fault_mode@once-invalid-fault.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_exec_fault_m=
ode@once-invalid-fault.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE=
#7774</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_exec_fault_mode@once-multi=
-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetc=
h:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-7/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-fault-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-5/igt@xe_exec_multi_queue@two-queue=
s-preempt-mode-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@xe_exec_reset@cm-multi-queue-=
close-execqueues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_exec_system_allocator@once=
-mmap-new-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +132 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_exec_threads@threads-multi=
-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-5/igt@xe_exec_threads@threads-multi=
-queue-shared-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@xe_pm@d3cold-i2c.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">In=
tel XE#5694</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-multi-client:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@xe_pmu@e=
ngine-activity-multi-client.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_pmu@engine-act=
ivity-multi-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@regular-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_pxp@regular-src-to-pxp-des=
t-rendercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@xe_query@multigpu-query-inval=
id-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-6/igt@xe_query@multigpu-query-oa-un=
its.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvf=
s-random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_sriov_auto_provisioning@re=
sources-released-on-vfs-disabling@numvfs-random.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-1/igt@xe_sriov_flr@flr-each-isolati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@default-enabled-fair-scheduling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-170589v3/shard-lnl-4/igt@xe_sriov_scheduling@default-e=
nabled-fair-scheduling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@intel_hw=
mon@hwmon-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5177">Intel XE#5177</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@in=
tel_hwmon@hwmon-read.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3=
/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_asyn=
c_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1705=
89v3/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-=
a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg=
-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shar=
d-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@kms_hdmi=
_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_hdmi_i=
nject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-lnl-5/igt@kms_pm_d=
c@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-170589v3/shard-lnl-1/igt@kms_pm_dc@dc5-psr.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@xe_fault=
_injection@inject-fault-probe-function-xe_guc_log_init.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#=
8007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
170589v3/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_=
guc_log_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/sha=
rd-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a=
/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6=
cb03a/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550d=
a6ea6cb03a/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30=
550da6ea6cb03a/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec=
6da30550da6ea6cb03a/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee018540=
66ec6da30550da6ea6cb03a/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01=
854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f30=
2ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef=
9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5515-=
f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@xe_module_=
load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-=
bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03=
a/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6=
cb03a/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE=
#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-170589v3/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shar=
d-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-170589v3/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/sh=
ard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-170589v3/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-170589v3/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-170589v3/shard-bmg-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/sh=
ard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-170589v3/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_module_load@l=
oad.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_sysfs=
_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/sha=
rd-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS=
</a> +750 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_big_=
fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_=
big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_big_=
fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_b=
ig_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_big_=
fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/sh=
ard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059=
">Intel XE#7059</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_big=
_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Int=
el XE#7085</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-170589v3/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate=
-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_big_=
fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-2/ig=
t@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#738=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/s=
hard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
24">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_big_=
fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_=
big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_big_=
fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bm=
g-8/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#60=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361=
">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/sha=
rd-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#858=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1705=
89v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1705=
89v3/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x=
1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1705=
89v3/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_bw@l=
inear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-b=
mg-7/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_bw@l=
inear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard=
-bmg-3/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel=
 XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-8/igt@kms_ccs@=
bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg=
-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#858=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_ccs@=
crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/i=
gt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bm=
g-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3=
432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_ccs=
@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-b=
mg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#=
8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-=
bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel =
XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10=
/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>=
) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg=
-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#871=
4</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@kms_cdclk@plane=
-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-6/igt@kms_cham=
elium_color@ctm-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/=
igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_cham=
elium_color@ctm-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@kms_ch=
amelium_color@ctm-negative.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_cham=
elium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/i=
gt@kms_chamelium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_cham=
elium_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-b=
mg-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE=
#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_cham=
elium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/ig=
t@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +10 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-6/igt@kms_cham=
elium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/=
igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)=
 +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_cham=
elium_sharpness_filter@filter-basic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5=
/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_con=
tent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1705=
89v3/shard-bmg-7/igt@kms_content_protection@atomic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_cont=
ent_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-b=
mg-4/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE=
#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_cont=
ent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-2/ig=
t@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE=
#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@kms_cont=
ent_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5=
/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_cont=
ent_protection@suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@k=
ms_content_protection@suspend-resume.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374"=
>Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_curs=
or_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/ig=
t@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7=
355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@kms_curs=
or_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/ig=
t@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +6 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_curs=
or_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10=
/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>=
) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/sha=
rd-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_cur=
sor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-6/igt@kms_dirt=
yfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4210">Intel XE#4210</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7467">Intel XE#7467</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7=
/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@kms_dirt=
yfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_dirty=
fb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_dsc@=
dsc-fractional-bpp-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg=
-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#826=
5</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@kms_dsc@=
dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/sh=
ard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714=
">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_fbco=
n_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4156">Intel XE#4156</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_fbc=
on_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_fbco=
n_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/igt@kms_fbcon_fbt=
@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4156">Intel XE#4156</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_fea=
ture_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2372">Intel XE#2372</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7359">Intel XE#7359</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bm=
g-7/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_fea=
ture_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_featu=
re_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@kms_flip=
_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#=
7179</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
170589v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-lin=
ear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_flip=
_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel =
XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7351">Intel XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#=
8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
170589v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytil=
e-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#87=
14</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
0589v3/shard-bmg-6/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-=
reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7179">Intel XE#7179</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Int=
el XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-170589v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-dr=
aw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@drrshdr-argb161616f-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1705=
89v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1705=
89v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-dr=
aw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4141">Intel XE#4141</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v=
3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8714">Intel XE#8714</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel =
XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-170589v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-r=
ender.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel =
XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-170589v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pr=
i-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v=
3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7356">Intel XE#7356</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-170589v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-c=
ur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE=
#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-170589v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-s=
hrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v=
3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7061">Intel XE#7061</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#871=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170=
589v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shar=
d-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">In=
tel XE#8714</a>) +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@hdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shar=
d-bmg-7/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Int=
el XE#8714</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/ig=
t@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503">Intel XE#7=
503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
70589v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_join=
er@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard=
-bmg-7/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_join=
er@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4298">Intel XE#4298</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg=
-7/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_join=
er@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg=
-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#691=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466=
">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@kms_pane=
l_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_panel_fitt=
ing@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_pipe=
_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/i=
gt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE=
#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_pip=
e_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel=
 XE#7375</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-170589v3/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/871=
4">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_plan=
e@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1705=
89v3/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-cla=
mping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7283">Intel XE#7283</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_plan=
e@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Inte=
l XE#7283</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-170589v3/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-m=
odifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_plan=
e@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v=
3/shard-bmg-5/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_plan=
e_lowres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_plane_low=
res@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel X=
E#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-f=
actor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_pm_b=
acklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589=
v3/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_pm_b=
acklight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-10/igt@kms_=
pm_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE=
#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_pm_b=
acklight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@k=
ms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760"=
>Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_pm_d=
c@dc3co-vpb-framegap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@kms_pm_dc@=
dc3co-vpb-framegap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_pm_d=
c@dc5-pageflip-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6927">Intel XE#6927</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_pm_=
dc@dc5-pageflip-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_pm_d=
c@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-1/igt@kms_pm_dc@deep-pkgc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2505">Intel XE#2505</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7447">Intel XE#7447</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_pm_r=
pm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@kms_pm_r=
pm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">=
Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_pm_=
rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel=
 XE#7383</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-=
wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_pm_r=
pm@package-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6814">Intel XE#6814</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms=
_pm_rpm@package-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_psr2=
_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/s=
hard-bmg-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
89">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-6/igt@kms_psr2=
_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/ig=
t@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +7 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_psr2=
_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/igt@kms_psr2=
_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_psr@=
fbc-psr2-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@kms_=
psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +=
17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@kms_psr@=
psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_p=
sr@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8714">Intel XE#8714</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_rota=
tion_crc@primary-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-2/igt@k=
ms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1705=
89v3/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714=
">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-6/igt@kms_scal=
ing_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/=
igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_shar=
pness_filter@filter-scaler-downscale.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-=
4/igt@kms_sharpness_filter@filter-scaler-downscale.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@kms_shar=
pness_filter@filter-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_=
sharpness_filter@filter-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_til=
ed_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel =
XE#7437</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-170589v3/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2450">Intel XE#2450</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-=
7/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@kms_vrr@=
lobf-dc3co.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@kms_vrr@lobf-dc3co.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8397">Intel XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@kms_vrr=
@max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@kms_vrr@max-min.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
14">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-uncompressed-inc-dimension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_ccs@b=
lock-copy-uncompressed-inc-dimension.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-=
5/igt@xe_ccs@block-copy-uncompressed-inc-dimension.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589=
</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_creat=
e@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/ig=
t@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7=
319</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
50">Intel XE#7350</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@xe_cw_po=
st_sync@walker-post-sync.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_cw_=
post_sync@walker-post-sync.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@xe_evict=
@evict-small-multi-queue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_=
evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_evict=
@evict-small-multi-queue-priority.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-9/i=
gt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#232=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372=
">Intel XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-=
many-vm-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel X=
E#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-170589v3/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-=
userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +8 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_exec_=
fault_mode@atomic-many.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-6/igt@xe_exec_=
fault_mode@atomic-many.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_exec_=
fault_mode@many-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1705=
89v3/shard-bmg-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-pre=
fetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8374">Intel XE#8374</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@xe_exec_=
fault_mode@once-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#=
8374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
170589v3/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-invali=
date-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@xe_exec_=
fault_mode@twice-multi-queue-imm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/ig=
t@xe_exec_fault_mode@twice-multi-queue-imm.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +11=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@xe_exec_=
multi_queue@few-execs-preempt-mode-priority.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/sha=
rd-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">=
Intel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_exec_=
multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel=
 XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-170589v3/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fa=
ult-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@xe_exec_=
multi_queue@two-queues-priority.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/ig=
t@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +28 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_exec_=
reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/ig=
t@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-10/igt@xe_exec=
_reset@multi-queue-cancel.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_ex=
ec_reset@multi-queue-cancel.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-8/igt@xe_exec_=
threads@threads-multi-queue-mixed-fd-userptr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/sh=
ard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714=
">Intel XE#8714</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_exec_=
threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-170589v3/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-share=
d-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@xe_fault=
_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#=
6281</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
426">Intel XE#7426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_fault_injection@exec-queue-create=
-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-8/igt@xe_fault=
_injection@inject-fault-probe-function-xe_wopcm_init.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#80=
07</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
0589v3/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wo=
pcm_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@xe_gpgpu=
_fill@offset-4x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7954">Intel XE#7954</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_gpgpu_fill@=
offset-4x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/586">Intel XE#586</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7=
/igt@xe_mmap@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_multi=
gpu_svm@mgpu-atomic-op-basic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shar=
d-bmg-10/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-1/igt@xe_multi=
gpu_svm@mgpu-coherency-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/ig=
t@xe_multigpu_svm@mgpu-coherency-prefetch.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#=
8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_page_=
reclaim@basic-mixed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_page_rec=
laim@basic-mixed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7793">Intel XE#7793</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-invalidate-full:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@xe_page_=
reclaim@prl-invalidate-full.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_=
page_reclaim@prl-invalidate-full.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-3/igt@xe_pat@pat-index-=
xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2245">Intel XE#2245</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-9/igt@xe_pat@p=
at-sw-hw-reset-compare.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_pat@p=
at-sw-hw-reset-compare.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-4/igt@xe_peer2=
peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2427">Intel XE#2427</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1705=
89v3/shard-bmg-7/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#695=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326=
">Intel XE#7326</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7353">Intel XE#7353</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@xe_pm@d3=
cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@x=
e_pm@d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-5/igt@xe_pm@d3col=
d-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-3/igt@xe_prefe=
tch_fault@prefetch-fault-svm.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe=
_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_pxp@p=
xp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg=
-4/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#473=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417=
">Intel XE#7417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-2/igt@xe_pxp@p=
xp-termination-key-update-post-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#741=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170=
589v3/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
14">Intel XE#8714</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_query=
@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-4/i=
gt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-5/igt@xe_query=
@multigpu-query-invalid-query.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170589v3/shard-bmg-7/igt@xe_=
query@multigpu-query-invalid-query.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a/shard-bmg-7/igt@xe_sriov=
_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8=
714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
70589v3/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vf=
s-disabling.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9034 -&gt; IGT_9035</li>
<li>Linux: xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a -&gt; xe-pw-170=
589v3</li>
</ul>
<p>IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_9035: 61674acebe1520ef02165573257f552366c2879c @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5515-f9ef9f302ee01854066ec6da30550da6ea6cb03a: f9ef9f302ee01854066ec6d=
a30550da6ea6cb03a<br />
  xe-pw-170589v3: 170589v3</p>

</body>
</html>

--===============4085490500399652197==--
