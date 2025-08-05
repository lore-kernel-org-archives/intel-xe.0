Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5BEC87FD1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 12:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3172810E663;
	Tue,  5 Aug 2025 12:08:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA5910E668;
 Tue,  5 Aug 2025 12:08:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5650743648166643564=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/pf=3A_Program_LMTT_?=
 =?utf-8?q?directory_pointer_on_all_GTs_within_a_tile?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Aug 2025 12:08:50 -0000
Message-ID: <175439573017.213103.3582956929712052219@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250805091850.1508240-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250805091850.1508240-1-piotr.piorkowski@intel.com>
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

--===============5650743648166643564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Program LMTT directory pointer on all GTs within a tile
URL   : https://patchwork.freedesktop.org/series/152520/
State : success

== Summary ==

CI Bug Log - changes from xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b_FULL -> xe-pw-152520v1_FULL
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

  Here are the changes found in xe-pw-152520v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][1] -> [SKIP][2] ([Intel XE#4963])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@core_hotunplug@hotreplug.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@core_hotunplug@hotreplug.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#5715])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          [PASS][4] -> [SKIP][5] ([Intel XE#5547])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@device_reset@unbind-reset-rebind.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@write:
    - shard-bmg:          [PASS][6] -> [SKIP][7] ([Intel XE#2134])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@fbdev@write.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@fbdev@write.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#5177])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#3718] / [Intel XE#827])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#827])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#873])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#4947]) +50 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#4947]) +13 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#316])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][18] -> [DMESG-FAIL][19] ([Intel XE#4543])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#2314] / [Intel XE#2894])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2191])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +237 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#787]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][27] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#455] / [Intel XE#787]) +41 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#4417]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#306])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#373]) +4 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][32] ([Intel XE#1178])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][33] ([Intel XE#1178]) +2 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#1188])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-433/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#308])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2291])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#323])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#4494])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#4354])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#4331])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2316]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_flip@2x-blocking-wf_vblank.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][44] -> [FAIL][45] ([Intel XE#3321]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#310])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#4950]) +48 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-adlp:         [PASS][49] -> [DMESG-WARN][50] ([Intel XE#4543]) +5 other tests dmesg-warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:
    - shard-bmg:          [PASS][51] -> [INCOMPLETE][52] ([Intel XE#2049] / [Intel XE#2597])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#455]) +7 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2293])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2380])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#651]) +11 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#651])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#653]) +12 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#656])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#1503])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_lease@possible-crtcs-filtering:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#4950]) +39 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_lease@possible-crtcs-filtering.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
    - shard-adlp:         [PASS][63] -> [DMESG-WARN][64] ([Intel XE#2953] / [Intel XE#4173])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-9/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2763]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#870]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#4962]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_pm_rpm@basic-pci-d3-state.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#4962])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1489]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1127]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#3414])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#1435])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1447] / [Intel XE#5617])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1123])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#5626])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#4837]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_evict@evict-beng-small-external:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][82] -> [SKIP][83] ([Intel XE#1392]) +9 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1392] / [Intel XE#5575])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@xe_exec_basic@multigpu-once-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#288]) +10 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#288] / [Intel XE#5561]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][87] ([Intel XE#3868])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#4915] / [Intel XE#5560]) +24 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#4915]) +118 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:
    - shard-bmg:          [PASS][90] -> [SKIP][91] ([Intel XE#4945]) +258 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#4945]) +161 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][93] -> [FAIL][94] ([Intel XE#5679])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_module_load@many-reload.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@xe_module_load@many-reload.html

  * igt@xe_oa@rc6-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#3573]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@xe_oa@rc6-disable.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2838] / [Intel XE#979])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2284] / [Intel XE#366])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#2284] / [Intel XE#366])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-dg2-set2:     [PASS][99] -> [INCOMPLETE][100] ([Intel XE#4504])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-434/igt@xe_pm@s2idle-basic-exec.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-435/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#579])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#944]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#4821])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@xe_spin_batch@spin-mem-copy.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [SKIP][104] ([Intel XE#4963]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@info:
    - shard-bmg:          [SKIP][106] ([Intel XE#2134]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@fbdev@info.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@fbdev@info.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [FAIL][108] ([Intel XE#911]) -> [PASS][109] +2 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][110] ([Intel XE#4947]) -> [PASS][111] +15 other tests pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][112] ([Intel XE#3862]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][114] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][115] +1 other test pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][116] ([Intel XE#3124]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][118] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][120] ([Intel XE#2291]) -> [PASS][121] +1 other test pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][122] ([Intel XE#4950]) -> [PASS][123] +71 other tests pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][124] ([Intel XE#2316]) -> [PASS][125] +2 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][126] ([Intel XE#301]) -> [PASS][127] +4 other tests pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][128] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][130] ([Intel XE#4543]) -> [PASS][131] +2 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][132] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][133] +1 other test pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [DMESG-FAIL][134] ([Intel XE#4543]) -> [PASS][135] +2 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@xe_eu_stall@non-blocking-re-enable:
    - shard-bmg:          [FAIL][136] ([Intel XE#5420]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@xe_eu_stall@non-blocking-re-enable.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@xe_eu_stall@non-blocking-re-enable.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#1392]) -> [PASS][139] +7 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_system_allocator@process-many-large-malloc-race:
    - shard-bmg:          [SKIP][140] ([Intel XE#4945]) -> [PASS][141] +336 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-malloc-race.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-malloc-race.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [DMESG-WARN][142] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-8/igt@xe_pm@s4-basic.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@xe_pm@s4-basic.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][144] ([Intel XE#4950]) -> [SKIP][145] ([Intel XE#873])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          [SKIP][146] ([Intel XE#2327]) -> [SKIP][147] ([Intel XE#4947]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          [SKIP][148] ([Intel XE#4947]) -> [SKIP][149] ([Intel XE#2327]) +5 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          [SKIP][150] ([Intel XE#4947]) -> [SKIP][151] ([Intel XE#1124]) +7 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][152] ([Intel XE#2328]) -> [SKIP][153] ([Intel XE#4947])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][154] ([Intel XE#1124]) -> [SKIP][155] ([Intel XE#4947]) +4 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][156] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][157] ([Intel XE#4950]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][158] ([Intel XE#4950]) -> [SKIP][159] ([Intel XE#2314] / [Intel XE#2894])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          [SKIP][160] ([Intel XE#367]) -> [SKIP][161] ([Intel XE#4950])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [SKIP][162] ([Intel XE#4950]) -> [SKIP][163] ([Intel XE#367]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][164] ([Intel XE#3862]) -> [SKIP][165] ([Intel XE#4947])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][166] ([Intel XE#3432]) -> [SKIP][167] ([Intel XE#4947]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][168] ([Intel XE#4947]) -> [SKIP][169] ([Intel XE#3432]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][170] ([Intel XE#2887]) -> [SKIP][171] ([Intel XE#4947]) +8 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][172] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][173] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][174] ([Intel XE#4947]) -> [SKIP][175] ([Intel XE#2887]) +9 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][176] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][177] ([Intel XE#4947])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][178] ([Intel XE#4947]) -> [SKIP][179] ([Intel XE#2724])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cdclk@plane-scaling.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-bmg:          [SKIP][180] ([Intel XE#2252]) -> [SKIP][181] ([Intel XE#4950]) +7 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_chamelium_audio@hdmi-audio.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          [SKIP][182] ([Intel XE#4950]) -> [SKIP][183] ([Intel XE#2252]) +7 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          [SKIP][184] ([Intel XE#2325]) -> [SKIP][185] ([Intel XE#4950])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_chamelium_color@ctm-limited-range.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          [SKIP][186] ([Intel XE#4950]) -> [SKIP][187] ([Intel XE#2325])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_chamelium_color@degamma.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms_chamelium_color@degamma.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][188] ([Intel XE#4950]) -> [FAIL][189] ([Intel XE#1178])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][190] ([Intel XE#2341]) -> [SKIP][191] ([Intel XE#4950])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_content_protection@content-type-change.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][192] ([Intel XE#4950]) -> [SKIP][193] ([Intel XE#2390])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][194] ([Intel XE#1178]) -> [SKIP][195] ([Intel XE#2341])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_content_protection@legacy.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-bmg:          [SKIP][196] ([Intel XE#2320]) -> [SKIP][197] ([Intel XE#4950]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          [SKIP][198] ([Intel XE#4950]) -> [SKIP][199] ([Intel XE#2320]) +4 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][200] ([Intel XE#2291]) -> [SKIP][201] ([Intel XE#4950]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][202] ([Intel XE#4950]) -> [DMESG-WARN][203] ([Intel XE#5354])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][204] ([Intel XE#4950]) -> [FAIL][205] ([Intel XE#4633])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][206] ([Intel XE#4950]) -> [FAIL][207] ([Intel XE#1475])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][208] ([Intel XE#2286]) -> [SKIP][209] ([Intel XE#4950])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][210] ([Intel XE#4947]) -> [SKIP][211] ([Intel XE#4331])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          [SKIP][212] ([Intel XE#2244]) -> [SKIP][213] ([Intel XE#4947]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_dsc@dsc-with-bpc-formats.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][214] ([Intel XE#4947]) -> [SKIP][215] ([Intel XE#5425])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][216] ([Intel XE#776]) -> [SKIP][217] ([Intel XE#4947])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][218] ([Intel XE#4950]) -> [SKIP][219] ([Intel XE#2374])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_feature_discovery@psr1.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [SKIP][220] ([Intel XE#2316]) -> [SKIP][221] ([Intel XE#4950])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          [TIMEOUT][222] ([Intel XE#1504]) -> [TIMEOUT][223] ([Intel XE#1504] / [Intel XE#5737]) +1 other test timeout
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][224] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][225] ([Intel XE#4947]) +3 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][226] ([Intel XE#4947]) -> [SKIP][227] ([Intel XE#2293] / [Intel XE#2380])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][228] ([Intel XE#4947]) -> [SKIP][229] ([Intel XE#2380])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][230] ([Intel XE#4947]) -> [SKIP][231] ([Intel XE#2311]) +21 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][232] ([Intel XE#2312]) -> [SKIP][233] ([Intel XE#4947]) +8 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][234] ([Intel XE#2312]) -> [SKIP][235] ([Intel XE#2311]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][236] ([Intel XE#2311]) -> [SKIP][237] ([Intel XE#2312]) +6 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][238] ([Intel XE#2311]) -> [SKIP][239] ([Intel XE#4947]) +16 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][240] ([Intel XE#4947]) -> [SKIP][241] ([Intel XE#5390]) +7 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][242] ([Intel XE#5390]) -> [SKIP][243] ([Intel XE#4947]) +7 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][244] ([Intel XE#5390]) -> [SKIP][245] ([Intel XE#2312]) +3 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][246] ([Intel XE#2312]) -> [SKIP][247] ([Intel XE#5390]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][248] ([Intel XE#4947]) -> [SKIP][249] ([Intel XE#2352]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][250] ([Intel XE#2313]) -> [SKIP][251] ([Intel XE#4947]) +14 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][252] ([Intel XE#2313]) -> [SKIP][253] ([Intel XE#2312]) +5 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][254] ([Intel XE#2352]) -> [SKIP][255] ([Intel XE#4947])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][256] ([Intel XE#5672]) -> [SKIP][257] ([Intel XE#4947])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][258] ([Intel XE#2312]) -> [SKIP][259] ([Intel XE#2313]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][260] ([Intel XE#4947]) -> [SKIP][261] ([Intel XE#2313]) +24 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][262] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][263] ([Intel XE#3544])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][264] ([Intel XE#1503]) -> [SKIP][265] ([Intel XE#4950])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_hdr@static-swap.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][266] ([Intel XE#4947]) -> [SKIP][267] ([Intel XE#4090])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][268] ([Intel XE#2393]) -> [SKIP][269] ([Intel XE#4950])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_plane_lowres@tiling-y.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][270] ([Intel XE#4596]) -> [SKIP][271] ([Intel XE#4950])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][272] ([Intel XE#5020]) -> [SKIP][273] ([Intel XE#4950])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][274] ([Intel XE#4950]) -> [SKIP][275] ([Intel XE#2763])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][276] ([Intel XE#870]) -> [SKIP][277] ([Intel XE#4947])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][278] ([Intel XE#4947]) -> [SKIP][279] ([Intel XE#870])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][280] ([Intel XE#3309]) -> [SKIP][281] ([Intel XE#4947])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_pm_dc@dc5-retention-flops.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          [SKIP][282] ([Intel XE#4947]) -> [SKIP][283] ([Intel XE#2499])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][284] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][285] ([Intel XE#4962])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][286] ([Intel XE#4947]) -> [SKIP][287] ([Intel XE#1489]) +5 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][288] ([Intel XE#1489]) -> [SKIP][289] ([Intel XE#4947]) +6 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][290] ([Intel XE#4947]) -> [SKIP][291] ([Intel XE#2387])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-bmg:          [SKIP][292] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][293] ([Intel XE#4947]) +6 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_psr@fbc-psr-primary-blt.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          [SKIP][294] ([Intel XE#4947]) -> [SKIP][295] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][296] ([Intel XE#2234]) -> [SKIP][297] ([Intel XE#4947])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_psr@psr2-primary-render.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][298] ([Intel XE#4947]) -> [SKIP][299] ([Intel XE#2414])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][300] ([Intel XE#4950]) -> [SKIP][301] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][302] ([Intel XE#4950]) -> [SKIP][303] ([Intel XE#2330])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][304] ([Intel XE#4950]) -> [SKIP][305] ([Intel XE#2413])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][306] ([Intel XE#2426]) -> [SKIP][307] ([Intel XE#4950])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-bmg:          [SKIP][308] ([Intel XE#4837]) -> [SKIP][309] ([Intel XE#4945]) +7 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_eudebug@discovery-race-vmbind.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][310] ([Intel XE#4945]) -> [SKIP][311] ([Intel XE#4837]) +7 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][312] ([Intel XE#4945]) -> [SKIP][313] ([Intel XE#4518])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][314] ([Intel XE#2322]) -> [SKIP][315] ([Intel XE#4945]) +3 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][316] ([Intel XE#4945]) -> [SKIP][317] ([Intel XE#2322]) +7 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][318] ([Intel XE#4943]) -> [SKIP][319] ([Intel XE#4945]) +20 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][320] ([Intel XE#4945]) -> [SKIP][321] ([Intel XE#4943]) +12 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][322] ([Intel XE#5018]) -> [FAIL][323] ([Intel XE#4937])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          [SKIP][324] ([Intel XE#4945]) -> [ABORT][325] ([Intel XE#5530])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][326] ([Intel XE#4945]) -> [SKIP][327] ([Intel XE#1420])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][328] ([Intel XE#4945]) -> [SKIP][329] ([Intel XE#2245])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][330] ([Intel XE#1173]) -> [SKIP][331] ([Intel XE#1061])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-463/igt@xe_peer2peer@read.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][332] ([Intel XE#5694]) -> [SKIP][333] ([Intel XE#4945])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_pm@d3cold-i2c.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][334] ([Intel XE#4945]) -> [SKIP][335] ([Intel XE#2284])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][336] ([Intel XE#5695]) -> [SKIP][337] ([Intel XE#4945])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_pm@d3hot-i2c.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          [SKIP][338] ([Intel XE#4945]) -> [SKIP][339] ([Intel XE#4650])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pmu@fn-engine-activity-load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [SKIP][340] ([Intel XE#4650]) -> [SKIP][341] ([Intel XE#4945])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          [SKIP][342] ([Intel XE#4945]) -> [SKIP][343] ([Intel XE#4733])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][344] ([Intel XE#4733]) -> [SKIP][345] ([Intel XE#4945])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          [SKIP][346] ([Intel XE#4945]) -> [SKIP][347] ([Intel XE#944]) +3 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_query@multigpu-query-cs-cycles.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          [SKIP][348] ([Intel XE#944]) -> [SKIP][349] ([Intel XE#4945]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_query@multigpu-query-invalid-size.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-bmg:          [SKIP][350] ([Intel XE#4945]) -> [SKIP][351] ([Intel XE#4130])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5420
  [Intel XE#5425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5547]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5547
  [Intel XE#5560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5617]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5617
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672
  [Intel XE#5679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5679
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695
  [Intel XE#5715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5715
  [Intel XE#5737]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5737
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b -> xe-pw-152520v1

  IGT_8486: 8f22580f497c9e9444cf31f53d990b1333ce40d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b: c79dfb5e415ae8c63601b02f7b3a2082d1a2345b
  xe-pw-152520v1: 152520v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/index.html

--===============5650743648166643564==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Program LMTT directory pointer on=
 all GTs within a tile</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152520/">https://patchwork.freedesktop.org/series/152520/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152520v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152520v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d=
1a2345b_FULL -&gt; xe-pw-152520v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152520v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@core_hot=
unplug@hotreplug.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@core_hotunplug@hotreplug.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@core_setmaster@master-drop-se=
t-shared-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5715">Intel XE#5715</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@device_r=
eset@unbind-reset-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@device_reset@unbind-=
reset-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5547">Intel XE#5547</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@fbdev@wr=
ite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-152520v1/shard-bmg-5/igt@fbdev@write.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@intel_hwmon@hwmon-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/51=
77">Intel XE#5177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-4/igt@kms_=
async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel X=
E#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-bmg-4/igt@kms_async_flips@alternate-syn=
c-async-flip-atomic@pipe-c-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_async_flips@invalid-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4947">Intel XE#4947</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_big_fb@4-tiled-max-hw-st=
ride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_big_=
fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_big_fb@linear-8=
bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4947">Intel XE#4947</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-9/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/s=
hard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-asy=
nc-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-ro=
tate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_bw@connected-linear-til=
ing-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +237 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-=
tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_chamelium_color@degamma=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-=
fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-433/igt@kms_content_protection@ueve=
nt@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@kms_cursor_crc@cursor-onscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-6/igt@kms_cursor_=
legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_dp_link_training@non-uhb=
r-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_dp_linktrain_fallback@d=
sc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_flip=
@2x-blocking-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-6/igt@kms_flip@2x-blocking-w=
f_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms_=
flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +=
1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_flip@2x-modeset-vs-vblan=
k-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4950">Intel XE#4950</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-6/igt@kms_fli=
p@flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_flip@flip-v=
s-blocking-wf-vblank.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +5 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend-interruptible@c-hdmi-a3.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-2/igt@kms_=
flip@flip-vs-suspend-interruptible@c-hdmi-a3.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597"=
>Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32=
bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Inte=
l XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-466/igt@kms_frontbuffer_tracking@dr=
rs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
drrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_hdr@=
static-toggle-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-6/igt@kms_hdr@static-toggle-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@possible-crtcs-filtering:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_lease@possible-crtcs-filt=
ering.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4950">Intel XE#4950</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-3/igt@kms_pla=
ne_scaling@plane-upscale-20x20-with-modifiers.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-9/i=
gt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Int=
el XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_pm_backlight@fade-with-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_pm_r=
pm@basic-pci-d3-state.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3=
-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4962">Intel XE#4962</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_pm_rpm@universal-planes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@kms_psr@fbc-pr-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_psr@fbc-psr-cursor-plan=
e-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rot=
ation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-6/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@xe_compute@ccs-mode-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1447">Intel XE#1447</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5617">Intel XE#5617</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@xe_copy_basic@mem-copy-line=
ar-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@xe_eu_stall@invalid-event-r=
eport-count.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@xe_eudebug@multigpu-basic-c=
lient-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@xe_evict@evict-beng-small-ex=
ternal.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-432/igt@xe_e=
xec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +9 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@xe_exec_basic@multigpu-once-=
userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@xe_exec_fault_mode@many-bin=
dexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@xe_exec_fault_mode@many-inva=
lid-userptr-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@xe_exec_reset@cat-error.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@xe_exec_system_allocator@pro=
cess-many-large-mmap-remap-ro.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE#5560</a>) +2=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@xe_exec_system_allocator@th=
reads-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#491=
5</a>) +118 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@xe_exec_=
system_allocator@threads-many-stride-free-nomemset.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-=
5/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">=
Intel XE#4945</a>) +258 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_ggtt_init_early.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +161 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_modul=
e_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@xe_module_load@many-reload=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5679">Intel XE#5679</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@xe_oa@rc6-disable.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573"=
>Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@xe_pm@d3cold-multiple-execs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-434/igt@xe_pm@=
s2idle-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-152520v1/shard-dg2-435/igt@xe_pm@s2idle-basic-exec.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@xe_query@multigpu-query-cs-=
cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-dg2-436/igt@xe_spin_batch@spin-mem-copy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4821">Intel XE#4821</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@core_hot=
unplug@hotrebind-lateclose.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@core=
_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@fbdev@in=
fo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@fbdev@info.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-5/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911=
">Intel XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-152520v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-fli=
p-events-linear-atomic@pipe-c-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-b=
mg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> +15=
 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-432/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/=
shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-464/igt@kms_ccs@random-c=
cs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3=
124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52520v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a=
-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152520v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-4/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +71 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg=
-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +2 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shar=
d-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1525=
20v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/=
igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +2 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_fl=
ip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/sh=
ard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-2/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152520v1/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a=
-1-y-to-x.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-re-enable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@xe_eu_st=
all@non-blocking-re-enable.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5420">Intel XE#5420</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@xe_e=
u_stall@non-blocking-re-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-=
dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +=
7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_=
system_allocator@process-many-large-malloc-race.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1=
/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-malloc-race.ht=
ml">PASS</a> +336 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-adlp-8/igt@xe_pm@s=
4-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-adlp-3/igt@xe=
_pm@s4-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_asyn=
c_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms_=
async_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_big_=
fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_=
big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_=
fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms_b=
ig_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_big_=
fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms_b=
ig_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_big_=
fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_big_fb@y-t=
iled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_big_=
fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms=
_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152520v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x=
1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/sh=
ard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314=
">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_bw@l=
inear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/ig=
t@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_bw@l=
inear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/=
igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-2/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard=
-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bm=
g-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard=
-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Inte=
l XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_ccs@=
missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-b=
mg-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE=
#4947</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-466/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg=
-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#288=
7</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_ccs@=
random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/sha=
rd-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_cdclk@plane=
-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_cham=
elium_audio@hdmi-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_cham=
elium_audio@hdmi-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cham=
elium_audio@hdmi-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms=
_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_cham=
elium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@k=
ms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cham=
elium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms_chameli=
um_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cont=
ent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@kms_=
content_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_cont=
ent_protection@content-type-change.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/=
igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_cont=
ent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@km=
s_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-6/igt@kms_conte=
nt_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_curs=
or_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/=
igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_curs=
or_crc@cursor-sliding-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms=
_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-b=
mg-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE=
#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel =
XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152520v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/sha=
rd-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">=
Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/=
shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/ig=
t@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_dsc@=
dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_dsc@ds=
c-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fbco=
n_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms_fbcon_fbt=
@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5425">Intel XE#5425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_fbco=
n_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_fbcon_fbt@p=
sr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_feature_=
discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_flip=
@2x-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_flip=
@2x-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-4/igt@kms_flip=
@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-lnl-4=
/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5737">In=
tel XE#5737</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#=
4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152520v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytil=
e-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">I=
ntel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152520v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32=
bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
520v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4947">Intel XE#4947</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152520v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152520v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-=
bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel =
XE#4947</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1525=
20v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5390">Intel XE#5390</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1525=
20v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4947">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1525=
20v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1=
/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/i=
gt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52520v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4947">Intel XE#4947</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152520v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/ig=
t@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5672">Intel XE#5672</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@k=
ms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152520v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-=
bmg-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel =
XE#2313</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-8/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_hdr@=
static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_hdr@static-swap=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard=
-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Inte=
l XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_plan=
e_lowres@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_plane_low=
res@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_p=
lane_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_plane_m=
ultiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1525=
20v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-facto=
r-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_pm_b=
acklight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_pm_=
backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_pm_b=
acklight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms_=
pm_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_pm_dc=
@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_pm_l=
psp@kms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_pm_lpsp@kms-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_pm_r=
pm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bm=
g-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr2=
_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shar=
d-bmg-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">In=
tel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_psr2=
_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1=
489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52520v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4947">Intel XE#4947</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_psr2_su@=
page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-1/igt@kms_psr@=
fbc-psr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/i=
gt@kms_psr@fbc-psr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr@=
fbc-psr-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@kms_psr@=
fbc-psr-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +10 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@kms_psr@=
psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@kms_psr@psr=
2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/sha=
rd-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">=
Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_rota=
tion_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@km=
s_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bm=
g-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2=
330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@kms_scal=
ing_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@kms=
_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/sha=
rd-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">=
Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_eudeb=
ug@discovery-race-vmbind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@xe_eud=
ebug@discovery-race-vmbind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +7 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_eudeb=
ug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@xe_eu=
debug_online@single-step-one.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_eudeb=
ug_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@xe_eudebu=
g_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-=
bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel =
XE#4945</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#494=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
520v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-inv=
alidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2322">Intel XE#2322</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_exec_=
system_allocator@threads-many-large-execqueues-mmap-new-huge.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Inte=
l XE#4943</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-152520v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-e=
xecqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +20 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_exec_=
system_allocator@threads-many-mmap-new-huge-nomemset.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#494=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152=
520v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-n=
omemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4943">Intel XE#4943</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-lnl-7/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5018">Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152520v1/shard-lnl-7/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937">Intel XE#=
4937</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1=
/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pat@p=
at-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@xe_pat@pat-index=
-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1/igt@xe_pat@pat-index-=
xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-dg2-463/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-dg2-432/igt@xe_peer2peer@read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5694">Intel XE#5694</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@xe_pm@d3cold-i2c.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@xe_pm@d3col=
d-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_pm@d3=
hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5695">Intel XE#5695</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@xe_pm@d3hot-i2c.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/494=
5">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pmu@f=
n-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-3/igt@xe_pmu@f=
n-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_pmu@f=
n-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/ig=
t@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_pxp@p=
xp-stale-queue-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-1=
/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-6/igt@xe_pxp@p=
xp-termination-key-update-post-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bm=
g-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4=
945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_query=
@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-8/igt@xe_qu=
ery@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-3/igt@xe_query=
@multigpu-query-invalid-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152520v1/shard-bmg-5/igt@xe_q=
uery@multigpu-query-invalid-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b/shard-bmg-5/igt@xe_sriov=
_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#=
4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152520v1/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-=
reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b -&gt; xe-pw-152=
520v1</li>
</ul>
<p>IGT_8486: 8f22580f497c9e9444cf31f53d990b1333ce40d5 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b: c79dfb5e415ae8c63601b02=
f7b3a2082d1a2345b<br />
  xe-pw-152520v1: 152520v1</p>

</body>
</html>

--===============5650743648166643564==--
