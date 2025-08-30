Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F69ACA0EFF
	for <intel-xe@archiver.kernel.org>; Sat, 30 Aug 2025 11:31:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B7110E250;
	Sat, 30 Aug 2025 11:31:35 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1135C10E24B;
 Sat, 30 Aug 2025 11:31:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2017699518794458450=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Different_sized_pages_supp?=
 =?utf-8?q?ort_in_migrate_layer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 30 Aug 2025 11:31:34 -0000
Message-ID: <175655349405.286897.1014303241302097522@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250829180018.1333174-1-matthew.brost@intel.com>
In-Reply-To: <20250829180018.1333174-1-matthew.brost@intel.com>
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

--===============2017699518794458450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Different sized pages support in migrate layer
URL   : https://patchwork.freedesktop.org/series/153731/
State : failure

== Summary ==

CI Bug Log - changes from xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba_FULL -> xe-pw-153731v1_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-153731v1_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-153731v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-153731v1_FULL:

### IGT changes ###

#### Warnings ####

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [SKIP][1] ([Intel XE#4208]) -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     [SKIP][3] ([Intel XE#4208]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_oa@buffer-size.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@xe_oa@buffer-size.html

  
Known issues
------------

  Here are the changes found in xe-pw-153731v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#2134])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@fbdev@info.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [PASS][6] -> [SKIP][7] ([Intel XE#2134])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@fbdev@read.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@fbdev@read.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][8] -> [DMESG-FAIL][9] ([Intel XE#4543]) +1 other test dmesg-fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1124]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#787]) +230 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#2887])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#455] / [Intel XE#787]) +36 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][15] -> [INCOMPLETE][16] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#373]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][18] ([Intel XE#1178]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][19] ([Intel XE#1178])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][20] ([Intel XE#1188])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#308])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2291])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][24] -> [SKIP][25] ([Intel XE#4208] / [i915#2575]) +88 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#4494] / [i915#3804])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1135])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2316]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][30] -> [FAIL][31] ([Intel XE#301]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [PASS][32] -> [DMESG-WARN][33] ([Intel XE#4543] / [Intel XE#5208])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-adlp-8/igt@kms_flip@flip-vs-rmfb.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-6/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         [PASS][34] -> [DMESG-WARN][35] ([Intel XE#4543]) +3 other tests dmesg-warn
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#4208]) +194 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [PASS][38] -> [SKIP][39] ([Intel XE#2351] / [Intel XE#4208]) +12 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#455]) +11 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#2351] / [Intel XE#4208]) +9 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#651]) +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#656]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#656])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#653]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#1503])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#616]) +2 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#4208] / [i915#2575]) +21 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#870])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1406] / [Intel XE#4208]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#3414])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#330])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#1499])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#5626])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#4837]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_evict@evict-large-external:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#688])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-8/igt@xe_evict@evict-large-external.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [PASS][62] -> [SKIP][63] ([Intel XE#1392]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#288]) +5 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_system_allocator@once-large-mmap-mlock:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#4915]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-8/igt@xe_exec_system_allocator@once-large-mmap-mlock.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#4208]) +103 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#4915]) +62 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html

  * igt@xe_exec_system_allocator@twice-large-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#4943])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-8/igt@xe_exec_system_allocator@twice-large-mmap-new-huge-nomemset.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#2229] / [Intel XE#5488])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [PASS][70] -> [FAIL][71] ([Intel XE#4208]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@xe_module_load@reload-no-display.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#3573]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#2838] / [Intel XE#979])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#4650])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-8/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#4733])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#944])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_query@multigpu-query-config.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#4130])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#4351])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][79] ([Intel XE#4208]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@core_getversion@all-cards.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@core_getversion@all-cards.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [SKIP][81] ([Intel XE#2134]) -> [PASS][82] +1 other test pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@fbdev@nullptr.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@fbdev@nullptr.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - shard-bmg:          [FAIL][83] -> [PASS][84] +1 other test pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][85] ([Intel XE#4208] / [i915#2575]) -> [PASS][86] +124 other tests pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][87] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][89] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][90] +14 other tests pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][91] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][93] ([Intel XE#5354]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [SKIP][95] ([Intel XE#2291]) -> [PASS][96] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@forked-bo@pipe-b:
    - shard-lnl:          [INCOMPLETE][97] ([Intel XE#3226]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-lnl-2/igt@kms_cursor_legacy@forked-bo@pipe-b.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-8/igt@kms_cursor_legacy@forked-bo@pipe-b.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [SKIP][99] ([Intel XE#2316]) -> [PASS][100] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@dpms-off-confusion@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][101] ([Intel XE#4543]) -> [PASS][102] +10 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-adlp-8/igt@kms_flip@dpms-off-confusion@c-hdmi-a1.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-1/igt@kms_flip@dpms-off-confusion@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][103] ([Intel XE#301]) -> [PASS][104] +1 other test pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][105] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_lease@lessee-list@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][107] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][108] +8 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-adlp-4/igt@kms_lease@lessee-list@pipe-a-hdmi-a-1.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-2/igt@kms_lease@lessee-list@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][109] ([Intel XE#4596]) -> [PASS][110] +1 other test pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][111] ([Intel XE#1435]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#4208]) -> [PASS][114] +277 other tests pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#1392]) -> [PASS][116] +2 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#4208] / [i915#2575]) -> [SKIP][118] ([Intel XE#623])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#316]) -> [SKIP][120] ([Intel XE#2351] / [Intel XE#4208])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#4208]) -> [SKIP][122] ([Intel XE#316]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#316]) -> [SKIP][124] ([Intel XE#4208])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][126] ([Intel XE#1124]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#607]) -> [SKIP][128] ([Intel XE#2351] / [Intel XE#4208])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#4208]) -> [SKIP][130] ([Intel XE#610])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#4208]) -> [SKIP][132] ([Intel XE#1124]) +9 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1124]) -> [SKIP][134] ([Intel XE#4208]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#4208]) -> [SKIP][136] ([Intel XE#607])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#610]) -> [SKIP][138] ([Intel XE#4208])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1124]) -> [SKIP][140] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#2191]) -> [SKIP][142] ([Intel XE#4208] / [i915#2575])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#4208] / [i915#2575]) -> [SKIP][144] ([Intel XE#2191]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#4208] / [i915#2575]) -> [SKIP][146] ([Intel XE#367]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#367]) -> [SKIP][148] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#4208]) -> [SKIP][150] ([Intel XE#2907])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#4208]) -> [SKIP][152] ([Intel XE#3442])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][154] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][155] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][156] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][157] ([Intel XE#3124]) -> [INCOMPLETE][158] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][160] ([Intel XE#4208]) +11 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#4208]) -> [SKIP][162] ([Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][164] ([Intel XE#2351] / [Intel XE#4208])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][166] ([Intel XE#4418])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#306]) -> [SKIP][168] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_chamelium_color@ctm-0-50.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#4208] / [i915#2575]) -> [SKIP][170] ([Intel XE#306]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_chamelium_color@gamma.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#373]) -> [SKIP][172] ([Intel XE#4208] / [i915#2575]) +9 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#4208] / [i915#2575]) -> [SKIP][174] ([Intel XE#373]) +13 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#307]) -> [SKIP][176] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#4208] / [i915#2575]) -> [FAIL][178] ([Intel XE#1178]) +1 other test fail
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_content_protection@legacy.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][179] ([Intel XE#2341]) -> [FAIL][180] ([Intel XE#1178])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#4208] / [i915#2575]) -> [SKIP][182] ([Intel XE#308])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#308]) -> [SKIP][184] ([Intel XE#4208] / [i915#2575])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#455]) -> [SKIP][186] ([Intel XE#4208] / [i915#2575]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#4208] / [i915#2575]) -> [SKIP][188] ([Intel XE#323])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#4356]) -> [SKIP][190] ([Intel XE#4208])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_dp_link_training@uhbr-mst.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#455]) -> [SKIP][192] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#4208]) -> [SKIP][194] ([Intel XE#4422]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#4208]) -> [SKIP][196] ([Intel XE#776])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_fbcon_fbt@psr.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#776]) -> [SKIP][198] ([Intel XE#4208])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#4208] / [i915#2575]) -> [SKIP][200] ([Intel XE#701])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#4208] / [i915#2575]) -> [SKIP][202] ([Intel XE#1138])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_feature_discovery@display-4x.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1137]) -> [SKIP][204] ([Intel XE#4208] / [i915#2575])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#4208]) -> [SKIP][206] ([Intel XE#455]) +7 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][208] ([Intel XE#455]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#455]) -> [SKIP][210] ([Intel XE#4208]) +3 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#4208]) -> [SKIP][212] ([Intel XE#651]) +25 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#651]) -> [SKIP][214] ([Intel XE#2351] / [Intel XE#4208]) +9 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][215] ([Intel XE#2312]) -> [SKIP][216] ([Intel XE#2311]) +7 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][218] ([Intel XE#651]) +18 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][219] ([Intel XE#5390]) -> [SKIP][220] ([Intel XE#2312]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][221] ([Intel XE#2312]) -> [SKIP][222] ([Intel XE#5390]) +3 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#651]) -> [SKIP][224] ([Intel XE#4208]) +19 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][225] ([Intel XE#2311]) -> [SKIP][226] ([Intel XE#2312]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#658]) -> [SKIP][228] ([Intel XE#2351] / [Intel XE#4208])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#4208]) -> [SKIP][230] ([Intel XE#653]) +32 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][231] ([Intel XE#2313]) -> [SKIP][232] ([Intel XE#2312]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#653]) -> [SKIP][234] ([Intel XE#2351] / [Intel XE#4208]) +12 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#4208]) -> [SKIP][236] ([Intel XE#1158])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][237] ([Intel XE#2312]) -> [SKIP][238] ([Intel XE#2313]) +5 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][240] ([Intel XE#653]) +12 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#653]) -> [SKIP][242] ([Intel XE#4208]) +18 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#346]) -> [SKIP][244] ([Intel XE#4208])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#4208]) -> [SKIP][246] ([Intel XE#4298])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_joiner@basic-max-non-joiner.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#4208]) -> [SKIP][248] ([Intel XE#2927])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#2925]) -> [SKIP][250] ([Intel XE#4208])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#4208]) -> [SKIP][252] ([Intel XE#2925])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#4208] / [i915#2575]) -> [SKIP][254] ([Intel XE#356])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#4208] / [i915#2575]) -> [FAIL][256] ([Intel XE#616])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_plane_cursor@primary.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_plane_cursor@primary.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#4208]) -> [SKIP][258] ([Intel XE#2938])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#870]) -> [SKIP][260] ([Intel XE#4208])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#4208]) -> [SKIP][262] ([Intel XE#870]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1122]) -> [SKIP][264] ([Intel XE#2351] / [Intel XE#4208])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#4208]) -> [SKIP][266] ([Intel XE#3309])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][268] ([Intel XE#1406] / [Intel XE#1489]) +11 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][270] ([Intel XE#1406] / [Intel XE#4208]) +8 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][272] ([Intel XE#1122] / [Intel XE#1406])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][274] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][276] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) -> [SKIP][278] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_psr@pr-dpms.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][280] ([Intel XE#1406] / [Intel XE#4208]) +3 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_psr@psr2-basic.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_psr@psr2-basic.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#1406] / [Intel XE#2939]) -> [SKIP][282] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1406] / [Intel XE#2939]) -> [SKIP][284] ([Intel XE#1406] / [Intel XE#4208])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#4208] / [i915#2575]) -> [SKIP][286] ([Intel XE#1127])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#4208] / [i915#2575]) -> [SKIP][288] ([Intel XE#3414])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#1127]) -> [SKIP][290] ([Intel XE#4208] / [i915#2575])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#3414]) -> [SKIP][292] ([Intel XE#4208] / [i915#2575])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][293] ([Intel XE#1729]) -> [SKIP][294] ([Intel XE#4208] / [i915#2575])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][295] ([Intel XE#2426]) -> [SKIP][296] ([Intel XE#2509])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#4208] / [i915#2575]) -> [SKIP][298] ([Intel XE#1500])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#4208] / [i915#2575]) -> [SKIP][300] ([Intel XE#455]) +14 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_vrr@flipline.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#4208] / [i915#2575]) -> [SKIP][302] ([Intel XE#2168])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_vrr@lobf.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_vrr@lobf.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][304] ([Intel XE#4208] / [i915#2575])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#4208] / [i915#2575]) -> [SKIP][306] ([Intel XE#1091] / [Intel XE#2849])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [FAIL][307] ([Intel XE#5890]) -> [SKIP][308] ([Intel XE#4208])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#4208]) -> [SKIP][310] ([Intel XE#1123]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#4208]) -> [SKIP][312] ([Intel XE#1126])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#1126]) -> [SKIP][314] ([Intel XE#4208])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#944]) -> [SKIP][316] ([Intel XE#4208]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@xe_create@multigpu-create-massive-size.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#4208]) -> [SKIP][318] ([Intel XE#5626])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_eu_stall@invalid-gt-id.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eu_stall@non-blocking-re-enable:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#5626]) -> [SKIP][320] ([Intel XE#4208])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@xe_eu_stall@non-blocking-re-enable.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_eu_stall@non-blocking-re-enable.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#4837]) -> [SKIP][322] ([Intel XE#4208]) +17 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@xe_eudebug@basic-close.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#4208]) -> [SKIP][324] ([Intel XE#4837]) +17 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#4208]) -> [SKIP][326] ([Intel XE#4518])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_eudebug_sriov@deny-sriov.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#1392]) -> [SKIP][328] ([Intel XE#4208]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#288]) -> [SKIP][330] ([Intel XE#4208]) +23 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#4208]) -> [SKIP][332] ([Intel XE#288]) +35 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#4208]) -> [SKIP][334] ([Intel XE#2360])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#4915]) -> [SKIP][336] ([Intel XE#4208]) +263 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#4208]) -> [SKIP][338] ([Intel XE#4915]) +362 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-lnl:          [ABORT][339] ([Intel XE#5466]) -> [ABORT][340] ([Intel XE#4917] / [Intel XE#5466])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-lnl-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#3573]) -> [SKIP][342] ([Intel XE#4208]) +6 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@xe_oa@disabled-read-error.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#4208]) -> [SKIP][344] ([Intel XE#3573]) +10 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_oa@polling-small-buf.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@xe_oa@polling-small-buf.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#4208]) -> [SKIP][346] ([Intel XE#1337])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#4208]) -> [SKIP][348] ([Intel XE#979])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][349] ([Intel XE#1173]) -> [SKIP][350] ([Intel XE#1061] / [Intel XE#4208])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@xe_peer2peer@read.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-i2c:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#5694]) -> [SKIP][352] ([Intel XE#4208])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@xe_pm@d3cold-i2c.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][354] ([Intel XE#4208]) +1 other test skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#4208]) -> [SKIP][356] ([Intel XE#2284])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_pm@d3cold-mocs.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#4208]) -> [SKIP][358] ([Intel XE#4650])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_pmu@fn-engine-activity-load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#4208]) -> [SKIP][360] ([Intel XE#4733]) +4 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#4733]) -> [SKIP][362] ([Intel XE#4208]) +3 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#4208]) -> [SKIP][364] ([Intel XE#944]) +2 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_query@multigpu-query-mem-usage.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#4814]) -> [SKIP][366] ([Intel XE#4208]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@xe_render_copy@render-stress-4-copies.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#4208]) -> [SKIP][368] ([Intel XE#4821])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_spin_batch@spin-mem-copy.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#3342]) -> [SKIP][370] ([Intel XE#4208])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#4208]) -> [SKIP][372] ([Intel XE#4273])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_sriov_flr@flr-twice.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#4208]) -> [SKIP][374] ([Intel XE#3342])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488
  [Intel XE#5503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5503
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba -> xe-pw-153731v1

  IGT_8517: 8517
  xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba: 73ec1b82fc684756350c4bb8ee675158ef439bba
  xe-pw-153731v1: 153731v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/index.html

--===============2017699518794458450==
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
<tr><td><b>Series:</b></td><td>Different sized pages support in migrate layer</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153731/">https://patchwork.freedesktop.org/series/153731/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba_FULL -&gt; xe-pw-153731v1_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-153731v1_FULL need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-153731v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-153731v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_oa@buffer-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@xe_oa@buffer-size.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153731v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +230 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +88 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-adlp-8/igt@kms_flip@flip-vs-rmfb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-6/igt@kms_flip@flip-vs-rmfb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +194 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-4/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_eu_stall@blocking-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-8/igt@xe_evict@evict-large-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-mlock:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-8/igt@xe_exec_system_allocator@once-large-mmap-mlock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +103 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-8/igt@xe_exec_system_allocator@twice-large-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488">Intel XE#5488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-8/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-463/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@core_getversion@all-cards.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@fbdev@nullptr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> +124 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-b:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-lnl-2/igt@kms_cursor_legacy@forked-bo@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-8/igt@kms_cursor_legacy@forked-bo@pipe-b.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-adlp-8/igt@kms_flip@dpms-off-confusion@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-1/igt@kms_flip@dpms-off-confusion@c-hdmi-a1.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-1/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-adlp-4/igt@kms_lease@lessee-list@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-adlp-2/igt@kms_lease@lessee-list@pipe-a-hdmi-a-1.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> +277 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-7/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_plane_cursor@primary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890">Intel XE#5890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_eu_stall@invalid-gt-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@xe_eu_stall@non-blocking-re-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_eu_stall@non-blocking-re-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +263 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +362 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-lnl-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@xe_oa@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_oa@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-464/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-433/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@xe_render_copy@render-stress-4-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_render_copy@render-stress-4-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_spin_batch@spin-mem-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-435/igt@xe_spin_batch@spin-mem-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821">Intel XE#4821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba/shard-dg2-434/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153731v1/shard-dg2-436/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba -&gt; xe-pw-153731v1</li>
</ul>
<p>IGT_8517: 8517<br />
  xe-3641-73ec1b82fc684756350c4bb8ee675158ef439bba: 73ec1b82fc684756350c4bb8ee675158ef439bba<br />
  xe-pw-153731v1: 153731v1</p>

</body>
</html>

--===============2017699518794458450==--
