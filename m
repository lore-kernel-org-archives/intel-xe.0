Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4264FC0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 23:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A709E10E051;
	Wed, 29 Jan 2025 23:00:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1551310E04A;
 Wed, 29 Jan 2025 23:00:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4460320739580426980=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_Allow_?=
 =?utf-8?q?display_PHYs_to_reset_power_state?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 23:00:41 -0000
Message-ID: <173819164105.2640361.10840116963595132235@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129130105.198817-1-mika.kahola@intel.com>
In-Reply-To: <20250129130105.198817-1-mika.kahola@intel.com>
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

--===============4460320739580426980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Allow display PHYs to reset power state
URL   : https://patchwork.freedesktop.org/series/144103/
State : failure

== Summary ==

CI Bug Log - changes from xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3_full -> xe-pw-144103v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144103v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144103v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144103v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@core_hotunplug@hotreplug.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-8/igt@core_hotunplug@hotreplug.html

  * igt@kms_mmap_write_crc@main:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] +4 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-4/igt@kms_mmap_write_crc@main.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@kms_mmap_write_crc@main.html

  
Known issues
------------

  Here are the changes found in xe-pw-144103v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getstats:
    - shard-dg2-set2:     [PASS][5] -> [SKIP][6] ([Intel XE#2423])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@core_getstats.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@core_getstats.html

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][7] -> [FAIL][8] ([Intel XE#3440])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@core_getversion@all-cards.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@core_getversion@all-cards.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][9] -> [FAIL][10] ([Intel XE#3249])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@core_setmaster@master-drop-set-root.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#3453])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@core_setmaster@master-drop-set-shared-fd.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#3249])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@core_setmaster@master-drop-set-user.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@eof:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2134]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@fbdev@eof.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@fbdev@eof.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#2134]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@fbdev@info.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@fbdev@info.html

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#2134])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@fbdev@unaligned-read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1124])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1407])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#2136]) +30 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_big_fb@x-tiled-addfb.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#2136]) +33 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1124])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#2191])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][29] -> [SKIP][30] ([Intel XE#2136] / [Intel XE#2351]) +21 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#3432])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#787]) +153 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][35] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4010])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#306])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#373])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][38] ([Intel XE#1178])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][39] ([Intel XE#1178])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][40] ([Intel XE#3304])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2321])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1424])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][43] -> [DMESG-WARN][44] ([Intel XE#4172]) +10 other tests dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#309])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-bmg:          [PASS][46] -> [INCOMPLETE][47] ([Intel XE#3226])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#323])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [PASS][49] -> [FAIL][50] ([Intel XE#301])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#301]) +3 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1421])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][53] -> [SKIP][54] ([Intel XE#2423] / [i915#2575]) +139 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_flip@busy-flip.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][55] -> [DMESG-WARN][56] ([Intel XE#2953]) +1 other test dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@d-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][57] ([Intel XE#4172]) +3 other tests dmesg-warn
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_flip@flip-vs-wf_vblank-interruptible@d-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1401] / [Intel XE#1745])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1401])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2293]) +7 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2380])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#455]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#656]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [PASS][64] -> [DMESG-WARN][65] ([Intel XE#1033]) +3 other tests dmesg-warn
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2-set2:     [PASS][66] -> [SKIP][67] ([Intel XE#2136]) +42 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#651]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#653])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1470] / [Intel XE#2853])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#1503])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1503])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#2934])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][76] ([Intel XE#616]) +2 other tests fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#599])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#2763]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#2763]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#2763] / [Intel XE#455])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2763]) +7 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#2446]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_pm_rpm@i2c.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][84] -> [SKIP][85] ([Intel XE#2446]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#2446]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_properties@connector-properties-legacy:
    - shard-bmg:          [PASS][87] -> [SKIP][88] ([Intel XE#2423]) +108 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_properties@connector-properties-legacy.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1406]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#2850] / [Intel XE#929])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@kms_psr@psr-basic.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1435])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#330])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2423] / [i915#2575]) +29 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_vrr@flipline.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1280] / [Intel XE#455])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-adlp:         [PASS][95] -> [DMESG-WARN][96] ([Intel XE#3868])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-6/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#2905])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#688]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [PASS][99] -> [SKIP][100] ([Intel XE#1130]) +262 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1392])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1392])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#1130]) +51 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-adlp:         [PASS][104] -> [DMESG-WARN][105] ([Intel XE#4173]) +2 other tests dmesg-warn
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][106] -> [SKIP][107] ([Intel XE#2229]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@xe_live_ktest@xe_bo.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@xe_live_ktest@xe_bo.html

  * igt@xe_media_fill@media-fill:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#560])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][109] -> [FAIL][110] ([Intel XE#3546])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@xe_module_load@many-reload.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [PASS][111] -> [FAIL][112] ([Intel XE#3546])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@xe_module_load@reload.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@xe_module_load@reload.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][113] ([Intel XE#1173])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][114] -> [ABORT][115] ([Intel XE#1358] / [Intel XE#1607])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-8/igt@xe_pm@s4-exec-after.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html
    - shard-lnl:          [PASS][116] -> [ABORT][117] ([Intel XE#1358] / [Intel XE#1607])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-lnl-6/igt@xe_pm@s4-exec-after.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [PASS][118] -> [SKIP][119] ([Intel XE#1130]) +249 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Possible fixes ####

  * igt@core_getversion@basic:
    - shard-dg2-set2:     [FAIL][120] ([Intel XE#3440]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@core_getversion@basic.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@core_getversion@basic.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][122] ([Intel XE#3249]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@core_setmaster@master-drop-set-root.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#2134]) -> [PASS][125] +1 other test pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@fbdev@eof.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@fbdev@eof.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][126] ([Intel XE#2134]) -> [PASS][127] +1 other test pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@fbdev@nullptr.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@fbdev@nullptr.html

  * igt@kms_3d:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#2423]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_3d.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_3d.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#2423] / [i915#2575]) -> [PASS][131] +125 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][132] ([Intel XE#3908]) -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [SKIP][134] ([Intel XE#2136]) -> [PASS][135] +26 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [DMESG-WARN][136] -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][138] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-d-dp-2:
    - shard-bmg:          [DMESG-WARN][140] ([Intel XE#877]) -> [PASS][141] +2 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-d-dp-2.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-2/igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-d-dp-2.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][142] ([Intel XE#2316]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][144] ([Intel XE#301]) -> [PASS][145] +2 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [FAIL][146] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][147] +2 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - shard-bmg:          [FAIL][148] ([Intel XE#3321]) -> [PASS][149] +3 other tests pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#2136]) -> [PASS][151] +37 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-adlp:         [DMESG-WARN][152] ([Intel XE#4173]) -> [PASS][153] +4 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][155] +12 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [DMESG-WARN][156] ([Intel XE#1033]) -> [PASS][157] +3 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-bmg:          [SKIP][158] ([Intel XE#2423]) -> [PASS][159] +109 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][160] ([Intel XE#616]) -> [PASS][161] +1 other test pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_plane_cursor@viewport.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d:
    - shard-bmg:          [DMESG-WARN][162] ([Intel XE#4172]) -> [PASS][163] +2 other tests pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-adlp:         [DMESG-WARN][164] -> [PASS][165] +2 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-8/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-6/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-dg2-set2:     [DMESG-WARN][166] ([Intel XE#1033] / [Intel XE#2566]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#2446]) -> [PASS][169] +3 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_pm_rpm@cursor-dpms.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [SKIP][170] ([Intel XE#2446]) -> [PASS][171] +2 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_rpm@legacy-planes-dpms.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][172] ([Intel XE#899]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [DMESG-WARN][174] ([Intel XE#2953]) -> [PASS][175] +4 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-3/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][176] ([Intel XE#1499]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-7/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1130]) -> [PASS][179] +222 other tests pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_exec_balancer@once-parallel-rebind.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#1392]) -> [PASS][181] +1 other test pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][182] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][184] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [SKIP][186] ([Intel XE#1130]) -> [PASS][187] +258 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#623]) -> [SKIP][189] ([Intel XE#2423] / [i915#2575])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#2423] / [i915#2575]) -> [SKIP][191] ([Intel XE#873])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          [SKIP][192] ([Intel XE#2385]) -> [SKIP][193] ([Intel XE#2423])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][194] ([Intel XE#2423]) -> [SKIP][195] ([Intel XE#2370])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][196] ([Intel XE#2370]) -> [SKIP][197] ([Intel XE#2423])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#2136]) -> [SKIP][199] ([Intel XE#316]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#316]) -> [SKIP][201] ([Intel XE#2136]) +8 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#316]) -> [SKIP][203] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][205] ([Intel XE#316]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][206] ([Intel XE#2136]) -> [SKIP][207] ([Intel XE#2327]) +6 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][208] ([Intel XE#2327]) -> [SKIP][209] ([Intel XE#2136]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][211] ([Intel XE#1124]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][212] ([Intel XE#2136]) -> [SKIP][213] ([Intel XE#2328])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#619]) -> [SKIP][215] ([Intel XE#2136] / [Intel XE#2351])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#610]) -> [SKIP][217] ([Intel XE#2136])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1124]) -> [SKIP][219] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          [SKIP][220] ([Intel XE#2136]) -> [SKIP][221] ([Intel XE#1124]) +16 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][222] ([Intel XE#607]) -> [SKIP][223] ([Intel XE#2136]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#2136]) -> [SKIP][225] ([Intel XE#610])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#2136]) -> [SKIP][227] ([Intel XE#1124]) +11 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][228] ([Intel XE#1124]) -> [SKIP][229] ([Intel XE#2136]) +14 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1124]) -> [SKIP][231] ([Intel XE#2136]) +8 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          [SKIP][232] ([Intel XE#2423]) -> [SKIP][233] ([Intel XE#2314] / [Intel XE#2894])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#2423] / [i915#2575]) -> [SKIP][235] ([Intel XE#2191]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][236] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][237] ([Intel XE#2423]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#2191]) -> [SKIP][239] ([Intel XE#2423] / [i915#2575])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#367]) -> [SKIP][241] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][242] ([Intel XE#367]) -> [SKIP][243] ([Intel XE#2423]) +3 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][244] ([Intel XE#2423]) -> [SKIP][245] ([Intel XE#367]) +4 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#2423] / [i915#2575]) -> [SKIP][247] ([Intel XE#367]) +4 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#2136]) -> [SKIP][249] ([Intel XE#2907]) +3 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][250] ([Intel XE#2136]) -> [SKIP][251] ([Intel XE#2652] / [Intel XE#787]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][253] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [DMESG-WARN][254] ([Intel XE#1033]) -> [SKIP][255] ([Intel XE#2136] / [Intel XE#2351])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][256] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][257] ([Intel XE#2136])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][259] ([Intel XE#2136]) +20 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][260] ([Intel XE#2887]) -> [SKIP][261] ([Intel XE#2136]) +19 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][262] ([Intel XE#3432]) -> [SKIP][263] ([Intel XE#2136]) +3 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [DMESG-WARN][264] -> [SKIP][265] ([Intel XE#2136])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          [SKIP][266] ([Intel XE#2136]) -> [SKIP][267] ([Intel XE#3432]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][268] ([Intel XE#2136]) -> [SKIP][269] ([Intel XE#2887]) +19 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][271] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#2136]) -> [INCOMPLETE][273] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][274] ([Intel XE#2692] / [Intel XE#4010]) -> [SKIP][275] ([Intel XE#2136])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#2136]) -> [SKIP][277] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][278] ([Intel XE#2136]) -> [SKIP][279] ([Intel XE#2724])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cdclk@mode-transition.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][280] ([Intel XE#2724]) -> [SKIP][281] ([Intel XE#2136])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][282] ([Intel XE#2423]) -> [SKIP][283] ([Intel XE#2325]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#306]) -> [SKIP][285] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          [SKIP][286] ([Intel XE#2325]) -> [SKIP][287] ([Intel XE#2423]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_chamelium_color@ctm-negative.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#2423] / [i915#2575]) -> [SKIP][289] ([Intel XE#306]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_chamelium_color@gamma.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][290] ([Intel XE#2252]) -> [SKIP][291] ([Intel XE#2423]) +14 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#2423] / [i915#2575]) -> [SKIP][293] ([Intel XE#373]) +13 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][294] ([Intel XE#2423]) -> [SKIP][295] ([Intel XE#2252]) +13 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#373]) -> [SKIP][297] ([Intel XE#2423] / [i915#2575]) +14 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][298] ([Intel XE#2423]) -> [SKIP][299] ([Intel XE#2341]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_content_protection@atomic.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_content_protection@atomic.html
    - shard-dg2-set2:     [FAIL][300] ([Intel XE#1178]) -> [SKIP][301] ([Intel XE#2423] / [i915#2575])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_content_protection@atomic.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][302] ([Intel XE#2390]) -> [SKIP][303] ([Intel XE#2423])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#307]) -> [SKIP][305] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#2423] / [i915#2575]) -> [SKIP][307] ([Intel XE#307]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][308] ([Intel XE#2423]) -> [FAIL][309] ([Intel XE#1178])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_content_protection@legacy.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#2423] / [i915#2575]) -> [FAIL][311] ([Intel XE#1178]) +1 other test fail
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_content_protection@lic-type-0.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][312] ([Intel XE#2341]) -> [SKIP][313] ([Intel XE#2423])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_content_protection@mei-interface.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][314] ([Intel XE#1178]) -> [SKIP][315] ([Intel XE#2423]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_content_protection@srm.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][316] ([Intel XE#2320]) -> [SKIP][317] ([Intel XE#2423]) +7 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#308]) -> [SKIP][319] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][320] ([Intel XE#2321]) -> [SKIP][321] ([Intel XE#2423])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][322] ([Intel XE#2423]) -> [SKIP][323] ([Intel XE#2320]) +5 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#2423] / [i915#2575]) -> [SKIP][325] ([Intel XE#308])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][326] ([Intel XE#2423]) -> [SKIP][327] ([Intel XE#2321]) +4 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#455]) -> [SKIP][329] ([Intel XE#2423] / [i915#2575]) +11 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#323]) -> [SKIP][331] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-bmg:          [SKIP][332] ([Intel XE#2423]) -> [SKIP][333] ([Intel XE#2286]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-bmg:          [SKIP][334] ([Intel XE#2286]) -> [SKIP][335] ([Intel XE#2423]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#2423] / [i915#2575]) -> [SKIP][337] ([Intel XE#323])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][338] ([Intel XE#2423]) -> [SKIP][339] ([Intel XE#2291]) +2 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][340] ([Intel XE#2291]) -> [SKIP][341] ([Intel XE#2423]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#455]) -> [SKIP][343] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-bmg:          [SKIP][344] ([Intel XE#2423]) -> [SKIP][345] ([Intel XE#2323])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_display_modes@mst-extended-mode-negative.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          [SKIP][346] ([Intel XE#2244]) -> [SKIP][347] ([Intel XE#2136]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_dsc@dsc-basic.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][348] ([Intel XE#2136]) -> [SKIP][349] ([Intel XE#2244]) +2 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][350] ([Intel XE#4156]) -> [SKIP][351] ([Intel XE#2136])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][352] ([Intel XE#776]) -> [SKIP][353] ([Intel XE#2136]) +1 other test skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#2423] / [i915#2575]) -> [SKIP][355] ([Intel XE#701])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_feature_discovery@chamelium.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][356] ([Intel XE#2373]) -> [SKIP][357] ([Intel XE#2423])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_feature_discovery@display-3x.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#2423] / [i915#2575]) -> [SKIP][359] ([Intel XE#1138])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_feature_discovery@display-4x.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#1137]) -> [SKIP][361] ([Intel XE#2423] / [i915#2575])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][362] ([Intel XE#2423]) -> [SKIP][363] ([Intel XE#2374])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_feature_discovery@psr1.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_feature_discovery@psr1.html
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#1135]) -> [SKIP][365] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_feature_discovery@psr1.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][366] ([Intel XE#2316]) -> [SKIP][367] ([Intel XE#2423]) +2 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][368] ([Intel XE#2423]) -> [SKIP][369] ([Intel XE#2316]) +4 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     [DMESG-WARN][370] ([Intel XE#1033]) -> [SKIP][371] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][372] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][373] ([Intel XE#2136]) +4 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][374] ([Intel XE#2136]) -> [SKIP][375] ([Intel XE#2293] / [Intel XE#2380]) +7 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#2136]) -> [SKIP][377] ([Intel XE#455]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][378] ([Intel XE#2136]) -> [SKIP][379] ([Intel XE#2380])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][381] ([Intel XE#455]) +5 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#455]) -> [SKIP][383] ([Intel XE#2136]) +8 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][384] ([Intel XE#2136]) -> [SKIP][385] ([Intel XE#2311]) +33 other tests skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][386] ([Intel XE#2136]) -> [SKIP][387] ([Intel XE#2312]) +28 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#2136]) -> [SKIP][389] ([Intel XE#651]) +26 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][390] ([Intel XE#651]) -> [SKIP][391] ([Intel XE#2136] / [Intel XE#2351]) +16 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          [SKIP][392] ([Intel XE#2311]) -> [SKIP][393] ([Intel XE#2136]) +34 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][394] ([Intel XE#2136]) -> [SKIP][395] ([Intel XE#4141]) +14 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][396] ([Intel XE#4141]) -> [SKIP][397] ([Intel XE#2136]) +16 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][398] ([Intel XE#2312]) -> [SKIP][399] ([Intel XE#4141]) +3 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][400] ([Intel XE#2312]) -> [SKIP][401] ([Intel XE#2136]) +19 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][402] ([Intel XE#2352]) -> [SKIP][403] ([Intel XE#2136])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#651]) -> [SKIP][405] ([Intel XE#2136]) +28 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][407] ([Intel XE#651]) +14 other tests skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][408] ([Intel XE#2312]) -> [SKIP][409] ([Intel XE#2311]) +2 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#658]) -> [SKIP][411] ([Intel XE#2136] / [Intel XE#2351])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          [SKIP][412] ([Intel XE#2136]) -> [SKIP][413] ([Intel XE#2352])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#2136]) -> [SKIP][415] ([Intel XE#653]) +32 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#653]) -> [SKIP][417] ([Intel XE#2136]) +31 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][418] ([Intel XE#2313]) -> [SKIP][419] ([Intel XE#2136]) +35 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][420] ([Intel XE#2312]) -> [SKIP][421] ([Intel XE#2313]) +3 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#1158]) -> [SKIP][423] ([Intel XE#2136])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#653]) -> [SKIP][425] ([Intel XE#2136] / [Intel XE#2351]) +14 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][426] ([Intel XE#2136]) -> [SKIP][427] ([Intel XE#2313]) +32 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][429] ([Intel XE#653]) +9 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][430] ([Intel XE#346]) -> [SKIP][431] ([Intel XE#2136])
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][432] ([Intel XE#2136]) -> [SKIP][433] ([Intel XE#3012])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#2136]) -> [SKIP][435] ([Intel XE#2925])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][436] ([Intel XE#2927]) -> [SKIP][437] ([Intel XE#2136])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#2136]) -> [SKIP][439] ([Intel XE#2927])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#2136]) -> [SKIP][441] ([Intel XE#346])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][442] ([Intel XE#2136]) -> [SKIP][443] ([Intel XE#2927])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#2925]) -> [SKIP][445] ([Intel XE#2136])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][446] ([Intel XE#2423]) -> [SKIP][447] ([Intel XE#2501])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#2423] / [i915#2575]) -> [SKIP][449] ([Intel XE#356])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][450] ([Intel XE#2486]) -> [SKIP][451] ([Intel XE#2423])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_panel_fitting@legacy.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [DMESG-WARN][452] ([Intel XE#4172]) -> [SKIP][453] ([Intel XE#2423]) +5 other tests skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#2423] / [i915#2575]) -> [FAIL][455] ([Intel XE#616])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_plane_cursor@primary.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][456] ([Intel XE#2423]) -> [SKIP][457] ([Intel XE#2493])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][458] ([Intel XE#2493]) -> [SKIP][459] ([Intel XE#2423])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [DMESG-WARN][460] -> [SKIP][461] ([Intel XE#2423] / [i915#2575])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-bmg:          [SKIP][462] ([Intel XE#2763]) -> [SKIP][463] ([Intel XE#2423]) +4 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#2423] / [i915#2575]) -> [SKIP][465] ([Intel XE#2763] / [Intel XE#455])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][467] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][468] ([Intel XE#2423]) -> [SKIP][469] ([Intel XE#2763]) +1 other test skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#2136]) -> [SKIP][471] ([Intel XE#870]) +1 other test skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][472] ([Intel XE#2938]) -> [SKIP][473] ([Intel XE#2136])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][474] ([Intel XE#2136]) -> [SKIP][475] ([Intel XE#870]) +1 other test skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_backlight@fade.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#870]) -> [SKIP][477] ([Intel XE#2136])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][478] ([Intel XE#870]) -> [SKIP][479] ([Intel XE#2136])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][480] ([Intel XE#2136]) -> [SKIP][481] ([Intel XE#2391])
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][483] ([Intel XE#1122])
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-dg2-set2:     [DMESG-WARN][484] ([Intel XE#1033]) -> [SKIP][485] ([Intel XE#2136]) +2 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_pm_dc@dc5-dpms.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][486] ([Intel XE#2136]) -> [SKIP][487] ([Intel XE#2392]) +1 other test skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#3309]) -> [SKIP][489] ([Intel XE#2136])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flops.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][491] ([Intel XE#908])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#1129]) -> [SKIP][493] ([Intel XE#2136] / [Intel XE#2351])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][494] ([Intel XE#2446]) -> [SKIP][495] ([Intel XE#1439] / [Intel XE#836])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][496] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][497] ([Intel XE#2446])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#1489]) -> [SKIP][499] ([Intel XE#2136]) +15 other tests skip
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][500] ([Intel XE#2136]) -> [SKIP][501] ([Intel XE#1489]) +11 other tests skip
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][502] ([Intel XE#1489]) -> [SKIP][503] ([Intel XE#2136]) +10 other tests skip
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][504] ([Intel XE#2136]) -> [SKIP][505] ([Intel XE#1489]) +11 other tests skip
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][506] ([Intel XE#2136]) -> [SKIP][507] ([Intel XE#1122]) +1 other test skip
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html
    - shard-bmg:          [SKIP][508] ([Intel XE#2136]) -> [SKIP][509] ([Intel XE#2387])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][510] ([Intel XE#2387]) -> [SKIP][511] ([Intel XE#2136]) +1 other test skip
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][512] ([Intel XE#2136]) -> [SKIP][513] ([Intel XE#2234] / [Intel XE#2850]) +22 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][514] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][515] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][516] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][517] ([Intel XE#2136]) +19 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][518] ([Intel XE#2136]) -> [SKIP][519] ([Intel XE#2850] / [Intel XE#929]) +16 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-dg2-set2:     [SKIP][520] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][521] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-render.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          [SKIP][522] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][523] ([Intel XE#2136]) +21 other tests skip
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_psr@psr-basic.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_psr@psr-basic.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][524] ([Intel XE#2414]) -> [SKIP][525] ([Intel XE#2136])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][526] ([Intel XE#2136]) -> [SKIP][527] ([Intel XE#2939])
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][528] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][529] ([Intel XE#2423]) +5 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][530] ([Intel XE#3414]) -> [SKIP][531] ([Intel XE#2423] / [i915#2575])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][532] ([Intel XE#2330]) -> [SKIP][533] ([Intel XE#2423])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-dg2-set2:     [SKIP][534] ([Intel XE#2423] / [i915#2575]) -> [SKIP][535] ([Intel XE#1127]) +1 other test skip
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][536] ([Intel XE#2423] / [i915#2575]) -> [SKIP][537] ([Intel XE#3414]) +2 other tests skip
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
    - shard-bmg:          [SKIP][538] ([Intel XE#2423]) -> [SKIP][539] ([Intel XE#3414] / [Intel XE#3904])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][540] ([Intel XE#1127]) -> [SKIP][541] ([Intel XE#2423] / [i915#2575])
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][542] ([Intel XE#2423]) -> [SKIP][543] ([Intel XE#2413])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][544] ([Intel XE#2423]) -> [SKIP][545] ([Intel XE#1435])
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][546] ([Intel XE#362]) -> [SKIP][547] ([Intel XE#2423] / [i915#2575])
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][548] ([Intel XE#2423] / [i915#2575]) -> [SKIP][549] ([Intel XE#1500])
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-bmg:          [SKIP][550] ([Intel XE#2423]) -> [DMESG-WARN][551] ([Intel XE#4172]) +4 other tests dmesg-warn
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_vblank@wait-busy-hang.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_vblank@wait-busy-hang.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][552] ([Intel XE#2168]) -> [SKIP][553] ([Intel XE#2423])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_vrr@cmrr.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#2423] / [i915#2575]) -> [SKIP][555] ([Intel XE#455]) +11 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_vrr@flip-dpms.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_vrr@flip-dpms.html
    - shard-bmg:          [SKIP][556] ([Intel XE#1499]) -> [SKIP][557] ([Intel XE#2423])
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_vrr@flip-dpms.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][558] ([Intel XE#2423]) -> [SKIP][559] ([Intel XE#2168])
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_vrr@lobf.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_vrr@lobf.html
    - shard-dg2-set2:     [SKIP][560] ([Intel XE#2168]) -> [SKIP][561] ([Intel XE#2423] / [i915#2575])
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_vrr@lobf.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][562] ([Intel XE#2423]) -> [SKIP][563] ([Intel XE#1499])
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-virtual.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][564] ([Intel XE#756]) -> [SKIP][565] ([Intel XE#2423] / [i915#2575])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          [SKIP][566] ([Intel XE#756]) -> [SKIP][567] ([Intel XE#2423]) +1 other test skip
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@kms_writeback@writeback-invalid-parameters.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][568] ([Intel XE#2423] / [i915#2575]) -> [SKIP][569] ([Intel XE#756]) +1 other test skip
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][570] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][571] ([Intel XE#2423]) +1 other test skip
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg2-set2:     [SKIP][572] ([Intel XE#2423] / [i915#2575]) -> [SKIP][573] ([Intel XE#1091] / [Intel XE#2849])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@testdisplay:
    - shard-dg2-set2:     [DMESG-WARN][574] ([Intel XE#2705]) -> [SKIP][575] ([Intel XE#2423])
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@testdisplay.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@testdisplay.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#1130]) -> [SKIP][577] ([Intel XE#1280] / [Intel XE#455])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#1123]) -> [SKIP][579] ([Intel XE#1130]) +2 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][580] ([Intel XE#1130]) -> [SKIP][581] ([Intel XE#1126])
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-bmg:          [SKIP][582] ([Intel XE#1130]) -> [SKIP][583] ([Intel XE#3889]) +1 other test skip
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][584] ([Intel XE#1130]) -> [SKIP][585] ([Intel XE#2905]) +13 other tests skip
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-dg2-set2:     [SKIP][586] ([Intel XE#3889]) -> [SKIP][587] ([Intel XE#1130])
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-dg2-set2:     [SKIP][588] ([Intel XE#1130]) -> [SKIP][589] ([Intel XE#3889])
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     [SKIP][590] ([Intel XE#2905]) -> [SKIP][591] ([Intel XE#1130]) +18 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_eudebug_online@debugger-reopen.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][592] ([Intel XE#2905]) -> [SKIP][593] ([Intel XE#1130]) +15 other tests skip
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@xe_eudebug_online@single-step-one.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][594] ([Intel XE#2322]) -> [SKIP][595] ([Intel XE#1130]) +12 other tests skip
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][596] ([Intel XE#1392]) -> [SKIP][597] ([Intel XE#1130]) +2 other tests skip
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][598] ([Intel XE#1130]) -> [SKIP][599] ([Intel XE#2322]) +13 other tests skip
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-userptr:
    - shard-dg2-set2:     [SKIP][600] ([Intel XE#288]) -> [SKIP][601] ([Intel XE#1130]) +41 other tests skip
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_exec_fault_mode@many-userptr.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][602] ([Intel XE#1130]) -> [SKIP][603] ([Intel XE#288]) +36 other tests skip
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][604] ([Intel XE#2360]) -> [SKIP][605] ([Intel XE#1130]) +1 other test skip
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][606] ([Intel XE#1130]) -> [SKIP][607] ([Intel XE#2360])
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][608] ([Intel XE#1130]) -> [SKIP][609] ([Intel XE#2905]) +17 other tests skip
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][610] ([Intel XE#1192]) -> [SKIP][611] ([Intel XE#2833])
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [FAIL][612] ([Intel XE#1999]) -> [SKIP][613] ([Intel XE#1192])
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_live_ktest@xe_mocs.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][614] ([Intel XE#512]) -> [SKIP][615] ([Intel XE#1130])
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_mmap@small-bar.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_mmap@small-bar.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][616] ([Intel XE#1130]) -> [SKIP][617] ([Intel XE#2541] / [Intel XE#3573]) +11 other tests skip
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_oa@non-privileged-access-vaddr.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][618] ([Intel XE#1130]) -> [SKIP][619] ([Intel XE#2248])
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][620] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][621] ([Intel XE#1130]) +13 other tests skip
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][622] ([Intel XE#1130]) -> [SKIP][623] ([Intel XE#1337])
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][624] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][625] ([Intel XE#1130])
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][626] ([Intel XE#1130]) -> [SKIP][627] ([Intel XE#979])
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][628] ([Intel XE#1061]) -> [FAIL][629] ([Intel XE#1173])
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_peer2peer@write.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          [SKIP][630] ([Intel XE#1130]) -> [SKIP][631] ([Intel XE#2284])
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@xe_pm@d3cold-mmap-system.html
    - shard-dg2-set2:     [SKIP][632] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][633] ([Intel XE#1130]) +1 other test skip
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][634] ([Intel XE#1130]) -> [SKIP][635] ([Intel XE#2284])
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_pm@d3cold-mocs.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][636] ([Intel XE#2284]) -> [SKIP][637] ([Intel XE#1130]) +3 other tests skip
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][638] ([Intel XE#1033] / [Intel XE#569]) -> [SKIP][639] ([Intel XE#1130]) +2 other tests skip
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_pm@s3-basic-exec.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [ABORT][640] ([Intel XE#1358] / [Intel XE#1794]) -> [SKIP][641] ([Intel XE#1130]) +1 other test skip
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [SKIP][642] ([Intel XE#1130]) -> [DMESG-WARN][643] ([Intel XE#4172] / [Intel XE#569])
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic:
    - shard-bmg:          [SKIP][644] ([Intel XE#1130]) -> [DMESG-WARN][645] ([Intel XE#4172])
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_pm@s4-basic.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@xe_pm@s4-basic.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][646] ([Intel XE#579]) -> [SKIP][647] ([Intel XE#1130])
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
    - shard-bmg:          [SKIP][648] ([Intel XE#1130]) -> [SKIP][649] ([Intel XE#579])
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][650] ([Intel XE#1130]) -> [SKIP][651] ([Intel XE#944]) +2 other tests skip
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_query@multigpu-query-engines.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          [SKIP][652] ([Intel XE#1130]) -> [SKIP][653] ([Intel XE#944]) +5 other tests skip
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_query@multigpu-query-gt-list.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][654] ([Intel XE#944]) -> [SKIP][655] ([Intel XE#1130]) +2 other tests skip
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][656] ([Intel XE#944]) -> [SKIP][657] ([Intel XE#1130]) +4 other tests skip
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_query@multigpu-query-topology.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     [SKIP][658] ([Intel XE#1130]) -> [SKIP][659] ([Intel XE#4130])
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [SKIP][660] ([Intel XE#1130]) -> [SKIP][661] ([Intel XE#4130])
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
    - shard-dg2-set2:     [SKIP][662] ([Intel XE#4130]) -> [SKIP][663] ([Intel XE#1130]) +1 other test skip
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [SKIP][664] ([Intel XE#3342]) -> [SKIP][665] ([Intel XE#1130]) +1 other test skip
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
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
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
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
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
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
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3 -> xe-pw-144103v1

  IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3: 683350734da38bc7332a3b87c9f2faf6bbeeb5a3
  xe-pw-144103v1: 144103v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/index.html

--===============4460320739580426980==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Allow display PHYs to reset power state</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144103/">https://patchwork.freedesktop.org/series/144103/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3_full -&gt; xe-pw-144103v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144103v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-144103v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-144103v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-8/igt@core_hotunplug@hotreplug.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-4/igt@kms_mmap_write_crc@main.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@kms_mmap_write_crc@main.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144103v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@core_getstats.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@core_getstats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_big_fb@x-tiled-addfb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_big_fb@x-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +153 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_content_protection@legacy@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_flip@busy-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +139 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_flip@flip-vs-wf_vblank-interruptible@d-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_properties@connector-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_properties@connector-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +108 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-6/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@xe_eudebug@multigpu-basic-client-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +262 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_module_load@many-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@xe_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-8/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-lnl-6/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +249 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@core_getversion@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@core_getversion@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@fbdev@eof.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@fbdev@nullptr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_3d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> +125 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_big_fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> +26 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-d-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-2/igt@kms_display_modes@extended-mode-basic@pipe-b-hdmi-a-3-pipe-d-dp-2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> +37 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> +109 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_plane_cursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-8/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-6/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_pm_rpm@legacy-planes-dpms.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-3/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-3/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-7/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> +222 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> +258 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2692">Intel XE#2692</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323">Intel XE#2323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_plane_cursor@primary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_pm_dc@dc5-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_pm_dc@dc5-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-5/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_vblank@wait-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@kms_vblank@wait-busy-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@testdisplay.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_eudebug@basic-vm-access-parameters-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@xe_eudebug@basic-vm-access-parameters-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_eudebug_online@debugger-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-436/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-4/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_pm@s4-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-6/igt@xe_pm@s4-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-463/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-436/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-433/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-466/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-dg2-434/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-dg2-433/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v1/shard-bmg-3/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3 -&gt; xe-pw-144103v1</li>
</ul>
<p>IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2569-683350734da38bc7332a3b87c9f2faf6bbeeb5a3: 683350734da38bc7332a3b87c9f2faf6bbeeb5a3<br />
  xe-pw-144103v1: 144103v1</p>

</body>
</html>

--===============4460320739580426980==--
