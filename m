Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B718C624D3
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 13:26:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9840010E156;
	Fri,  4 Sep 2026 13:26:18 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19E710E156;
 Fri,  4 Sep 2026 13:26:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7016745523483070725=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Rename_xe=5Fvm?=
 =?utf-8?q?=5Ffault_to_drm=5Fxe=5Fvm=5Ffault?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Sep 2026 13:26:16 -0000
Message-ID: <178852837670.122453.7245522156644579428@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260903231632.399765-1-jonathan.cavitt@intel.com>
In-Reply-To: <20260903231632.399765-1-jonathan.cavitt@intel.com>
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

--===============7016745523483070725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Rename xe_vm_fault to drm_xe_vm_fault
URL   : https://patchwork.freedesktop.org/series/173343/
State : failure

== Summary ==

CI Bug Log - changes from xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623_FULL -> xe-pw-173343v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-173343v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-173343v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-173343v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
    - shard-lnl:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-173343v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@pan:
    - shard-lnl:          [PASS][3] -> [SKIP][4] ([Intel XE#2134])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@fbdev@pan.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@fbdev@pan.html

  * igt@fbdev@read:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#2134]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@fbdev@read.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#3157])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#3658] / [Intel XE#7360])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1407])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#9125]) +62 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#7679])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2887])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][16] ([Intel XE#7084] / [Intel XE#8150])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#3432])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2252])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color@degamma:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#306] / [Intel XE#7358])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7358])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#373]) +5 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#7006])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#307] / [Intel XE#6974])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2320])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#2321] / [Intel XE#7355])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1424]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#8265])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#4422] / [Intel XE#7442])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [PASS][32] -> [FAIL][33] ([Intel XE#7949] / [i915#4767])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1138] / [Intel XE#7344])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@vrr:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#8586])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][36] -> [FAIL][37] ([Intel XE#3098]) +2 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-9/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ad-dp2-hdmi-a3.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1421]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@blocking-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#2482]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_flip@blocking-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#301] / [Intel XE#3149])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-lnl:          [PASS][42] -> [SKIP][43] ([Intel XE#2482])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#7178] / [Intel XE#7349])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1745] / [Intel XE#9144])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2311]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#6312]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4141]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-lnl:          [PASS][51] -> [SKIP][52] ([Intel XE#2548] / [Intel XE#7779]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1469] / [Intel XE#7399])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#6312] / [Intel XE#651]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#7061] / [Intel XE#7356])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#7061]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#656] / [Intel XE#7905]) +7 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2313]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#7865]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#7905]) +10 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#2548] / [Intel XE#7779]) +36 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#7779]) +49 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_invalid_mode@overflow-vrefresh:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#2568])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_invalid_mode@overflow-vrefresh.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#6900] / [Intel XE#7362])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2:
    - shard-bmg:          [PASS][65] -> [ABORT][66] ([Intel XE#9093]) +1 other test abort
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#7283]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#7250] / [Intel XE#9128])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_plane@pixel-format-x-tiled-modifier.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#599] / [Intel XE#7382]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-lnl:          [PASS][71] -> [SKIP][72] ([Intel XE#3307] / [Intel XE#7687] / [Intel XE#9125])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_plane_scaling@invalid-num-scalers.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#2763] / [Intel XE#6886]) +11 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-lnl:          [PASS][75] -> [SKIP][76] ([Intel XE#7760])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_pm_backlight@brightness-with-dpms.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][77] -> [SKIP][78] ([Intel XE#7794])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [PASS][80] -> [SKIP][81] ([Intel XE#4886])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#9126])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#2893] / [Intel XE#7304])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#1489]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#4608]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#1489])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1122] / [Intel XE#7429])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-lnl:          [PASS][90] -> [SKIP][91] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_psr@fbc-psr-primary-render.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2234] / [Intel XE#2850])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1406]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-lnl:          [PASS][97] -> [SKIP][98] ([Intel XE#9125]) +12 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_sharpness_filter@filter-scaler-downscale.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#6503])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#8866])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_ccs@vm-bind-decompress:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#7644])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_ccs@vm-bind-decompress.html

  * igt@xe_compute@eu-busy-10s:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#6592] / [Intel XE#6645] / [Intel XE#7391])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@xe_compute@eu-busy-10s.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#6540] / [Intel XE#688]) +8 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][104] -> [INCOMPLETE][105] ([Intel XE#6321] / [Intel XE#8355])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#7482]) +14 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2322] / [Intel XE#7372])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1392]) +5 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#8374]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#8374]) +8 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_exec_fault_mode@once-multi-queue-invalid-fault.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#8364]) +22 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#8364]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#8369])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_reset@multi-queue-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#8369])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_exec_reset@multi-queue-close-fd.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#6196])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html

  * igt@xe_exec_threads@threads-multi-queue-cm-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#8378]) +7 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#8378]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#2229])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_madvise@atomic-global:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#7980])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_madvise@atomic-global.html

  * igt@xe_multigpu_svm@mgpu-pagefault-conflict:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#6964]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#6964])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_page_reclaim@binds-large-split:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#7793]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@xe_page_reclaim@binds-large-split.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#7590] / [Intel XE#977])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#7590] / [Intel XE#979])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_query@multigpu-query-topology:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#944]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#4130] / [Intel XE#7366]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#8339])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_sriov_vram@vf-access-provisioned.html

  * igt@xe_vm@overcommit-fault-vram-lr:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#7892])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_vm@overcommit-fault-vram-lr.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - shard-bmg:          [INCOMPLETE][132] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_color@deep-color:
    - shard-lnl:          [SKIP][134] ([Intel XE#1511] / [Intel XE#3297]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_color@deep-color.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_color@deep-color.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d:
    - shard-lnl:          [SKIP][136] ([Intel XE#7006]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-lut1d.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - shard-lnl:          [SKIP][138] ([Intel XE#2482]) -> [PASS][139] +2 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_flip@basic-flip-vs-modeset.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@flip-vs-dpms-on-nop:
    - shard-lnl:          [SKIP][140] ([Intel XE#9132]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_flip@flip-vs-dpms-on-nop.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_flip@flip-vs-dpms-on-nop.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          [SKIP][142] ([Intel XE#1745] / [Intel XE#9144]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          [SKIP][144] ([Intel XE#7779]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-lnl:          [SKIP][146] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][147] +7 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][148] ([Intel XE#1503]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_lease@lease-unleased-crtc:
    - shard-lnl:          [SKIP][150] ([Intel XE#9125]) -> [PASS][151] +20 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_lease@lease-unleased-crtc.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_lease@lease-unleased-crtc.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-lnl:          [SKIP][152] ([Intel XE#7780] / [Intel XE#9125]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane@planar-pixel-format-settings.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-lnl:          [SKIP][154] ([Intel XE#9128]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane@plane-panning-top-left.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-lnl:          [SKIP][156] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][157] +3 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:
    - shard-lnl:          [SKIP][158] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][159] +3 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-lnl:          [SKIP][160] ([Intel XE#7106]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_pm_rpm@drm-resources-equal.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          [SKIP][162] ([Intel XE#1489]) -> [PASS][163] +1 other test pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-lnl:          [SKIP][164] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][165] +3 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr@psr-sprite-plane-onoff.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [SKIP][166] ([Intel XE#7795]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_setmode@basic:
    - shard-lnl:          [SKIP][168] ([Intel XE#1435] / [Intel XE#9142]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_setmode@basic.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_setmode@basic.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          [SKIP][170] ([Intel XE#9125]) -> [SKIP][171] ([Intel XE#3279])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][172] ([Intel XE#9125]) -> [SKIP][173] ([Intel XE#1407]) +3 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-lnl:          [SKIP][174] ([Intel XE#1407]) -> [SKIP][175] ([Intel XE#9125])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-lnl:          [SKIP][176] ([Intel XE#1124]) -> [SKIP][177] ([Intel XE#9125]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          [SKIP][178] ([Intel XE#9125]) -> [SKIP][179] ([Intel XE#1124]) +5 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][180] ([Intel XE#1428] / [Intel XE#7387]) -> [SKIP][181] ([Intel XE#9125])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][182] ([Intel XE#7679]) -> [SKIP][183] ([Intel XE#9125])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][184] ([Intel XE#9125]) -> [SKIP][185] ([Intel XE#7679])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][186] ([Intel XE#9125]) -> [SKIP][187] ([Intel XE#8365])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          [SKIP][188] ([Intel XE#9125]) -> [SKIP][189] ([Intel XE#2887]) +7 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          [SKIP][190] ([Intel XE#9125]) -> [SKIP][191] ([Intel XE#3432]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          [SKIP][192] ([Intel XE#3432]) -> [SKIP][193] ([Intel XE#9125])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          [SKIP][194] ([Intel XE#2887]) -> [SKIP][195] ([Intel XE#9125]) +3 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          [SKIP][196] ([Intel XE#9125]) -> [SKIP][197] ([Intel XE#307] / [Intel XE#6974])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-1.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          [SKIP][198] ([Intel XE#9125]) -> [SKIP][199] ([Intel XE#7642])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_content_protection@srm.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          [SKIP][200] ([Intel XE#7642]) -> [SKIP][201] ([Intel XE#9125]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_content_protection@uevent.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-lnl:          [SKIP][202] ([Intel XE#1424]) -> [SKIP][203] ([Intel XE#9125])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-lnl:          [SKIP][204] ([Intel XE#9125]) -> [SKIP][205] ([Intel XE#2321] / [Intel XE#7355])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          [SKIP][206] ([Intel XE#9125]) -> [SKIP][207] ([Intel XE#1424])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][208] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][209] ([Intel XE#9125]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][210] ([Intel XE#9125]) -> [SKIP][211] ([Intel XE#323] / [Intel XE#6035])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          [SKIP][212] ([Intel XE#1508]) -> [SKIP][213] ([Intel XE#9125])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          [SKIP][214] ([Intel XE#9125]) -> [SKIP][215] ([Intel XE#4354] / [Intel XE#7386])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_dp_link_training@uhbr-mst.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-lnl:          [SKIP][216] ([Intel XE#9125]) -> [SKIP][217] ([Intel XE#8265]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][218] ([Intel XE#301]) -> [FAIL][219] ([Intel XE#301] / [Intel XE#3149])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          [SKIP][220] ([Intel XE#1745] / [Intel XE#9144]) -> [SKIP][221] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][222] ([Intel XE#7779]) -> [SKIP][223] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-lnl:          [SKIP][224] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][225] ([Intel XE#2548] / [Intel XE#7779]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          [SKIP][226] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][227] ([Intel XE#2548] / [Intel XE#7779]) +10 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          [SKIP][228] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][229] ([Intel XE#656] / [Intel XE#7905]) +24 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          [SKIP][230] ([Intel XE#6312]) -> [SKIP][231] ([Intel XE#7779]) +2 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][232] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][233] ([Intel XE#6312] / [Intel XE#651]) +5 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-move:
    - shard-lnl:          [SKIP][234] ([Intel XE#7779]) -> [SKIP][235] ([Intel XE#6312]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-move.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][236] ([Intel XE#7779]) -> [SKIP][237] ([Intel XE#7905]) +23 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][238] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][239] ([Intel XE#7779]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:
    - shard-lnl:          [SKIP][240] ([Intel XE#7865]) -> [SKIP][241] ([Intel XE#7779]) +5 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          [SKIP][242] ([Intel XE#7779]) -> [SKIP][243] ([Intel XE#7865]) +13 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          [SKIP][244] ([Intel XE#7905]) -> [SKIP][245] ([Intel XE#7779]) +13 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-msflip-blt.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:
    - shard-lnl:          [SKIP][246] ([Intel XE#7779]) -> [SKIP][247] ([Intel XE#7061]) +3 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][248] ([Intel XE#3544]) -> [SKIP][249] ([Intel XE#3374] / [Intel XE#3544])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          [SKIP][250] ([Intel XE#1503]) -> [SKIP][251] ([Intel XE#9125])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_hdr@static-toggle-suspend.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-lnl:          [SKIP][252] ([Intel XE#8348]) -> [SKIP][253] ([Intel XE#9125])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_mst@mst-suspend-read-crc.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-lnl:          [SKIP][254] ([Intel XE#9125]) -> [SKIP][255] ([Intel XE#599] / [Intel XE#7382])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_lowres@tiling-none.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          [SKIP][256] ([Intel XE#599]) -> [SKIP][257] ([Intel XE#9125])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_plane_lowres@tiling-y.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-lnl:          [SKIP][258] ([Intel XE#4596] / [Intel XE#5854]) -> [SKIP][259] ([Intel XE#9125])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-y.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-lnl:          [SKIP][260] ([Intel XE#9125]) -> [SKIP][261] ([Intel XE#4596] / [Intel XE#5854])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-lnl:          [SKIP][262] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [SKIP][263] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][264] ([Intel XE#1489]) -> [SKIP][265] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][266] ([Intel XE#2893] / [Intel XE#7304]) -> [SKIP][267] ([Intel XE#1489])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][268] ([Intel XE#1489]) -> [SKIP][269] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-lnl:          [SKIP][270] ([Intel XE#1128] / [Intel XE#7413]) -> [SKIP][271] ([Intel XE#1122] / [Intel XE#7429])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_psr2_su@page_flip-xrgb8888.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-lnl:          [SKIP][272] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][273] ([Intel XE#1406])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr@fbc-pr-dpms.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-lnl:          [SKIP][274] ([Intel XE#1406] / [Intel XE#7345]) -> [SKIP][275] ([Intel XE#2850] / [Intel XE#929])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-page-flip.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-sprite-blt:
    - shard-lnl:          [SKIP][276] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][277] ([Intel XE#1406] / [Intel XE#7345])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-blt.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-lnl:          [SKIP][278] ([Intel XE#9125]) -> [SKIP][279] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_rotation_crc@primary-rotation-270.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [ABORT][280] ([Intel XE#9131] / [Intel XE#9145]) -> [DMESG-WARN][281] ([Intel XE#9130])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-4/igt@xe_exec_reset@gt-reset-fault-injection.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@xe_exec_reset@gt-reset-fault-injection.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1511]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
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
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6592
  [Intel XE#6645]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6645
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7391
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#7780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7780
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7949]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7949
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8866
  [Intel XE#9093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9126
  [Intel XE#9128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9131
  [Intel XE#9132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9132
  [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#4767]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767


Build changes
-------------

  * Linux: xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623 -> xe-pw-173343v1

  IGT_9084: 9084
  xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623: 71bc3b7cc55631a9b3807da98e2b2880838b9623
  xe-pw-173343v1: 173343v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/index.html

--===============7016745523483070725==
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
<tr><td><b>Series:</b></td><td>drm/xe: Rename xe_vm_fault to drm_xe_vm_fault</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173343/">https://patchwork.freedesktop.org/series/173343/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623_FULL -&gt; xe-pw-173343v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-173343v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-173343v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-173343v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173343v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7949">Intel XE#7949</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_feature_discovery@vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-9/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_flip@blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@overflow-vrefresh:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_invalid_mode@overflow-vrefresh.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093">Intel XE#9093</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_plane@pixel-format-x-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250">Intel XE#7250</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_plane_scaling@invalid-num-scalers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_pm_backlight@brightness-with-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886">Intel XE#4886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_properties@colorop-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9126">Intel XE#9126</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_psr@fbc-psr-primary-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_sharpness_filter@filter-scaler-downscale.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_sharpness_filter@filter-scaler-downscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@sriov_basic@pf-unbind-with-vf-probed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8866">Intel XE#8866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-decompress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_ccs@vm-bind-decompress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6592">Intel XE#6592</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6645">Intel XE#6645</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7391">Intel XE#7391</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_exec_fault_mode@once-multi-queue-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-preempt-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@xe_exec_reset@multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_exec_reset@multi-queue-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-global:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_madvise@atomic-global.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-conflict:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-large-split:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@xe_page_reclaim@binds-large-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_sriov_vram@vf-access-provisioned.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-fault-vram-lr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@xe_vm@overcommit-fault-vram-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511">Intel XE#1511</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_color@deep-color.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_color_pipeline@plane-lut1d-lut1d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_flip@flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9132">Intel XE#9132</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_flip@flip-vs-dpms-on-nop.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_lease@lease-unleased-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_lease@lease-unleased-crtc.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane@planar-pixel-format-settings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7780">Intel XE#7780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_plane@planar-pixel-format-settings.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane@plane-panning-top-left.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_plane@plane-panning-top-left.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-c.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106">Intel XE#7106</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_setmode@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142">Intel XE#9142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348">Intel XE#8348</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_mst@mst-suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_lowres@tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_plane_lowres@tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-1/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-lnl-6/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-lnl-5/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623/shard-bmg-4/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9131">Intel XE#9131</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173343v1/shard-bmg-6/igt@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623 -&gt; xe-pw-173343v1</li>
</ul>
<p>IGT_9084: 9084<br />
  xe-5690-71bc3b7cc55631a9b3807da98e2b2880838b9623: 71bc3b7cc55631a9b3807da98e2b2880838b9623<br />
  xe-pw-173343v1: 173343v1</p>

</body>
</html>

--===============7016745523483070725==--
