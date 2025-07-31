Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57809C87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 21:01:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176C910E7EC;
	Thu, 31 Jul 2025 21:01:08 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F0A310E7EC;
 Thu, 31 Jul 2025 21:01:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3425286669513117891=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915_and_drm/xe=3A_rem?=
 =?utf-8?q?ove_fsb/mem_freq_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Jul 2025 21:01:06 -0000
Message-ID: <175399566637.203650.10403436775132873727@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1753971617.git.jani.nikula@intel.com>
In-Reply-To: <cover.1753971617.git.jani.nikula@intel.com>
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

--===============3425286669513117891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915 and drm/xe: remove fsb/mem freq cleanups
URL   : https://patchwork.freedesktop.org/series/152364/
State : failure

== Summary ==

CI Bug Log - changes from xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a_FULL -> xe-pw-152364v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152364v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152364v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152364v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@deep-color@pipe-a-hdmi-a-6-gamma:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-433/igt@kms_color@deep-color@pipe-a-hdmi-a-6-gamma.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-463/igt@kms_color@deep-color@pipe-a-hdmi-a-6-gamma.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unmap-nomemset:
    - shard-bmg:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unmap-nomemset.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unmap-nomemset.html

  
Known issues
------------

  Here are the changes found in xe-pw-152364v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#4963]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@core_hotunplug@hotunplug-rescan.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@eof:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#2134]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@fbdev@eof.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@fbdev@eof.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][9] ([Intel XE#911]) +3 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][10] -> [DMESG-FAIL][11] ([Intel XE#4543]) +1 other test dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#607])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#787]) +104 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#2907])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][21] -> [INCOMPLETE][22] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) +1 other test incomplete
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][23] -> [INCOMPLETE][24] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][25] -> [INCOMPLETE][26] ([Intel XE#3124])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][27] -> [DMESG-WARN][28] ([Intel XE#1727] / [Intel XE#3113])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][29] ([Intel XE#1727] / [Intel XE#3113])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2652] / [Intel XE#787]) +23 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#4417]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#306])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#4950]) +28 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#373]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#373]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][36] ([Intel XE#1178])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][37] ([Intel XE#1178])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1424])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#309])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2291]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2316]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - shard-adlp:         [PASS][44] -> [DMESG-WARN][45] ([Intel XE#4543]) +3 other tests dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-adlp-2/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][46] -> [FAIL][47] ([Intel XE#301]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          NOTRUN -> [FAIL][48] ([Intel XE#4683]) +1 other test fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2293]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1397] / [Intel XE#1745])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1397])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#656]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#651]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#651]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4947]) +54 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#653]) +7 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#4298])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#455]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#4596])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#2763]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2763]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#4947]) +14 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_pm_dc@dc5-dpms-negative.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#4962])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#4950]) +61 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#2893])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1489]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_rmfb@rmfb-ioctl:
    - shard-adlp:         [PASS][71] -> [DMESG-WARN][72] ([Intel XE#2953] / [Intel XE#4173]) +4 other tests dmesg-warn
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-3/igt@kms_rmfb@rmfb-ioctl.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-adlp-1/igt@kms_rmfb@rmfb-ioctl.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#1435]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#4459]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#1499])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@xe_eudebug@discovery-race:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#4837])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@xe_eudebug@discovery-race.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#4837]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-463/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#4945]) +293 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][83] -> [SKIP][84] ([Intel XE#1392]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1392])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1392])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#288]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [PASS][88] -> [DMESG-WARN][89] ([Intel XE#3876])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@once-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#4943]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@xe_exec_system_allocator@once-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#4915]) +59 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#2229]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@xe_live_ktest@xe_bo.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#3573]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#4733])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#4945]) +114 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_spin_batch@spin-all.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][97] ([Intel XE#4672]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][99] ([Intel XE#4674]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@write:
    - shard-bmg:          [SKIP][101] ([Intel XE#2134]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@fbdev@write.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@fbdev@write.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][103] ([Intel XE#4947]) -> [PASS][104] +17 other tests pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][105] ([Intel XE#3862]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][107] ([Intel XE#2291]) -> [PASS][108] +2 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][109] ([Intel XE#4633]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][111] ([Intel XE#2316]) -> [PASS][112] +2 other tests pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-adlp:         [DMESG-WARN][113] ([Intel XE#4543]) -> [PASS][114] +2 other tests pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-adlp-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][115] ([Intel XE#301]) -> [PASS][116] +1 other test pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][117] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][118] +8 other tests pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [INCOMPLETE][119] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][120] +3 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][121] ([Intel XE#4962]) -> [PASS][122] +2 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-bmg:          [SKIP][123] ([Intel XE#4950]) -> [PASS][124] +78 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_vblank@wait-busy-hang.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_vblank@wait-busy-hang.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-bmg:          [FAIL][125] ([Intel XE#5420]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_eu_stall@blocking-re-enable.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-2/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#1392]) -> [PASS][128] +4 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap:
    - shard-bmg:          [SKIP][129] ([Intel XE#4945]) -> [PASS][130] +411 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-mmap.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-execqueues-mmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][131] ([Intel XE#5018]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  
#### Warnings ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [SKIP][133] ([Intel XE#5177]) -> [FAIL][134] ([Intel XE#4665])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@intel_hwmon@hwmon-write.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          [SKIP][135] ([Intel XE#4947]) -> [SKIP][136] ([Intel XE#2327]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][137] ([Intel XE#2327]) -> [SKIP][138] ([Intel XE#4947]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][139] ([Intel XE#4947]) -> [SKIP][140] ([Intel XE#607])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [SKIP][141] ([Intel XE#1124]) -> [SKIP][142] ([Intel XE#4947]) +7 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][143] ([Intel XE#607]) -> [SKIP][144] ([Intel XE#4947])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][145] ([Intel XE#4947]) -> [SKIP][146] ([Intel XE#1124]) +8 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          [SKIP][147] ([Intel XE#4950]) -> [SKIP][148] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][149] ([Intel XE#367]) -> [SKIP][150] ([Intel XE#4950]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          [SKIP][151] ([Intel XE#4950]) -> [SKIP][152] ([Intel XE#367])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][153] ([Intel XE#2887]) -> [SKIP][154] ([Intel XE#4947]) +7 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][155] ([Intel XE#3432]) -> [SKIP][156] ([Intel XE#4947])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][157] ([Intel XE#4947]) -> [SKIP][158] ([Intel XE#3432]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][159] ([Intel XE#4947]) -> [SKIP][160] ([Intel XE#2887]) +12 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][161] ([Intel XE#4947]) -> [SKIP][162] ([Intel XE#2652] / [Intel XE#787]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][163] ([Intel XE#4950]) -> [SKIP][164] ([Intel XE#2325]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][165] ([Intel XE#4950]) -> [SKIP][166] ([Intel XE#2252]) +9 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          [SKIP][167] ([Intel XE#2252]) -> [SKIP][168] ([Intel XE#4950]) +7 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][169] ([Intel XE#1178]) -> [SKIP][170] ([Intel XE#4950])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][171] ([Intel XE#4950]) -> [SKIP][172] ([Intel XE#2390])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][173] ([Intel XE#4950]) -> [FAIL][174] ([Intel XE#1178])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][175] ([Intel XE#4950]) -> [SKIP][176] ([Intel XE#2341])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_content_protection@lic-type-1.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][177] ([Intel XE#2320]) -> [SKIP][178] ([Intel XE#4950]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][179] ([Intel XE#4950]) -> [SKIP][180] ([Intel XE#2321]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][181] ([Intel XE#2321]) -> [SKIP][182] ([Intel XE#4950]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-bmg:          [SKIP][183] ([Intel XE#4950]) -> [SKIP][184] ([Intel XE#2320]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][185] ([Intel XE#4950]) -> [SKIP][186] ([Intel XE#2286])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][187] ([Intel XE#4947]) -> [SKIP][188] ([Intel XE#1508])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][189] ([Intel XE#4947]) -> [SKIP][190] ([Intel XE#4354])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          [SKIP][191] ([Intel XE#4947]) -> [SKIP][192] ([Intel XE#2244]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][193] ([Intel XE#2244]) -> [SKIP][194] ([Intel XE#4947])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][195] ([Intel XE#4947]) -> [SKIP][196] ([Intel XE#5425])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][197] ([Intel XE#4950]) -> [SKIP][198] ([Intel XE#2372])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_feature_discovery@chamelium.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][199] ([Intel XE#1138]) -> [SKIP][200] ([Intel XE#4950])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_feature_discovery@display-4x.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][201] ([Intel XE#4950]) -> [SKIP][202] ([Intel XE#2374])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_feature_discovery@psr2.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][203] ([Intel XE#2049] / [Intel XE#2597]) -> [SKIP][204] ([Intel XE#4950])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][205] ([Intel XE#4947]) -> [SKIP][206] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][207] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][208] ([Intel XE#4947]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][209] ([Intel XE#4947]) -> [SKIP][210] ([Intel XE#2311]) +30 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][211] ([Intel XE#2311]) -> [SKIP][212] ([Intel XE#2312]) +9 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][213] ([Intel XE#2312]) -> [SKIP][214] ([Intel XE#2311]) +6 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][215] ([Intel XE#2312]) -> [SKIP][216] ([Intel XE#4947]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][217] ([Intel XE#4947]) -> [SKIP][218] ([Intel XE#5390]) +15 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][219] ([Intel XE#2312]) -> [SKIP][220] ([Intel XE#5390]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][221] ([Intel XE#5390]) -> [SKIP][222] ([Intel XE#4947]) +12 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][223] ([Intel XE#5390]) -> [SKIP][224] ([Intel XE#2312]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][225] ([Intel XE#2311]) -> [SKIP][226] ([Intel XE#4947]) +15 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][227] ([Intel XE#4947]) -> [SKIP][228] ([Intel XE#2313]) +31 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][229] ([Intel XE#2312]) -> [SKIP][230] ([Intel XE#2313]) +8 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][231] ([Intel XE#5672]) -> [SKIP][232] ([Intel XE#4947])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][233] ([Intel XE#4947]) -> [SKIP][234] ([Intel XE#2350])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][235] ([Intel XE#2313]) -> [SKIP][236] ([Intel XE#2312]) +12 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][237] ([Intel XE#2313]) -> [SKIP][238] ([Intel XE#4947]) +16 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][239] ([Intel XE#2934]) -> [SKIP][240] ([Intel XE#4947])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][241] ([Intel XE#4947]) -> [SKIP][242] ([Intel XE#4090])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][243] ([Intel XE#4947]) -> [SKIP][244] ([Intel XE#4329])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][245] ([Intel XE#2393]) -> [SKIP][246] ([Intel XE#4950]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][247] ([Intel XE#5021]) -> [SKIP][248] ([Intel XE#4950])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][249] ([Intel XE#4950]) -> [SKIP][250] ([Intel XE#5020])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-bmg:          [SKIP][251] ([Intel XE#4950]) -> [SKIP][252] ([Intel XE#2763])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][253] ([Intel XE#4947]) -> [SKIP][254] ([Intel XE#870]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_backlight@fade.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][255] ([Intel XE#4947]) -> [SKIP][256] ([Intel XE#2391])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][257] ([Intel XE#2505]) -> [SKIP][258] ([Intel XE#4947])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][259] ([Intel XE#4962]) -> [SKIP][260] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][261] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][262] ([Intel XE#4962])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          [SKIP][263] ([Intel XE#1489]) -> [SKIP][264] ([Intel XE#4947]) +5 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][265] ([Intel XE#4947]) -> [SKIP][266] ([Intel XE#1489]) +7 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][267] ([Intel XE#4947]) -> [SKIP][268] ([Intel XE#2387])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][269] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][270] ([Intel XE#4947]) +9 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-blt.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][271] ([Intel XE#4947]) -> [SKIP][272] ([Intel XE#2234] / [Intel XE#2850]) +13 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-bmg:          [SKIP][273] ([Intel XE#4950]) -> [SKIP][274] ([Intel XE#3414] / [Intel XE#3904])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_rotation_crc@bad-tiling.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][275] ([Intel XE#2330]) -> [SKIP][276] ([Intel XE#4950]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][277] ([Intel XE#4950]) -> [SKIP][278] ([Intel XE#2330])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][279] ([Intel XE#4950]) -> [SKIP][280] ([Intel XE#2413])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][281] ([Intel XE#2426]) -> [SKIP][282] ([Intel XE#4950])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     [FAIL][283] ([Intel XE#1729]) -> [SKIP][284] ([Intel XE#362])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][285] ([Intel XE#2426]) -> [SKIP][286] ([Intel XE#2509])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][287] ([Intel XE#2168]) -> [SKIP][288] ([Intel XE#4950])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_vrr@cmrr.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][289] ([Intel XE#1499]) -> [SKIP][290] ([Intel XE#4950]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_vrr@max-min.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_vrr@max-min.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          [SKIP][291] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][292] ([Intel XE#4950])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          [SKIP][293] ([Intel XE#4945]) -> [SKIP][294] ([Intel XE#4837]) +13 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_eudebug@basic-exec-queues.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][295] ([Intel XE#4945]) -> [SKIP][296] ([Intel XE#4518])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][297] ([Intel XE#4945]) -> [SKIP][298] ([Intel XE#2322]) +9 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][299] ([Intel XE#2322]) -> [SKIP][300] ([Intel XE#4945]) +6 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
    - shard-bmg:          [SKIP][301] ([Intel XE#4837]) -> [SKIP][302] ([Intel XE#4945]) +10 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - shard-bmg:          [SKIP][303] ([Intel XE#4945]) -> [SKIP][304] ([Intel XE#4943]) +19 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
    - shard-bmg:          [SKIP][305] ([Intel XE#4943]) -> [SKIP][306] ([Intel XE#4945]) +21 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][307] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530]) -> [SKIP][308] ([Intel XE#4945])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][309] ([Intel XE#1420]) -> [SKIP][310] ([Intel XE#4945])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][311] ([Intel XE#2245]) -> [SKIP][312] ([Intel XE#4945])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@xe_pat@pat-index-xelp.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][313] ([Intel XE#2236]) -> [SKIP][314] ([Intel XE#4945])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][315] ([Intel XE#1173]) -> [SKIP][316] ([Intel XE#1061])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-466/igt@xe_peer2peer@write.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][317] ([Intel XE#4945]) -> [SKIP][318] ([Intel XE#5694])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@d3cold-i2c.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][319] ([Intel XE#4945]) -> [SKIP][320] ([Intel XE#5695])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@d3hot-i2c.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][321] ([Intel XE#4945]) -> [SKIP][322] ([Intel XE#2284])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          [SKIP][323] ([Intel XE#4945]) -> [SKIP][324] ([Intel XE#4733])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          [SKIP][325] ([Intel XE#4733]) -> [SKIP][326] ([Intel XE#4945]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          [SKIP][327] ([Intel XE#944]) -> [SKIP][328] ([Intel XE#4945]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_query@multigpu-query-engines.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][329] ([Intel XE#4945]) -> [SKIP][330] ([Intel XE#944]) +2 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          [SKIP][331] ([Intel XE#4945]) -> [SKIP][332] ([Intel XE#4130]) +2 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [SKIP][333] ([Intel XE#4273]) -> [SKIP][334] ([Intel XE#4945])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          [SKIP][335] ([Intel XE#4945]) -> [SKIP][336] ([Intel XE#4351])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@xe_sriov_scheduling@equal-throughput.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672
  [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5420
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a -> xe-pw-152364v1

  IGT_8482: 8482
  xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a: 1ecbc700ab547ec8354e03e45629e576b861993a
  xe-pw-152364v1: 152364v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/index.html

--===============3425286669513117891==
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
<tr><td><b>Series:</b></td><td>drm/i915 and drm/xe: remove fsb/mem freq cleanups</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152364/">https://patchwork.freedesktop.org/series/152364/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a_FULL -&gt; xe-pw-152364v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152364v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-152364v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-152364v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@deep-color@pipe-a-hdmi-a-6-gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-433/igt@kms_color@deep-color@pipe-a-hdmi-a-6-gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-463/igt@kms_color@deep-color@pipe-a-hdmi-a-6-gamma.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unmap-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-bo-unmap-nomemset.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152364v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +104 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +28 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-adlp-2/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683">Intel XE#4683</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +54 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@rmfb-ioctl:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-3/igt@kms_rmfb@rmfb-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-adlp-1/igt@kms_rmfb@rmfb-ioctl.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@xe_eudebug@discovery-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-463/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +293 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-3/igt@xe_exec_system_allocator@once-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-433/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_spin_batch@spin-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +114 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672">Intel XE#4672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674">Intel XE#4674</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-adlp-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +8 other tests pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_vblank@wait-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_vblank@wait-busy-hang.html">PASS</a> +78 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_eu_stall@blocking-re-enable.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5420">Intel XE#5420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-2/igt@xe_eu_stall@blocking-re-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-435/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-execqueues-mmap.html">PASS</a> +411 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665">Intel XE#4665</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425">Intel XE#5425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672">Intel XE#5672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-3/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-466/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695">Intel XE#5695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152364v1/shard-bmg-1/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a -&gt; xe-pw-152364v1</li>
</ul>
<p>IGT_8482: 8482<br />
  xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a: 1ecbc700ab547ec8354e03e45629e576b861993a<br />
  xe-pw-152364v1: 152364v1</p>

</body>
</html>

--===============3425286669513117891==--
