Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCBAC87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 20:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307B410E2B2;
	Thu, 31 Jul 2025 20:20:44 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A437310E2B2;
 Thu, 31 Jul 2025 20:20:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0354146682249861497=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe=3A_Improve_wedged_m?=
 =?utf-8?q?ode_handling_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 31 Jul 2025 20:20:43 -0000
Message-ID: <175399324364.203179.6786256183517159023@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250731123756.29259-1-lukasz.laguna@intel.com>
In-Reply-To: <20250731123756.29259-1-lukasz.laguna@intel.com>
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

--===============0354146682249861497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Improve wedged mode handling (rev8)
URL   : https://patchwork.freedesktop.org/series/148214/
State : success

== Summary ==

CI Bug Log - changes from xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a_FULL -> xe-pw-148214v8_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-148214v8_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-bmg:          [PASS][1] -> [SKIP][2] ([Intel XE#4963])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@eof:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#2134]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@fbdev@eof.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@fbdev@eof.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][5] ([Intel XE#911]) +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#316])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][7] -> [DMESG-FAIL][8] ([Intel XE#4543]) +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124]) +5 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#2191])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#2907])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#787]) +125 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][18] -> [INCOMPLETE][19] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][20] -> [INCOMPLETE][21] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) +1 other test incomplete
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2652] / [Intel XE#787]) +15 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#306])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#4950]) +22 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#373]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#373]) +5 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][27] ([Intel XE#1178]) +2 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][28] ([Intel XE#1178])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1424])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#308])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#309])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][32] -> [DMESG-WARN][33] ([Intel XE#5354])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2291]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#4422])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#2316])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-bmg:          [PASS][39] -> [FAIL][40] ([Intel XE#3098]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-plain-flip@b-hdmi-a1:
    - shard-adlp:         [PASS][41] -> [DMESG-WARN][42] ([Intel XE#4543]) +3 other tests dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-adlp-3/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-adlp:         [PASS][43] -> [DMESG-WARN][44] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#5208])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-9/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-adlp-2/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-adlp:         [PASS][45] -> [FAIL][46] ([Intel XE#301]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
    - shard-bmg:          [PASS][47] -> [FAIL][48] ([Intel XE#3321]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][49] -> [FAIL][50] ([Intel XE#301])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][51] -> [DMESG-WARN][52] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][53] ([Intel XE#2049] / [Intel XE#2597])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          NOTRUN -> [FAIL][54] ([Intel XE#4683]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2293]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1397] / [Intel XE#1745])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1397])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#656]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#651]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#651]) +12 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#4947]) +31 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#653]) +9 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#4298])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-466/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#455]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][65] ([Intel XE#616]) +3 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#4596])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#2763]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2763]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#4947]) +13 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_pm_dc@dc5-dpms-negative.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4962])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#4950]) +48 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#2893])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1489]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][78] -> [SKIP][79] ([Intel XE#1435])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_eudebug@discovery-race:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#4837])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@xe_eudebug@discovery-race.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#4837]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#4945]) +228 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1392]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][85] -> [SKIP][86] ([Intel XE#1392]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1392])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#288]) +9 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@once-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#4943]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@xe_exec_system_allocator@once-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#4945]) +80 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@twice-mmap-new-huge:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#4915]) +90 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-466/igt@xe_exec_system_allocator@twice-mmap-new-huge.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-lnl:          [PASS][92] -> [DMESG-WARN][93] ([Intel XE#3876])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-5/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#560])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#3573]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2284] / [Intel XE#366])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@xe_pm@d3cold-basic.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#4733])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#4130])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][99] ([Intel XE#4672]) -> [PASS][100] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [FAIL][101] ([Intel XE#4674]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@write:
    - shard-bmg:          [SKIP][103] ([Intel XE#2134]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@fbdev@write.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@fbdev@write.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [SKIP][105] ([Intel XE#4947]) -> [PASS][106] +11 other tests pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][107] ([Intel XE#3862]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][109] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     [INCOMPLETE][111] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-2.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][113] ([Intel XE#2291]) -> [PASS][114] +2 other tests pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][115] ([Intel XE#2316]) -> [PASS][116] +1 other test pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-adlp:         [DMESG-WARN][117] ([Intel XE#4543]) -> [PASS][118] +2 other tests pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-adlp-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [FAIL][119] ([Intel XE#301]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][121] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][122] +2 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][123] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][124] +2 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#4208]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#455]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [SKIP][129] ([Intel XE#4962]) -> [PASS][130] +1 other test pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-bmg:          [SKIP][131] ([Intel XE#4950]) -> [PASS][132] +49 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_vblank@wait-busy-hang.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_vblank@wait-busy-hang.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-bmg:          [FAIL][133] ([Intel XE#5420]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_eu_stall@blocking-re-enable.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-3/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1392]) -> [PASS][136] +2 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@twice-large-malloc-nomemset:
    - shard-bmg:          [SKIP][137] ([Intel XE#4945]) -> [PASS][138] +264 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_system_allocator@twice-large-malloc-nomemset.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@xe_exec_system_allocator@twice-large-malloc-nomemset.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][139] ([Intel XE#5166]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@xe_pmu@gt-frequency.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-434/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][141] ([Intel XE#2327]) -> [SKIP][142] ([Intel XE#4947]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][143] ([Intel XE#4947]) -> [SKIP][144] ([Intel XE#2327])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          [SKIP][145] ([Intel XE#4947]) -> [SKIP][146] ([Intel XE#1124]) +6 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [SKIP][147] ([Intel XE#1124]) -> [SKIP][148] ([Intel XE#4947]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][149] ([Intel XE#607]) -> [SKIP][150] ([Intel XE#4947])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][151] ([Intel XE#367]) -> [SKIP][152] ([Intel XE#4950]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][153] ([Intel XE#2887]) -> [SKIP][154] ([Intel XE#4947]) +7 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][155] ([Intel XE#3432]) -> [SKIP][156] ([Intel XE#4947])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][157] ([Intel XE#4947]) -> [SKIP][158] ([Intel XE#3432]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][159] ([Intel XE#4947]) -> [SKIP][160] ([Intel XE#2887]) +7 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][161] ([Intel XE#4947]) -> [SKIP][162] ([Intel XE#2652] / [Intel XE#787]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][163] ([Intel XE#4950]) -> [SKIP][164] ([Intel XE#2325]) +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][165] ([Intel XE#4950]) -> [SKIP][166] ([Intel XE#2252]) +6 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          [SKIP][167] ([Intel XE#2252]) -> [SKIP][168] ([Intel XE#4950]) +5 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          [SKIP][169] ([Intel XE#4950]) -> [SKIP][170] ([Intel XE#2390])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][171] ([Intel XE#4950]) -> [FAIL][172] ([Intel XE#1178])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][173] ([Intel XE#2321]) -> [SKIP][174] ([Intel XE#4950])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][175] ([Intel XE#2320]) -> [SKIP][176] ([Intel XE#4950]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          [SKIP][177] ([Intel XE#4950]) -> [SKIP][178] ([Intel XE#2321])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-bmg:          [SKIP][179] ([Intel XE#4950]) -> [SKIP][180] ([Intel XE#2320]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][181] ([Intel XE#4950]) -> [SKIP][182] ([Intel XE#2291]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][183] ([Intel XE#4633]) -> [FAIL][184] ([Intel XE#5299])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][185] ([Intel XE#4950]) -> [SKIP][186] ([Intel XE#2286])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][187] ([Intel XE#4947]) -> [SKIP][188] ([Intel XE#4354])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          [SKIP][189] ([Intel XE#4947]) -> [SKIP][190] ([Intel XE#2244]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][191] ([Intel XE#4947]) -> [SKIP][192] ([Intel XE#5425])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][193] ([Intel XE#4950]) -> [SKIP][194] ([Intel XE#2374])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_feature_discovery@psr2.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][195] ([Intel XE#4950]) -> [SKIP][196] ([Intel XE#2316]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][197] ([Intel XE#301]) -> [FAIL][198] ([Intel XE#301] / [Intel XE#3149])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][199] ([Intel XE#2049] / [Intel XE#2597]) -> [SKIP][200] ([Intel XE#4950])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][201] ([Intel XE#4947]) -> [SKIP][202] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][203] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][204] ([Intel XE#4947]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][205] ([Intel XE#4947]) -> [SKIP][206] ([Intel XE#2311]) +14 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][207] ([Intel XE#2311]) -> [SKIP][208] ([Intel XE#2312]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][209] ([Intel XE#2312]) -> [SKIP][210] ([Intel XE#4947]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][211] ([Intel XE#4947]) -> [SKIP][212] ([Intel XE#5390]) +6 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][213] ([Intel XE#5390]) -> [SKIP][214] ([Intel XE#4947]) +10 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][215] ([Intel XE#5390]) -> [SKIP][216] ([Intel XE#2312])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][217] ([Intel XE#2311]) -> [SKIP][218] ([Intel XE#4947]) +13 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][219] ([Intel XE#2312]) -> [SKIP][220] ([Intel XE#2311]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][221] ([Intel XE#2313]) -> [SKIP][222] ([Intel XE#2312]) +4 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][223] ([Intel XE#4947]) -> [SKIP][224] ([Intel XE#2312]) +9 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][225] ([Intel XE#4947]) -> [SKIP][226] ([Intel XE#2313]) +16 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][227] ([Intel XE#2312]) -> [SKIP][228] ([Intel XE#2313]) +4 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][229] ([Intel XE#2313]) -> [SKIP][230] ([Intel XE#4947]) +12 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][231] ([Intel XE#4950]) -> [SKIP][232] ([Intel XE#1503])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][233] ([Intel XE#2393]) -> [SKIP][234] ([Intel XE#4950])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][235] ([Intel XE#5021]) -> [SKIP][236] ([Intel XE#4950])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][237] ([Intel XE#4950]) -> [SKIP][238] ([Intel XE#5020])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-bmg:          [SKIP][239] ([Intel XE#4950]) -> [SKIP][240] ([Intel XE#2763])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][241] ([Intel XE#4947]) -> [SKIP][242] ([Intel XE#870])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_backlight@basic-brightness.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][243] ([Intel XE#4947]) -> [SKIP][244] ([Intel XE#2391])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][245] ([Intel XE#2505]) -> [SKIP][246] ([Intel XE#4947])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][247] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][248] ([Intel XE#4962])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          [SKIP][249] ([Intel XE#1489]) -> [SKIP][250] ([Intel XE#4947]) +4 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][251] ([Intel XE#4947]) -> [SKIP][252] ([Intel XE#1489]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][253] ([Intel XE#4947]) -> [SKIP][254] ([Intel XE#2387])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][255] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][256] ([Intel XE#4947]) +7 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-blt.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          [SKIP][257] ([Intel XE#4947]) -> [SKIP][258] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr@psr-basic.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_psr@psr-basic.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-bmg:          [SKIP][259] ([Intel XE#4950]) -> [SKIP][260] ([Intel XE#3414] / [Intel XE#3904])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_rotation_crc@bad-tiling.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][261] ([Intel XE#2330]) -> [SKIP][262] ([Intel XE#4950]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][263] ([Intel XE#4950]) -> [SKIP][264] ([Intel XE#2413])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][265] ([Intel XE#2168]) -> [SKIP][266] ([Intel XE#4950])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_vrr@cmrr.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][267] ([Intel XE#1499]) -> [SKIP][268] ([Intel XE#4950]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_vrr@max-min.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_vrr@max-min.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          [SKIP][269] ([Intel XE#4945]) -> [SKIP][270] ([Intel XE#4837]) +8 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_eudebug@basic-exec-queues.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-bmg:          [SKIP][271] ([Intel XE#4837]) -> [SKIP][272] ([Intel XE#4945]) +6 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@xe_eudebug@basic-vm-bind.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][273] ([Intel XE#4945]) -> [SKIP][274] ([Intel XE#2322]) +4 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][275] ([Intel XE#2322]) -> [SKIP][276] ([Intel XE#4945]) +5 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - shard-bmg:          [SKIP][277] ([Intel XE#4945]) -> [SKIP][278] ([Intel XE#4943]) +16 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
    - shard-bmg:          [SKIP][279] ([Intel XE#4943]) -> [SKIP][280] ([Intel XE#4945]) +14 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][281] ([Intel XE#1420]) -> [SKIP][282] ([Intel XE#4945])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][283] ([Intel XE#2236]) -> [SKIP][284] ([Intel XE#4945])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][285] ([Intel XE#4945]) -> [SKIP][286] ([Intel XE#5694])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@d3cold-i2c.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][287] ([Intel XE#4945]) -> [SKIP][288] ([Intel XE#5695])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@d3hot-i2c.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][289] ([Intel XE#4945]) -> [SKIP][290] ([Intel XE#2284])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          [SKIP][291] ([Intel XE#4733]) -> [SKIP][292] ([Intel XE#4945])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-engines:
    - shard-bmg:          [SKIP][293] ([Intel XE#944]) -> [SKIP][294] ([Intel XE#4945]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_query@multigpu-query-engines.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][295] ([Intel XE#4945]) -> [SKIP][296] ([Intel XE#944]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          [SKIP][297] ([Intel XE#4945]) -> [SKIP][298] ([Intel XE#4130]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [SKIP][299] ([Intel XE#4273]) -> [SKIP][300] ([Intel XE#4945])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-bmg:          [SKIP][301] ([Intel XE#4945]) -> [SKIP][302] ([Intel XE#4351])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@xe_sriov_scheduling@equal-throughput.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672
  [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
  [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5166]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5166
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5420
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
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

  * Linux: xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a -> xe-pw-148214v8

  IGT_8482: 8482
  xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a: 1ecbc700ab547ec8354e03e45629e576b861993a
  xe-pw-148214v8: 148214v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/index.html

--===============0354146682249861497==
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
<tr><td><b>Series:</b></td><td>drm/xe: Improve wedged mode handling (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148214/">https://patchwork.freedesktop.org/series/148214/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a_FULL -&gt; xe-pw-148214v8_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148214v8_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +125 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +22 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-adlp-3/igt@kms_flip@basic-plain-flip@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-9/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-adlp-2/igt@kms_flip@dpms-vs-vblank-race-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683">Intel XE#4683</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +31 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-466/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@xe_eudebug@discovery-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +228 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-5/igt@xe_exec_system_allocator@once-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +80 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-new-huge:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-466/igt@xe_exec_system_allocator@twice-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +90 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-5/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672">Intel XE#4672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@core_setmaster@master-drop-set-root.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674">Intel XE#4674</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@core_setmaster@master-drop-set-user.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-adlp-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_vblank@wait-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_vblank@wait-busy-hang.html">PASS</a> +49 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-7/igt@xe_eu_stall@blocking-re-enable.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5420">Intel XE#5420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-3/igt@xe_eu_stall@blocking-re-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_system_allocator@twice-large-malloc-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@xe_exec_system_allocator@twice-large-malloc-nomemset.html">PASS</a> +264 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-dg2-432/igt@xe_pmu@gt-frequency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5166">Intel XE#5166</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-dg2-434/igt@xe_pmu@gt-frequency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425">Intel XE#5425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-4/igt@xe_eudebug@basic-exec-queues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@xe_eudebug@basic-vm-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_eudebug@basic-vm-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-6/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695">Intel XE#5695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-2/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-8/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a/shard-bmg-5/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v8/shard-bmg-6/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a -&gt; xe-pw-148214v8</li>
</ul>
<p>IGT_8482: 8482<br />
  xe-3493-1ecbc700ab547ec8354e03e45629e576b861993a: 1ecbc700ab547ec8354e03e45629e576b861993a<br />
  xe-pw-148214v8: 148214v8</p>

</body>
</html>

--===============0354146682249861497==--
