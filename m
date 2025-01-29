Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED100C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 21:35:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DD110E1AA;
	Wed, 29 Jan 2025 21:35:02 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8634110E1AA;
 Wed, 29 Jan 2025 21:35:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3363300611880640181=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_PMU_Support_for_per-engine?=
 =?utf-8?q?-class_activity_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 21:35:01 -0000
Message-ID: <173818650152.2599720.15340346413121333256@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129101653.1976699-1-riana.tauro@intel.com>
In-Reply-To: <20250129101653.1976699-1-riana.tauro@intel.com>
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

--===============3363300611880640181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PMU Support for per-engine-class activity (rev2)
URL   : https://patchwork.freedesktop.org/series/143138/
State : failure

== Summary ==

CI Bug Log - changes from xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3_full -> xe-pw-143138v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-143138v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-143138v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-143138v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_mmap_write_crc@main:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-4/igt@kms_mmap_write_crc@main.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@kms_mmap_write_crc@main.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-adlp:         [PASS][3] -> [ABORT][4] +3 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  
Known issues
------------

  Here are the changes found in xe-pw-143138v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#3249])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@core_setmaster@master-drop-set-user.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@info:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#2134]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@fbdev@info.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@fbdev@info.html

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#2134])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@fbdev@unaligned-read.html

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     [PASS][10] -> [SKIP][11] ([Intel XE#2134])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@fbdev@unaligned-write.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@fbdev@unaligned-write.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [PASS][12] -> [SKIP][13] ([Intel XE#2423] / [i915#2575]) +72 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_atomic@plane-invalid-params-fence.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [PASS][14] -> [SKIP][15] ([Intel XE#2136]) +23 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1124]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1407])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#2136]) +19 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_big_fb@x-tiled-addfb.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#2136]) +13 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1124]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1124])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#2191])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][27] ([Intel XE#2625])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#3432])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#787]) +153 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#314]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#306])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-2/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#373])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#1178])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#3304])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][35] ([Intel XE#1178])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2321])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1424])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][38] -> [DMESG-WARN][39] ([Intel XE#4172]) +10 other tests dmesg-warn
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#309])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#2291])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [PASS][43] -> [INCOMPLETE][44] ([Intel XE#3226])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [PASS][45] -> [DMESG-WARN][46] ([Intel XE#877])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#323])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][48] ([Intel XE#3321]) +2 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1421])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#2316])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][52] -> [DMESG-WARN][53] ([Intel XE#2953]) +2 other tests dmesg-warn
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@d-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][54] ([Intel XE#4172]) +5 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1401] / [Intel XE#1745])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1401])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2293]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#455]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-dg2-set2:     [PASS][59] -> [SKIP][60] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#656]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#651]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#656]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#651]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#653])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#653])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1470] / [Intel XE#2853])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1503])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#2934])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_lease@possible-crtcs-filtering:
    - shard-bmg:          [PASS][71] -> [SKIP][72] ([Intel XE#2423]) +79 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_lease@possible-crtcs-filtering.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_lease@possible-crtcs-filtering.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][73] ([Intel XE#1033] / [Intel XE#2625] / [Intel XE#4080])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][74] ([Intel XE#616]) +2 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#599])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#455])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#2763]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#2763]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#2763] / [Intel XE#455])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2763]) +7 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#2446]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_pm_rpm@basic-rte.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2-set2:     [PASS][83] -> [SKIP][84] ([Intel XE#2446]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_pm_rpm@i2c.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#2446]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1406]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#2850] / [Intel XE#929])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-2/igt@kms_psr@psr-basic.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1435])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#330])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2423] / [i915#2575]) +13 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_vrr@flipline.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1280] / [Intel XE#455])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#2905])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_evict@evict-beng-small-external:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#261] / [Intel XE#688])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#688]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][96] -> [SKIP][97] ([Intel XE#1130]) +126 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_exec_basic@many-null-rebind.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-dg2-set2:     [PASS][98] -> [SKIP][99] ([Intel XE#1392]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1392])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1392])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1130]) +21 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_threads@threads-bal-userptr-invalidate:
    - shard-dg2-set2:     [PASS][103] -> [DMESG-WARN][104] ([Intel XE#1033])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_exec_threads@threads-bal-userptr-invalidate.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-434/igt@xe_exec_threads@threads-bal-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][105] -> [SKIP][106] ([Intel XE#1130]) +176 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [PASS][107] -> [SKIP][108] ([Intel XE#1192]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@xe_live_ktest@xe_migrate.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_media_fill@media-fill:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#560])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][110] -> [FAIL][111] ([Intel XE#3546])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@xe_module_load@many-reload.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [PASS][112] -> [FAIL][113] ([Intel XE#3546])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_module_load@reload-no-display.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_module_load@reload-no-display.html

  * igt@xe_noexec_ping_pong:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#379])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@xe_noexec_ping_pong.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][115] ([Intel XE#1173])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][116] -> [ABORT][117] ([Intel XE#1358] / [Intel XE#1794])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][118] -> [ABORT][119] ([Intel XE#1358] / [Intel XE#1794]) +1 other test abort
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@xe_pm@s4-mocs.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-9/igt@xe_pm@s4-mocs.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [FAIL][120] ([Intel XE#3440]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@core_getversion@basic.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@core_getversion@basic.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#2134]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@fbdev@eof.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@fbdev@eof.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][124] ([Intel XE#2134]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@fbdev@nullptr.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@fbdev@nullptr.html

  * igt@kms_3d:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#2423]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_3d.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_3d.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#2423] / [i915#2575]) -> [PASS][129] +84 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [SKIP][130] ([Intel XE#2136]) -> [PASS][131] +18 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [DMESG-WARN][132] -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][134] ([Intel XE#2291]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - shard-bmg:          [DMESG-WARN][136] ([Intel XE#877]) -> [PASS][137] +2 other tests pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-d-dp-2.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-1/igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-d-dp-2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][138] ([Intel XE#3321]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][140] ([Intel XE#2423]) -> [PASS][141] +67 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-bmg:          [FAIL][142] ([Intel XE#2882]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-adlp:         [DMESG-WARN][144] ([Intel XE#4173]) -> [PASS][145] +6 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][147] +5 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#2136]) -> [PASS][149] +20 other tests pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [DMESG-WARN][150] ([Intel XE#4172]) -> [PASS][151] +9 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-adlp:         [DMESG-WARN][152] -> [PASS][153] +2 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-8/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-8/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-dg2-set2:     [DMESG-WARN][154] ([Intel XE#1033]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_pm_dc@dc5-dpms.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-434/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#2446]) -> [PASS][157] +3 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_pm_rpm@cursor-dpms.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [SKIP][158] ([Intel XE#2446]) -> [PASS][159] +2 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_rpm@legacy-planes-dpms.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][160] ([Intel XE#899]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [DMESG-WARN][162] ([Intel XE#2953]) -> [PASS][163] +3 other tests pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-bmg:          [SKIP][164] ([Intel XE#1130]) -> [PASS][165] +168 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1130]) -> [PASS][167] +141 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_exec_balancer@once-parallel-rebind.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#1392]) -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          [FAIL][170] ([Intel XE#1999]) -> [PASS][171] +2 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][172], [SKIP][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197]) ([Intel XE#378]) -> ([PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-2/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-2/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-4/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-2/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-2/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-2/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-4/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-9/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-4/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-4/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-9/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-9/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-8/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-8/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-8/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-8/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-9/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-6/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-6/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-6/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-6/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-9/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-9/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-3/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-9/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-9/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-9/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-4/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-2/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-4/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-2/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-4/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-4/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-3/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-3/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-3/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-2/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-2/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-2/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-8/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-8/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-8/igt@xe_module_load@load.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [DMESG-WARN][223] ([Intel XE#1033] / [Intel XE#569]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_pm@s3-mocs.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-434/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][225] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][227] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][228] +1 other test pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html
    - shard-dg2-set2:     [ABORT][229] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#2423] / [i915#2575]) -> [SKIP][232] ([Intel XE#873])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#3768]) -> [SKIP][234] ([Intel XE#2423] / [i915#2575])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_async_flips@invalid-async-flip-atomic.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_async_flips@invalid-async-flip-atomic.html
    - shard-bmg:          [SKIP][235] ([Intel XE#3768]) -> [SKIP][236] ([Intel XE#2423])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_async_flips@invalid-async-flip-atomic.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#316]) -> [SKIP][238] ([Intel XE#2136] / [Intel XE#2351])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#2136]) -> [SKIP][240] ([Intel XE#316]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][241] ([Intel XE#2136]) -> [SKIP][242] ([Intel XE#2327]) +5 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][244] ([Intel XE#316])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-bmg:          [SKIP][245] ([Intel XE#2327]) -> [SKIP][246] ([Intel XE#2136]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#316]) -> [SKIP][248] ([Intel XE#2136]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1124]) -> [SKIP][250] ([Intel XE#2136]) +7 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][252] ([Intel XE#1124])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][253] ([Intel XE#1124]) -> [SKIP][254] ([Intel XE#2136]) +8 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][255] ([Intel XE#2136]) -> [SKIP][256] ([Intel XE#2328])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1124]) -> [SKIP][258] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          [SKIP][259] ([Intel XE#2136]) -> [SKIP][260] ([Intel XE#1124]) +9 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][261] ([Intel XE#607]) -> [SKIP][262] ([Intel XE#2136])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#2136]) -> [SKIP][264] ([Intel XE#610])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2136]) -> [SKIP][266] ([Intel XE#1124]) +4 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][267] ([Intel XE#2423]) -> [SKIP][268] ([Intel XE#2314] / [Intel XE#2894])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2423] / [i915#2575]) -> [SKIP][270] ([Intel XE#2191]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#2191]) -> [SKIP][272] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][273] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][274] ([Intel XE#2423]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#367]) -> [SKIP][276] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][277] ([Intel XE#2423]) -> [SKIP][278] ([Intel XE#367]) +3 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#2423] / [i915#2575]) -> [SKIP][280] ([Intel XE#367]) +3 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][281] ([Intel XE#2887]) -> [SKIP][282] ([Intel XE#2136]) +17 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][283] ([Intel XE#2136]) -> [SKIP][284] ([Intel XE#2652] / [Intel XE#787]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][285] ([Intel XE#2136]) -> [SKIP][286] ([Intel XE#2887]) +11 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][288] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2136]) -> [SKIP][290] ([Intel XE#2907])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][292] ([Intel XE#2136]) +7 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][294] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][295] ([Intel XE#3432]) -> [SKIP][296] ([Intel XE#2136]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#2136]) -> [ABORT][298] ([Intel XE#2625])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#3442]) -> [SKIP][300] ([Intel XE#2136])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          [SKIP][301] ([Intel XE#2136]) -> [SKIP][302] ([Intel XE#3432]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2907]) -> [SKIP][304] ([Intel XE#2136])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2136]) -> [SKIP][306] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#314]) -> [SKIP][308] ([Intel XE#2136] / [Intel XE#2351])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][309] ([Intel XE#2724]) -> [SKIP][310] ([Intel XE#2136])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_cdclk@plane-scaling.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          [SKIP][311] ([Intel XE#2423]) -> [SKIP][312] ([Intel XE#2252]) +8 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][313] ([Intel XE#2423]) -> [SKIP][314] ([Intel XE#2325])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][315] ([Intel XE#2325]) -> [SKIP][316] ([Intel XE#2423])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_chamelium_color@degamma.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][317] ([Intel XE#2252]) -> [SKIP][318] ([Intel XE#2423]) +10 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2423] / [i915#2575]) -> [SKIP][320] ([Intel XE#373]) +7 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#373]) -> [SKIP][322] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][323] ([Intel XE#2423]) -> [FAIL][324] ([Intel XE#1178])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_content_protection@atomic.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][325] ([Intel XE#2341]) -> [SKIP][326] ([Intel XE#2423]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_content_protection@content-type-change.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2423] / [i915#2575]) -> [SKIP][328] ([Intel XE#307])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-1.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2423] / [i915#2575]) -> [FAIL][330] ([Intel XE#1178])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_content_protection@lic-type-0.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][331] ([Intel XE#1178]) -> [SKIP][332] ([Intel XE#2341])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_content_protection@srm.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][333] ([Intel XE#2423]) -> [SKIP][334] ([Intel XE#2341]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_content_protection@uevent.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#308]) -> [SKIP][336] ([Intel XE#2423] / [i915#2575])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][337] ([Intel XE#2321]) -> [SKIP][338] ([Intel XE#2423]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-bmg:          [SKIP][339] ([Intel XE#2320]) -> [SKIP][340] ([Intel XE#2423]) +3 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][341] ([Intel XE#2423]) -> [SKIP][342] ([Intel XE#2320]) +4 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][343] ([Intel XE#2423]) -> [SKIP][344] ([Intel XE#2321]) +3 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-bmg:          [SKIP][345] ([Intel XE#2423]) -> [SKIP][346] ([Intel XE#2286]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#2423] / [i915#2575]) -> [SKIP][348] ([Intel XE#323])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][349] ([Intel XE#2423]) -> [SKIP][350] ([Intel XE#2291]) +2 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [SKIP][351] ([Intel XE#2291]) -> [SKIP][352] ([Intel XE#2423])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][353] ([Intel XE#2286]) -> [SKIP][354] ([Intel XE#2423])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][355] ([Intel XE#1508]) -> [SKIP][356] ([Intel XE#2136])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][357] ([Intel XE#2136]) -> [SKIP][358] ([Intel XE#2244])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#455]) -> [SKIP][360] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][361] ([Intel XE#4156]) -> [SKIP][362] ([Intel XE#2136])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_fbcon_fbt@fbc.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][363] ([Intel XE#776]) -> [SKIP][364] ([Intel XE#2136])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_fbcon_fbt@psr.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#2423] / [i915#2575]) -> [SKIP][366] ([Intel XE#701])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_feature_discovery@chamelium.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#703]) -> [SKIP][368] ([Intel XE#2423] / [i915#2575])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#1137]) -> [SKIP][370] ([Intel XE#2423] / [i915#2575])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][371] ([Intel XE#2423]) -> [SKIP][372] ([Intel XE#2374])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_feature_discovery@psr1.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [DMESG-WARN][373] ([Intel XE#4172]) -> [SKIP][374] ([Intel XE#2316])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][375] ([Intel XE#2316]) -> [SKIP][376] ([Intel XE#2423]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][377] ([Intel XE#2316]) -> [FAIL][378] ([Intel XE#3321])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [SKIP][379] ([Intel XE#2423]) -> [SKIP][380] ([Intel XE#2316]) +3 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][381] ([Intel XE#3321]) -> [SKIP][382] ([Intel XE#2423])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank.html
    - shard-dg2-set2:     [FAIL][383] ([Intel XE#301]) -> [SKIP][384] ([Intel XE#2423] / [i915#2575])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][386] ([Intel XE#455]) +2 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][387] ([Intel XE#2136]) -> [SKIP][388] ([Intel XE#2293] / [Intel XE#2380]) +5 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#2136]) -> [SKIP][390] ([Intel XE#455]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][391] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][392] ([Intel XE#2136]) +2 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#455]) -> [SKIP][394] ([Intel XE#2136]) +2 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][395] ([Intel XE#2136]) -> [SKIP][396] ([Intel XE#2311]) +23 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][397] ([Intel XE#2311]) -> [SKIP][398] ([Intel XE#2136]) +23 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][399] ([Intel XE#2312]) -> [SKIP][400] ([Intel XE#2311]) +3 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#2136]) -> [SKIP][402] ([Intel XE#651]) +14 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][403] ([Intel XE#2312]) -> [SKIP][404] ([Intel XE#2136]) +8 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#651]) -> [SKIP][406] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][407] ([Intel XE#2136]) -> [SKIP][408] ([Intel XE#4141]) +9 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][409] ([Intel XE#4141]) -> [SKIP][410] ([Intel XE#2312])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][411] ([Intel XE#2312]) -> [SKIP][412] ([Intel XE#4141]) +2 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [SKIP][413] ([Intel XE#4141]) -> [SKIP][414] ([Intel XE#2136]) +11 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#658]) -> [SKIP][416] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#651]) -> [SKIP][418] ([Intel XE#2136]) +15 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][419] ([Intel XE#2311]) -> [SKIP][420] ([Intel XE#2312]) +3 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][422] ([Intel XE#651]) +8 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#2136]) -> [SKIP][424] ([Intel XE#653]) +24 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][425] ([Intel XE#2313]) -> [SKIP][426] ([Intel XE#2136]) +23 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][427] ([Intel XE#2312]) -> [SKIP][428] ([Intel XE#2313]) +3 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][429] ([Intel XE#2313]) -> [SKIP][430] ([Intel XE#2312]) +3 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][431] ([Intel XE#2136]) -> [SKIP][432] ([Intel XE#2313]) +20 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][433] ([Intel XE#2352]) -> [SKIP][434] ([Intel XE#2136])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][435] ([Intel XE#2136]) -> [SKIP][436] ([Intel XE#2312]) +17 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#653]) -> [SKIP][438] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][440] ([Intel XE#653]) +2 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#653]) -> [SKIP][442] ([Intel XE#2136]) +18 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#455]) -> [SKIP][444] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [DMESG-WARN][445] ([Intel XE#4172]) -> [SKIP][446] ([Intel XE#2423])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][447] ([Intel XE#346]) -> [SKIP][448] ([Intel XE#2136])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#2136]) -> [SKIP][450] ([Intel XE#2927])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][451] ([Intel XE#2934]) -> [SKIP][452] ([Intel XE#2136])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][453] ([Intel XE#2136]) -> [SKIP][454] ([Intel XE#2927])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][455] ([Intel XE#2486]) -> [SKIP][456] ([Intel XE#2423])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_panel_fitting@legacy.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][457] ([Intel XE#1033]) -> [ABORT][458] ([Intel XE#1033] / [Intel XE#2625] / [Intel XE#4080])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#2423] / [i915#2575]) -> [FAIL][460] ([Intel XE#616])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_plane_cursor@primary.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][461] ([Intel XE#2393]) -> [SKIP][462] ([Intel XE#2423])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][463] ([Intel XE#2423]) -> [SKIP][464] ([Intel XE#2493])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#2423] / [i915#2575]) -> [SKIP][466] ([Intel XE#2763] / [Intel XE#455])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-bmg:          [SKIP][467] ([Intel XE#2763]) -> [SKIP][468] ([Intel XE#2423]) +1 other test skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][470] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][471] ([Intel XE#2423]) -> [SKIP][472] ([Intel XE#2763]) +1 other test skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#2136]) -> [SKIP][474] ([Intel XE#870])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][475] ([Intel XE#2136]) -> [SKIP][476] ([Intel XE#870]) +1 other test skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_backlight@fade.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][477] ([Intel XE#2136]) -> [SKIP][478] ([Intel XE#2392]) +1 other test skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][479] ([Intel XE#3309]) -> [SKIP][480] ([Intel XE#2136])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][481] ([Intel XE#2499]) -> [SKIP][482] ([Intel XE#2136])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_pm_lpsp@kms-lpsp.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][483] ([Intel XE#2446]) -> [SKIP][484] ([Intel XE#1439] / [Intel XE#836])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][485] ([Intel XE#1489]) -> [SKIP][486] ([Intel XE#2136]) +7 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][487] ([Intel XE#2136]) -> [SKIP][488] ([Intel XE#1489]) +7 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#1489]) -> [SKIP][490] ([Intel XE#2136]) +6 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#2136]) -> [SKIP][492] ([Intel XE#1489]) +7 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][493] ([Intel XE#2387]) -> [SKIP][494] ([Intel XE#2136])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][495] ([Intel XE#2136]) -> [SKIP][496] ([Intel XE#2234] / [Intel XE#2850]) +15 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][498] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][500] ([Intel XE#2850] / [Intel XE#929])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-page-flip.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][502] ([Intel XE#2136]) +7 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#2136]) -> [SKIP][504] ([Intel XE#2850] / [Intel XE#929]) +12 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][505] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][506] ([Intel XE#2136]) +13 other tests skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_psr@pr-sprite-plane-onoff.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#2136]) -> [SKIP][508] ([Intel XE#2939])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][509] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][510] ([Intel XE#2423]) +1 other test skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-90.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#2423] / [i915#2575]) -> [SKIP][512] ([Intel XE#1127])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#2423] / [i915#2575]) -> [SKIP][514] ([Intel XE#3414])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#3414]) -> [SKIP][516] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][517] ([Intel XE#2413]) -> [SKIP][518] ([Intel XE#2423])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][519] ([Intel XE#1435]) -> [SKIP][520] ([Intel XE#2423])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][521] ([Intel XE#2426]) -> [SKIP][522] ([Intel XE#2423])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#362]) -> [FAIL][524] ([Intel XE#1729])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          [SKIP][525] ([Intel XE#2450]) -> [SKIP][526] ([Intel XE#2423])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_tv_load_detect@load-detect.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-bmg:          [SKIP][527] ([Intel XE#2423]) -> [DMESG-WARN][528] ([Intel XE#4172]) +6 other tests dmesg-warn
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_vblank@wait-busy-hang.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_vblank@wait-busy-hang.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][529] ([Intel XE#2168]) -> [SKIP][530] ([Intel XE#2423])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_vrr@cmrr.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#2423] / [i915#2575]) -> [SKIP][532] ([Intel XE#455]) +7 other tests skip
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_vrr@flip-dpms.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][533] ([Intel XE#1499]) -> [SKIP][534] ([Intel XE#2423])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_vrr@flip-suspend.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][535] ([Intel XE#2423]) -> [SKIP][536] ([Intel XE#2168])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_vrr@lobf.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-bmg:          [SKIP][537] ([Intel XE#756]) -> [SKIP][538] ([Intel XE#2423])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-dg2-set2:     [SKIP][539] ([Intel XE#756]) -> [SKIP][540] ([Intel XE#2423] / [i915#2575])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#2423] / [i915#2575]) -> [SKIP][542] ([Intel XE#756])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#2423] / [i915#2575]) -> [SKIP][544] ([Intel XE#1091] / [Intel XE#2849])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][545] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][546] ([Intel XE#2423] / [i915#2575])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][547] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][548] ([Intel XE#1130])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#1130]) -> [SKIP][550] ([Intel XE#1280] / [Intel XE#455])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#1130]) -> [SKIP][552] ([Intel XE#1126])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][553] ([Intel XE#1130]) -> [SKIP][554] ([Intel XE#2905]) +11 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-bmg:          [SKIP][555] ([Intel XE#1130]) -> [SKIP][556] ([Intel XE#3889])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][557] ([Intel XE#1130]) -> [SKIP][558] ([Intel XE#2905]) +9 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][559] ([Intel XE#3889]) -> [SKIP][560] ([Intel XE#1130])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     [SKIP][561] ([Intel XE#2905]) -> [SKIP][562] ([Intel XE#1130]) +9 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][563] ([Intel XE#2905]) -> [SKIP][564] ([Intel XE#1130]) +7 other tests skip
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@xe_eudebug_online@single-step-one.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][565] ([Intel XE#2322]) -> [SKIP][566] ([Intel XE#1130]) +9 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][567] ([Intel XE#1392]) -> [SKIP][568] ([Intel XE#1130]) +2 other tests skip
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][569] ([Intel XE#1130]) -> [SKIP][570] ([Intel XE#2322]) +8 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
    - shard-dg2-set2:     [SKIP][571] ([Intel XE#1130]) -> [SKIP][572] ([Intel XE#1392]) +2 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-prefetch:
    - shard-bmg:          [SKIP][573] ([Intel XE#1130]) -> [DMESG-WARN][574] ([Intel XE#4172]) +2 other tests dmesg-warn
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-prefetch.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][575] ([Intel XE#288]) -> [SKIP][576] ([Intel XE#1130]) +23 other tests skip
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][577] ([Intel XE#1130]) -> [SKIP][578] ([Intel XE#288]) +24 other tests skip
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][579] ([Intel XE#1192]) -> [SKIP][580] ([Intel XE#2833])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][581] ([Intel XE#2459] / [Intel XE#2596]) -> [SKIP][582] ([Intel XE#1130])
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@xe_media_fill@media-fill.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][584] ([Intel XE#1130]) +6 other tests skip
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][585] ([Intel XE#1130]) -> [SKIP][586] ([Intel XE#2541] / [Intel XE#3573]) +6 other tests skip
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_oa@non-privileged-access-vaddr.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][587] ([Intel XE#1130]) -> [SKIP][588] ([Intel XE#2248])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          [SKIP][589] ([Intel XE#2248]) -> [SKIP][590] ([Intel XE#1130])
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@xe_oa@unprivileged-single-ctx-counters.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][591] ([Intel XE#1130]) -> [SKIP][592] ([Intel XE#1337])
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][593] ([Intel XE#1061]) -> [FAIL][594] ([Intel XE#1173])
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_peer2peer@write.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][595] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][596] ([Intel XE#1130]) +1 other test skip
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_pm@d3cold-basic.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#1130]) -> [SKIP][598] ([Intel XE#2284])
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_pm@d3cold-mocs.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][599] ([Intel XE#2284]) -> [SKIP][600] ([Intel XE#1130]) +2 other tests skip
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@xe_pm@d3cold-multiple-execs.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [SKIP][601] ([Intel XE#1130]) -> [ABORT][602] ([Intel XE#1358] / [Intel XE#1794])
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_pm@s3-multiple-execs.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [ABORT][603] ([Intel XE#1358] / [Intel XE#1794]) -> [SKIP][604] ([Intel XE#1130])
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [SKIP][605] ([Intel XE#1130]) -> [DMESG-WARN][606] ([Intel XE#4172] / [Intel XE#569])
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][607] ([Intel XE#1130]) -> [SKIP][608] ([Intel XE#579])
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][609] ([Intel XE#1130]) -> [SKIP][610] ([Intel XE#944]) +1 other test skip
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_query@multigpu-query-engines.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          [SKIP][611] ([Intel XE#1130]) -> [SKIP][612] ([Intel XE#944]) +3 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_query@multigpu-query-hwconfig.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][613] ([Intel XE#944]) -> [SKIP][614] ([Intel XE#1130]) +1 other test skip
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          [SKIP][615] ([Intel XE#944]) -> [SKIP][616] ([Intel XE#1130]) +1 other test skip
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     [SKIP][617] ([Intel XE#1130]) -> [SKIP][618] ([Intel XE#4130])
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [SKIP][619] ([Intel XE#1130]) -> [SKIP][620] ([Intel XE#4130])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][621] ([Intel XE#3342]) -> [SKIP][622] ([Intel XE#1130])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_sriov_flr@flr-vf1-clear.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
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
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4080
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3 -> xe-pw-143138v2

  IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3: 683350734da38bc7332a3b87c9f2faf6bbeeb5a3
  xe-pw-143138v2: 143138v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/index.html

--===============3363300611880640181==
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
<tr><td><b>Series:</b></td><td>PMU Support for per-engine-class activity (r=
ev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143138/">https://patchwork.freedesktop.org/series/143138/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-143138v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143138v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2569-683350734da38bc7332a3b87c9f2faf6b=
beeb5a3_full -&gt; xe-pw-143138v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-143138v2_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-143138v2_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1431=
38v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_mmap_write_crc@main:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-4/igt@kms_mma=
p_write_crc@main.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@kms_mmap_write_crc@main.htm=
l">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-2/igt@xe_faul=
t_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/s=
hard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lme=
m_ready.html">ABORT</a> +3 other tests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143138v2_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@core_set=
master@master-drop-set-user.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@core_setmaster@ma=
ster-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@fbdev@in=
fo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-143138v2/shard-bmg-3/igt@fbdev@info.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@fbdev@unaligned-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
34">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@fbdev@=
unaligned-write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@fbdev@unaligned-write.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_at=
omic@plane-invalid-params-fence.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_atomic@=
plane-invalid-params-fence.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +72 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_bi=
g_fb@4-tiled-addfb-size-overflow.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_big_fb=
@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +23 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_big_fb@linear-16bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_big_=
fb@x-tiled-addfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_big_fb@x-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_big_fb@yf-tiled-8bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_bw@connected-linear-tilin=
g-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_ccs@bad-pixel-format-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-2.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_ccs@crc-primary-suspend=
-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +153 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-adlp-2/igt@kms_chamelium_color@ctm-nega=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_chamelium_edid@dp-edid-re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_content_protection@atomic=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@kms_content_protection@srm@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_cursor_crc@cursor-random-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-m=
ovement-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_curs=
or_crc@cursor-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-1/igt@kms_cursor_crc@cursor-s=
uspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4172">Intel XE#4172</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_cursor_legacy@2x-cursor-v=
s-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_curs=
or_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_c=
ursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_cu=
rsor_legacy@cursora-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-434=
/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">=
Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-7/igt@kms_cursor_=
legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-v=
blank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_flip@2x-flip-vs-panning.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_flip=
@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/ig=
t@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#=
2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +2 other test=
s dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_flip@single-buffer-flip-v=
s-dpms-off-vs-modeset@d-hdmi-a3.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +5 other=
 tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE=
#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32=
bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_fl=
ip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/sha=
rd-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscal=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
drrs-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests=
 skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1470">Intel XE#1470</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_hdr@static-toggle-suspend=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@possible-crtcs-filtering:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_leas=
e@possible-crtcs-filtering.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_lease@possible=
-crtcs-filtering.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a>) +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-=
read-crc@pipe-d-hdmi-a-2.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4080">Intel XE#40=
80</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@kms_plane_multiple@tiling-4.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_plane_scaling@plane-downs=
cale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_pm_r=
pm@basic-rte.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_pm_rpm@basic-rte.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">I=
ntel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_pm=
_rpm@i2c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#=
2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_pm_rpm@system-suspend-m=
odeset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_psr@fbc-pr-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_psr@pr-primary-page-fli=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-adlp-2/igt@kms_psr@psr-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_setmode@invalid-clone-exc=
lusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_vrr@flipline.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">=
Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2575">i915#2575</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@xe_compute_preempt@compute-=
threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1=
280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@xe_eudebug@multigpu-basic-cli=
ent-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@xe_evict@evict-beng-small-ex=
ternal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit=
-parallel-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_exe=
c_basic@many-null-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_exec_basic@many=
-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1130">Intel XE#1130</a>) +126 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-null-rebind.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg=
2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
92">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race=
:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-adlp-2/igt@xe_exec_basic@multigpu-no-ex=
ec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exe=
c-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-us=
erptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1130">Intel XE#1130</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_exe=
c_threads@threads-bal-userptr-invalidate.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-434/igt@xe=
_exec_threads@threads-bal-userptr-invalidate.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@xe_fault=
_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/sha=
rd-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_ea=
rly.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1130">Intel XE#1130</a>) +176 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@xe_live_=
ktest@xe_migrate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-143138v2/shard-bmg-2/igt@xe_live_ktest@xe_migrate.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@xe_modul=
e_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@xe_module_load@many-reload=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_mod=
ule_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_module_load@r=
eload-no-display.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@xe_noexec_ping_pong.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/379"=
>Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_pm@=
s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@xe_pm@s2idle-vm-b=
ind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@xe_pm@s=
4-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-143138v2/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#135=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794=
">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@core_g=
etversion@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3440">Intel XE#3440</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@core_getversi=
on@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@fbdev@=
eof.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@fbdev@eof.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@fbdev@nu=
llptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@fbdev@nullptr.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_3d=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_3d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_at=
omic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_atomic_transition@modeset-trans=
ition-nonblocking-fencing.html">PASS</a> +84 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_big_=
fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_=
big_fb@linear-16bpp-rotate-180.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_bw=
@connected-linear-tiling-2-displays-1920x1080p.html">DMESG-WARN</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg=
2-434/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-b=
mg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-d-dp-2:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_disp=
lay_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-d-dp-2.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">In=
tel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-143138v2/shard-bmg-1/igt@kms_display_modes@extended-mode-basic@pipe-b=
-hdmi-a-3-pipe-d-dp-2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143138v2/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@c=
d-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +67 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@kms_flip=
@plain-flip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-4/igt@kms_fli=
p@plain-flip-fb-recreate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">In=
tel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-143138v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-p=
ri-indfb-draw-mmap-wc.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primsc=
rn-cur-indfb-onoff.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/s=
hard-dg2-436/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">=
PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shar=
d-bmg-7/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +9 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-8/igt@kms_pla=
ne_scaling@plane-upscale-20x20-with-modifiers.html">DMESG-WARN</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adl=
p-8/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">PASS</a>=
 +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_pm=
_dc@dc5-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-434/igt@kms_pm_dc@=
dc5-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_pm=
_rpm@cursor-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@kms_pm_rpm@c=
ursor-dpms.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_r=
pm@legacy-planes-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_pm_rp=
m@legacy-planes-dpms.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-lnl-2/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl=
-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@kms_vbl=
ank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-ad=
lp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> +3 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_exec_=
balancer@many-parallel-userptr-invalidate.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard=
-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">PASS</a>=
 +168 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_exe=
c_balancer@once-parallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/=
igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> +141 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard=
-dg2-436/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_live_=
ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-b=
mg-5/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> +2 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-2/igt@x=
e_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-ad=
lp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a=
3/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bb=
eeb5a3/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2f=
af6bbeeb5a3/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87=
c9f2faf6bbeeb5a3/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332=
a3b87c9f2faf6bbeeb5a3/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38b=
c7332a3b87c9f2faf6bbeeb5a3/shard-adlp-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734=
da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-6833=
50734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569=
-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-8/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-9/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-ad=
lp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/sha=
rd-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a=
3/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bb=
eeb5a3/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2f=
af6bbeeb5a3/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87=
c9f2faf6bbeeb5a3/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332=
a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38b=
c7332a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-143138v2/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-9=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1431=
38v2/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-9/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-143138v2/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-a=
dlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143138v2/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-143138v2/shard-adlp-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/sh=
ard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-143138v2/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-4/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-143138v2/shard-adlp-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138=
v2/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143138v2/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adl=
p-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43138v2/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-adlp-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-143138v2/shard-adlp-8/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shar=
d-adlp-8/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_pm@=
s3-mocs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-434/igt@xe_=
pm@s3-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-lnl-2/igt@xe_pm@s4=
-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-lnl-8/ig=
t@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1431=
38v2/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> +1 other t=
est pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_pm@=
s4-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-=
436/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_as=
ync_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shar=
d-dg2-436/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_as=
ync_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-4=
33/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_asyn=
c_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/i=
gt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_bi=
g_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@k=
ms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_bi=
g_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt=
@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_big_=
fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_=
big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_bi=
g_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard=
-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_big_=
fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms=
_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@km=
s_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_bi=
g_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@=
kms_big_fb@y-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/sha=
rd-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_big_=
fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_=
big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_big_=
fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_big_fb@y-t=
iled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel =
XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143138v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_big_=
fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@km=
s_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_big_=
fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-=
3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_bi=
g_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436=
/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel=
 XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-143138v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rota=
te-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/sh=
ard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314=
">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_bw=
@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-143138v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1=
920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_bw=
@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/=
shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143138v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x=
2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_bw=
@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-43=
3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_bw@l=
inear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/=
igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_bw=
@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1431=
38v2/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_ccs@=
bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3=
/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a=
>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_ccs@=
bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/ig=
t@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#7=
87</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_ccs@=
crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-=
6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887=
</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_cc=
s@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2=
351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43138v2/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shar=
d-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">In=
tel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-143138v2/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12=
-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-143138v2/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-g=
en12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bm=
g-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/sha=
rd-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625"=
>Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2=
-433/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_ccs@=
crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/ig=
t@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433=
/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-=
436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt=
@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#235=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_cdclk@plane=
-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cham=
elium_audio@hdmi-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms=
_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +8 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cham=
elium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_chamel=
ium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_cham=
elium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_chameli=
um_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_cham=
elium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/=
igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)=
 +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ch=
amelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1431=
38v2/shard-dg2-436/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">=
Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_ch=
amelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-=
433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_conte=
nt_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_cont=
ent_protection@content-type-change.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/=
igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_co=
ntent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v=
2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel=
 XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_co=
ntent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard=
-dg2-436/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_cu=
rsor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/=
igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915=
#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_curs=
or_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@km=
s_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_curs=
or_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg=
-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_curs=
or_crc@cursor-sliding-256x85.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@km=
s_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@k=
ms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_curs=
or_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/=
shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2286">Intel XE#2286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-b=
efore-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel =
XE#2286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143138v2/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor=
-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_dirt=
yfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_dirty=
fb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_dsc@=
dsc-fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_dsc@dsc-=
fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_ds=
c@dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_dsc@=
dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_fbco=
n_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4156">Intel XE#4156</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_fbcon_fbt@fbc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_fbco=
n_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_fbcon_fbt@psr.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_fe=
ature_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-d=
g2-436/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_=
feature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_feature_=
discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1431=
38v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/s=
hard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
23">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-7/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_flip=
@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_=
flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_flip=
@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_fli=
p@flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_f=
lip@flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143138v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-yti=
leccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-143138v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-=
ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#=
2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile=
-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-143138v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32b=
pp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
138v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143138v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-143138v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1431=
38v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1431=
38v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43138v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1431=
38v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4141">Intel XE#4141</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1431=
38v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43138v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/=
igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)=
 +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt=
@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#235=
1</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/=
igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#23=
11</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3138v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-p=
lflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#=
2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2=
p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43138v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
138v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
138v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-143138v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1431=
38v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2313">Intel XE#2313</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/ig=
t@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1431=
38v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE=
#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
143138v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt=
@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_hdr@invalid-h=
dr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_hdr@=
static-toggle-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms=
_hdr@static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_join=
er@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_joiner@ba=
sic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_jo=
iner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@kms_j=
oiner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_join=
er@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg=
-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_join=
er@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/ig=
t@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_pane=
l_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_panel_fitt=
ing@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_pi=
pe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-4=
32/igt@kms_pipe_crc_basic@suspend-read-crc.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel X=
E#2625</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4080">Intel XE#4080</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_pl=
ane_cursor@primary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/=
igt@kms_plane_cursor@primary.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_plan=
e_lowres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_plane_lo=
wres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_plane_m=
ultiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-=
factor-0-25-upscale-20x20.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_plan=
e_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143138v2/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-=
upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_pl=
ane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-143138v2/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x2=
0-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143=
138v2/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-fact=
or-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2763">Intel XE#2763</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_pm=
_backlight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@kms=
_pm_backlight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_b=
acklight@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_pm_backlight@=
fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_d=
c@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@kms_pm_dc@dc5-psr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2392">Intel XE#2392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_pm_dc=
@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_pm_l=
psp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2499">Intel XE#2499</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_pm_lpsp@kms-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_pm_=
rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_psr2=
_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shar=
d-bmg-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">In=
tel XE#2136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_psr2=
_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#21=
36</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
3138v2/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed=
-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_ps=
r2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/sha=
rd-dg2-433/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ps=
r2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/s=
hard-dg2-436/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
89">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_psr2_su@=
page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_psr@=
fbc-pr-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_psr@fbc-p=
r-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +15 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_ps=
r@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-=
dg2-433/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Inte=
l XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ps=
r@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shar=
d-dg2-436/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Int=
el XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_ps=
r@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2=
-433/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ps=
r@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@=
kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)=
 +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_psr@=
pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3=
/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ps=
r_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/s=
hard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/29=
39">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_rota=
tion_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shar=
d-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43138v2/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43138v2/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_ro=
tation_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/=
igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_scal=
ing_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/=
igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_setm=
ode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/ig=
t@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-434/igt@=
kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_vbla=
nk@wait-busy-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_vblank@wa=
it-busy-hang.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +6 other tests dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_vrr@=
cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_vrr@cmrr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Int=
el XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_vr=
r@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@kms=
_vrr@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_vrr@=
flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@kms_vrr@flip-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Int=
el XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_writ=
eback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/ig=
t@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</l=
i>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_wr=
iteback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433=
/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_wr=
iteback@writeback-pixel-formats.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/s=
hard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#75=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@sriov_=
basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/sh=
ard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#109=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849=
">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@sriov_=
basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel =
XE#2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-143138v2/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvf=
s-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_com=
pute_preempt@compute-preempt-many.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/s=
hard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE=
#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_com=
pute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-=
dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel =
XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_cop=
y_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@=
xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_eud=
ebug@basic-vm-access-parameters.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/=
igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +11 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_eudeb=
ug@basic-vm-access-parameters-userptr.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg=
-6/igt@xe_eudebug@basic-vm-access-parameters-userptr.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#388=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_eudeb=
ug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5=
/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a=
>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_eud=
ebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-4=
33/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_eud=
ebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-=
dg2-433/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel =
XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@xe_eudeb=
ug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@xe_eu=
debug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Inte=
l XE#2322</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-143138v2/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-v=
m-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg=
2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v=
2/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2322">Intel XE#2322</a>) +8 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1431=
38v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-re=
bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_exec_=
fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-prefetch.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
30">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-143138v2/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-bi=
ndexecqueue-userptr-invalidate-prefetch.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) =
+2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_exe=
c_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#=
288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43138v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-re=
bind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1130">Intel XE#1130</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shar=
d-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Int=
el XE#288</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@xe_live_=
ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-4/igt@xe_live_ktest@=
xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@xe_media=
_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/ig=
t@xe_media_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_oa@=
closed-fd-and-unmapped-access.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/sha=
rd-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_oa@=
non-privileged-access-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@x=
e_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)=
 +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_oa@oa=
-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@xe_oa@oa-tlb-in=
validate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@xe_oa@un=
privileged-single-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/ig=
t@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_pat=
@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-466/igt@xe_p=
at@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_pee=
r2peer@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@xe_peer2peer@wri=
te.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_pm@=
d3cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_p=
m@d3cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_pm@=
d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@xe_pm@d3cold-mocs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/igt@xe_pm@d3col=
d-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_pm@=
s3-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-432/igt@xe_pm@s3-mu=
ltiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_pm@=
s3-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-=
433/igt@xe_pm@s3-vm-bind-unbind-all.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_pm@s3=
-vm-bind-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@xe_pm@s3-vm-bi=
nd-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_pm@vr=
am-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-6/igt@xe_pm@vram-=
d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_que=
ry@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-436/igt@xe_=
query@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_query=
@multigpu-query-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-5/igt@xe_que=
ry@multigpu-query-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_que=
ry@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433=
/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@xe_query=
@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-bmg-3/ig=
t@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_sri=
ov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2=
-432/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#413=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_sriov=
_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
43138v2/shard-bmg-6/igt@xe_sriov_auto_provisioning@resources-released-on-vf=
s-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_sri=
ov_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143138v2/shard-dg2-433/igt@xe_sriov=
_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3 -&gt; xe-pw-143=
138v2</li>
</ul>
<p>IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3: 683350734da38bc7332a3b8=
7c9f2faf6bbeeb5a3<br />
  xe-pw-143138v2: 143138v2</p>

</body>
</html>

--===============3363300611880640181==--
