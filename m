Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79014C8303D
	for <intel-xe@archiver.kernel.org>; Sat,  5 Jul 2025 15:25:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1565410E22B;
	Sat,  5 Jul 2025 15:25:19 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A4F10E219;
 Sat,  5 Jul 2025 15:25:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5107787964973879966=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_Crashlog_Type1_Version2_su?=
 =?utf-8?q?pport_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 05 Jul 2025 15:25:17 -0000
Message-ID: <175172911778.137301.14012571011416828925@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250703211150.135320-1-michael.j.ruhl@intel.com>
In-Reply-To: <20250703211150.135320-1-michael.j.ruhl@intel.com>
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

--===============5107787964973879966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Crashlog Type1 Version2 support (rev6)
URL   : https://patchwork.freedesktop.org/series/149120/
State : success

== Summary ==

CI Bug Log - changes from xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac_FULL -> xe-pw-149120v6_FULL
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

  Here are the changes found in xe-pw-149120v6_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][1] -> [FAIL][2] ([Intel XE#827]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-addfb:
    - shard-dg2-set2:     [PASS][3] -> [SKIP][4] ([Intel XE#2351] / [Intel XE#4208])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_big_fb@x-tiled-addfb.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_big_fb@x-tiled-addfb.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][5] -> [DMESG-FAIL][6] ([Intel XE#4543])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#2191])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
    - shard-bmg:          [PASS][8] -> [SKIP][9] ([Intel XE#2314] / [Intel XE#2894])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#787]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#787]) +167 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#3442])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#4417]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_edid@dp-mode-timings:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2252])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-8/igt@kms_chamelium_edid@dp-mode-timings.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#373]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#307])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][23] ([Intel XE#1178]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][24] ([Intel XE#1188])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-1/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     [PASS][25] -> [SKIP][26] ([Intel XE#4208] / [i915#2575]) +14 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#2291]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][29] -> [FAIL][30] ([Intel XE#1475])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#4302])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#455]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#310]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#2316]) +9 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1:
    - shard-adlp:         [PASS][37] -> [DMESG-WARN][38] ([Intel XE#4543]) +3 other tests dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-2/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-9/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible:
    - shard-adlp:         [PASS][39] -> [DMESG-WARN][40] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-6/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-2/igt@kms_flip@dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][41] -> [INCOMPLETE][42] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#651])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#651]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#656]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2311])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#653])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#1503]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#3012])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#4596])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1489])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1489]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-6/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@psr-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#2850] / [Intel XE#929])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@kms_psr@psr-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#2939])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#1435])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#455]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@xe_compute_preempt@compute-preempt-many-all-ram.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#4837])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#4837]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#4208]) +42 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][66] -> [SKIP][67] ([Intel XE#1392]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#288]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#288]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#2360])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_system_allocator@many-large-mmap-shared-remap-eocheck:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#4915]) +39 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@xe_exec_system_allocator@many-large-mmap-shared-remap-eocheck.html

  * igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4943])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-8/igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-free-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#4915]) +24 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@xe_exec_system_allocator@process-many-free-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][74] -> [FAIL][75] ([Intel XE#5018])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_oa@oa-exponents:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-6/igt@xe_oa@oa-exponents.html

  * igt@xe_oa@oa-exponents@ccs-0:
    - shard-lnl:          [PASS][77] -> [TIMEOUT][78] ([Intel XE#5339]) +1 other test timeout
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-lnl-3/igt@xe_oa@oa-exponents@ccs-0.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-lnl-6/igt@xe_oa@oa-exponents@ccs-0.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#2284] / [Intel XE#366])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-6/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#944])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#944])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#4814])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@xe_render_copy@render-stress-0-copies.html

  
#### Possible fixes ####

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][84] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-bmg:          [FAIL][86] ([Intel XE#5376]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][88] ([Intel XE#2291]) -> [PASS][89] +8 other tests pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][90] ([Intel XE#4294]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-8/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][92] ([Intel XE#2373]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][94] ([Intel XE#301]) -> [PASS][95] +1 other test pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][96] ([Intel XE#2316]) -> [PASS][97] +9 other tests pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][98] ([Intel XE#4543]) -> [PASS][99] +13 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-3/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-2/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][100] -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-adlp:         [FAIL][102] ([Intel XE#3098]) -> [PASS][103] +1 other test pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-1/igt@kms_flip@plain-flip-fb-recreate.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#1392]) -> [PASS][105] +9 other tests pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_module_load@reload-no-display:
    - shard-adlp:         [DMESG-WARN][106] ([Intel XE#4792]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-4/igt@xe_module_load@reload-no-display.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-adlp:         [ABORT][108] ([Intel XE#4847]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-4/igt@xe_pm@s3-vm-bind-prefetch.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-adlp:         [ABORT][110] -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-1/igt@xe_wedged@wedged-mode-toggle.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-6/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#316]) -> [SKIP][113] ([Intel XE#4208])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1124]) -> [SKIP][115] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#367]) -> [SKIP][117] ([Intel XE#4208] / [i915#2575])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][119] ([Intel XE#4208])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][121] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][122] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][123] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#306]) -> [SKIP][125] ([Intel XE#4208] / [i915#2575])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#373]) -> [SKIP][127] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][128] ([Intel XE#1178]) -> [SKIP][129] ([Intel XE#4208] / [i915#2575])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_content_protection@atomic.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][130] ([Intel XE#2341]) -> [FAIL][131] ([Intel XE#1188])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/igt@kms_content_protection@uevent.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-1/igt@kms_content_protection@uevent.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][132] ([Intel XE#4543]) -> [DMESG-WARN][133] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) +1 other test dmesg-warn
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#455]) -> [SKIP][135] ([Intel XE#4208])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][136] ([Intel XE#2311]) -> [SKIP][137] ([Intel XE#2312]) +19 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#651]) -> [SKIP][139] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][140] ([Intel XE#4141]) -> [SKIP][141] ([Intel XE#2312]) +12 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][142] ([Intel XE#2312]) -> [SKIP][143] ([Intel XE#4141]) +8 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][144] ([Intel XE#2312]) -> [SKIP][145] ([Intel XE#2311]) +18 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#651]) -> [SKIP][147] ([Intel XE#4208]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][148] ([Intel XE#2313]) -> [SKIP][149] ([Intel XE#2312]) +20 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#653]) -> [SKIP][151] ([Intel XE#2351] / [Intel XE#4208])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][152] ([Intel XE#658]) -> [SKIP][153] ([Intel XE#2351] / [Intel XE#4208])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#653]) -> [SKIP][155] ([Intel XE#4208]) +6 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][156] ([Intel XE#2312]) -> [SKIP][157] ([Intel XE#2313]) +15 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][158] ([Intel XE#5021]) -> [SKIP][159] ([Intel XE#4596])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#3309]) -> [SKIP][161] ([Intel XE#4208])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_pm_dc@dc5-retention-flops.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         [SKIP][162] -> [SKIP][163] ([Intel XE#836])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#1489]) -> [SKIP][165] ([Intel XE#4208]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][167] ([Intel XE#4208]) +3 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#1127]) -> [SKIP][169] ([Intel XE#4208] / [i915#2575])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#455]) -> [SKIP][171] ([Intel XE#4208] / [i915#2575])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][172] ([Intel XE#1729]) -> [SKIP][173] ([Intel XE#2426])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][174] ([Intel XE#2509]) -> [SKIP][175] ([Intel XE#2426])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1500]) -> [SKIP][177] ([Intel XE#362])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     [SKIP][178] -> [SKIP][179] ([Intel XE#4208])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_eu_stall@invalid-gt-id.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#4837]) -> [SKIP][181] ([Intel XE#4208]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#288]) -> [SKIP][183] ([Intel XE#4208]) +6 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#4915]) -> [SKIP][185] ([Intel XE#4208]) +56 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-large-mmap.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-large-mmap.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#512]) -> [SKIP][187] ([Intel XE#4208])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_mmap@small-bar.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@xe_mmap@small-bar.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][189] ([Intel XE#4208])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_oa@invalid-oa-format-id.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][191] ([Intel XE#4208])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_oa@syncs-ufence-wait.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][192] ([Intel XE#5166]) -> [SKIP][193] ([Intel XE#4208])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_pmu@gt-frequency.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@xe_pmu@gt-frequency.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#944]) -> [SKIP][195] ([Intel XE#4208])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_query@multigpu-query-oa-units.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#3342]) -> [SKIP][197] ([Intel XE#4208])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_sriov_flr@flr-vf1-clear.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
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
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4847]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4847
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5166]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5166
  [Intel XE#5339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5339
  [Intel XE#5376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5376
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac -> xe-pw-149120v6

  IGT_8438: 8438
  xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac: 05fd9cf9ba87dcf4428adbca5237845f2c04d8ac
  xe-pw-149120v6: 149120v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/index.html

--===============5107787964973879966==
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
<tr><td><b>Series:</b></td><td>Crashlog Type1 Version2 support (rev6)</td><=
/tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149120/">https://patchwork.freedesktop.org/series/149120/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149120v6/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149120v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3344-05fd9cf9ba87dcf4428adbca5237845f2=
c04d8ac_FULL -&gt; xe-pw-149120v6_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149120v6_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-8/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/sha=
rd-adlp-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-=
a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_bi=
g_fb@x-tiled-addfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_big_fb@x-tiled-addfb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-3/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-a=
dlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_bw@connected-linear-tili=
ng-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-8/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-6/igt@kms_bw@linear-tiling-1-displ=
ays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_ccs@bad-rotation-90-4-ti=
led-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_ccs@bad-rotation-90-4-ti=
led-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +167 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg=
2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-dg2-433/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-mode-timings:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-bmg-8/igt@kms_chamelium_edid@dp-mode-ti=
mings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_chamelium_hpd@dp-hpd-fas=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-6/igt@kms_content_protection@dp-ms=
t-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-dg2-433/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-bmg-1/igt@kms_content_protection@uevent=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_cu=
rsor_crc@cursor-onscreen-64x64.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_cursor_c=
rc@cursor-onscreen-64x64.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +14 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/sh=
ard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-6/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-8/igt@kms_disp=
lay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-6/igt@kms_display_mod=
es@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@kms_dsc@dsc-with-output-for=
mats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-6/igt@kms_flip@2x-flip-vs-dpms-off=
-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-1/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-5/igt@kms_fli=
p@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +9 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-2/igt@kms_fli=
p@dpms-off-confusion-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-9/i=
gt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Inte=
l XE#4543</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-6/igt@kms_fli=
p@dpms-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-2/igt@kms_flip=
@dpms-vs-vblank-race-interruptible.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4=
173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-2/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-5/igt@kms_flip@flip-=
vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +=
1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_frontbuffer_tracking@drr=
s-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@kms_frontbuffer_tracking@dr=
rs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-8/igt@kms_hdr@=
static-toggle-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-6/igt@kms_hdr@static-toggle-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1503">Intel XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-1/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-6/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-3/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-5/igt@kms_plane_multiple@2x-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-plane-=
move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_psr2_sf@psr2-primary-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-6/igt@kms_psr@fbc-psr2-cursor-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@kms_psr@psr-primary-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_psr_stress_test@flip-pri=
mary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-1/igt@kms_setm=
ode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-5/igt@kms_setmode@clone-ex=
clusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@xe_compute_preempt@compute-p=
reempt-many-all-ram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@xe_eudebug_online@debugger-r=
eopen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@xe_eudebug_online@preempt-b=
reakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_evi=
ct_ccs@evict-overcommit-standalone-instantfree-reopen.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-d=
g2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@xe_exec_fault_mode@once-bind=
execqueue-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@xe_exec_mix_modes@exec-spinn=
er-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-shared-remap-eocheck:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@xe_exec_system_allocator@man=
y-large-mmap-shared-remap-eocheck.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +39 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-bmg-8/igt@xe_exec_system_allocator@once=
-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-free-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@xe_exec_system_allocator@pr=
ocess-many-free-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +24 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-lnl-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1491=
20v6/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-=
new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-6/igt@xe_oa@oa-exponents.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"=
>Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@ccs-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-lnl-3/igt@xe_oa@oa=
-exponents@ccs-0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149120v6/shard-lnl-6/igt@xe_oa@oa-exponents@ccs-0.htm=
l">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5339">Intel XE#5339</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@xe_oa@syncs-syncobj-wait-cf=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-6/igt@xe_pm@s2idle-d3cold-basic-ex=
ec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@xe_query@multigpu-query-hwc=
onfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@xe_query@multigpu-query-inva=
lid-query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149120v6/shard-dg2-435/igt@xe_render_copy@render-stres=
s-0-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149120v6/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x=
1080p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5376">Intel XE#5376</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-b=
mg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149120v6/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-6/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-8/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-6/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-8/igt@kms_fe=
ature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149120v6/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@ad-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-3/igt@kms_flip@2x-=
nonexisting-fb.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-3/igt@kms_fli=
p@basic-flip-vs-dpms@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp=
-2/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> +13 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-6/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-6/igt@kms_flip@=
flip-vs-rmfb-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-1/igt@kms_fli=
p@plain-flip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_f=
lip@plain-flip-fb-recreate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg=
2-466/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">PASS</a> +9 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-4/igt@xe_modu=
le_load@reload-no-display.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4792">Intel XE#4792</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/i=
gt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-4/igt@xe_pm@s=
3-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4847">Intel XE#4847</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@xe_pm@s3-v=
m-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-1/igt@xe_wedg=
ed@wedged-mode-toggle.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-6/igt@xe_wedged@wedged-mode=
-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_bi=
g_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@km=
s_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel =
XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149120v6/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_bw=
@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-46=
6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_cc=
s@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard=
-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1491=
20v6/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-464/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel X=
E#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_ch=
amelium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_cham=
elium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_ch=
amelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shar=
d-dg2-466/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_co=
ntent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_c=
ontent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-1/igt@kms_conte=
nt_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adl=
p-2/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#295=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173=
">Intel XE#4173</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149120v6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-yt=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149120v6/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49120v6/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1491=
20v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v=
6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4141">Intel XE#4141</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel=
 XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149120v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/sh=
ard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
120v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel=
 XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149120v6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-s=
pr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/=
igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120=
v6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-mov=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9120v6/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-7/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_pm=
_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms_p=
m_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-adlp-4/igt@kms_pm_=
rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-adlp-3/igt@kms_pm_rpm@dpms=
-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_ps=
r2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel =
XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149120v6/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continu=
ous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_ps=
r@fbc-pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@kms=
_psr@fbc-pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg=
2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@kms_se=
tmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/=
igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-bmg-4/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/sha=
rd-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-435/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/s=
hard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_eu_=
stall@invalid-gt-id.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@xe_eu_stall@invalid-gt-=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_eud=
ebug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg=
2-466/igt@xe_eudebug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_exe=
c_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-4=
66/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_exe=
c_system_allocator@threads-many-large-mmap.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shar=
d-dg2-466/igt@xe_exec_system_allocator@threads-many-large-mmap.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_mma=
p@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/512">Intel XE#512</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@xe_mmap@small-bar.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_oa@=
invalid-oa-format-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-46=
6/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_oa@=
syncs-ufence-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/s=
hard-dg2-466/igt@xe_oa@syncs-ufence-wait.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_pmu=
@gt-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5166">Intel XE#5166</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@xe_pmu@gt-frequ=
ency.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_que=
ry@multigpu-query-oa-units.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@xe_q=
uery@multigpu-query-oa-units.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/shard-dg2-436/igt@xe_sri=
ov_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/shard-dg2-466/igt@xe_sriov=
_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac -&gt; xe-pw-149=
120v6</li>
</ul>
<p>IGT_8438: 8438<br />
  xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac: 05fd9cf9ba87dcf4428adbc=
a5237845f2c04d8ac<br />
  xe-pw-149120v6: 149120v6</p>

</body>
</html>

--===============5107787964973879966==--
