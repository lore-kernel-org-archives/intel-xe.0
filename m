Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04264CA0FE9
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 12:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A411910E641;
	Tue, 26 Aug 2025 12:06:55 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41CF10E641;
 Tue, 26 Aug 2025 12:06:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5540985528372967779=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_Handle_Firmware_reported_H?=
 =?utf-8?q?ardware_Errors_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Aug 2025 12:06:54 -0000
Message-ID: <175621001472.270220.14620467280482556069@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250826063419.3022216-1-riana.tauro@intel.com>
In-Reply-To: <20250826063419.3022216-1-riana.tauro@intel.com>
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

--===============5540985528372967779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Handle Firmware reported Hardware Errors (rev9)
URL   : https://patchwork.freedesktop.org/series/149756/
State : success

== Summary ==

CI Bug Log - changes from xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577_FULL -> xe-pw-149756v9_FULL
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

  Here are the changes found in xe-pw-149756v9_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] ([Intel XE#4208])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@core_setmaster@master-drop-set-root.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     [PASS][3] -> [SKIP][4] ([Intel XE#2134])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@fbdev@unaligned-read.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@fbdev@unaligned-read.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#911]) +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-5/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][10] -> [DMESG-FAIL][11] ([Intel XE#4543]) +15 other tests dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][12] ([Intel XE#4543]) +1 other test dmesg-fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1124]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-4/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#619])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-9/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2328])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +6 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2314] / [Intel XE#2894])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#2191])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#787]) +160 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +6 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][22] ([Intel XE#3862])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#3432]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#3432])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#787]) +14 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#2907])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#455] / [Intel XE#787]) +28 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][29] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#4416]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2325]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#373])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-9/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2252]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#373])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#373]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][37] ([Intel XE#1178])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2390])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#307])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#3278])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-5/igt@kms_content_protection@lic-type-1.html
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2341])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-2/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#308]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#4208] / [i915#2575]) +13 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2321])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#2291])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#309]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#309]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-bmg:          [PASS][49] -> [DMESG-WARN][50] ([Intel XE#5354]) +2 other tests dmesg-warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-8/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-8/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#455]) +7 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1340])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#2373])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-5/igt@kms_feature_discovery@display-2x.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1421])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-7/igt@kms_flip@2x-flip-vs-modeset.html
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#310])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-8/igt@kms_flip@2x-flip-vs-modeset.html
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2316])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2316]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - shard-adlp:         [PASS][60] -> [DMESG-WARN][61] ([Intel XE#4543]) +13 other tests dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-1/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-8/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][62] -> [SKIP][63] ([Intel XE#4208] / [i915#2575]) +94 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@kms_flip@busy-flip.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][64] ([Intel XE#4543]) +3 other tests dmesg-warn
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][65] -> [FAIL][66] ([Intel XE#301])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#301] / [Intel XE#3149])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-adlp:         [PASS][69] -> [DMESG-WARN][70] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][71] ([Intel XE#2049] / [Intel XE#2597])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2293]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][73] -> [DMESG-FAIL][74] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1401] / [Intel XE#1745])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1401])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2311]) +16 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#4208]) +64 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][80] -> [SKIP][81] ([Intel XE#2351] / [Intel XE#4208]) +11 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#5390]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2312]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#656]) +6 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#651]) +8 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#651]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#656]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#651])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2313]) +11 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#653]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#653]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#1503])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#2927])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][96] -> [FAIL][97] ([Intel XE#616]) +1 other test fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@kms_plane_cursor@viewport.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#2763]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2763]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1129])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#1406] / [Intel XE#1489])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1406] / [Intel XE#2893])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1406] / [Intel XE#1489])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1406])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1406] / [Intel XE#4609])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-7/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1406] / [Intel XE#4208]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_psr@psr2-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-1/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#1406] / [Intel XE#2414])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#3414] / [Intel XE#3904])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2426])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#1499]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-8/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#455]) +7 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#455] / [Intel XE#5632])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-8/igt@xe_compute_preempt@compute-preempt-many.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][117] ([Intel XE#5890]) +1 other test fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#4837]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-5/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#4837]) +4 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#4837]) +6 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#4837] / [Intel XE#5565]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-2/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#4518])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-466/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#4518])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-3/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#4519])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-9/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#5793])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-7/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@many-execqueues-null:
    - shard-adlp:         [PASS][126] -> [DMESG-WARN][127] ([Intel XE#3876])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-4/igt@xe_exec_basic@many-execqueues-null.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-9/igt@xe_exec_basic@many-execqueues-null.html
    - shard-bmg:          [PASS][128] -> [DMESG-WARN][129] ([Intel XE#3876])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-3/igt@xe_exec_basic@many-execqueues-null.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-5/igt@xe_exec_basic@many-execqueues-null.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][130] -> [SKIP][131] ([Intel XE#1392]) +5 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#1392] / [Intel XE#5575]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2322]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1392])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#288] / [Intel XE#5561]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#288]) +7 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html

  * igt@xe_exec_system_allocator@once-mmap-new-race:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#4915]) +59 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-9/igt@xe_exec_system_allocator@once-mmap-new-race.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#4915]) +66 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free.html

  * igt@xe_exec_system_allocator@threads-many-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#4943]) +13 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-mmap-huge.html

  * igt@xe_exec_system_allocator@twice-large-mmap-free-huge:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#4943]) +4 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-5/igt@xe_exec_system_allocator@twice-large-mmap-free-huge.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate:
    - shard-dg2-set2:     [PASS][141] -> [DMESG-WARN][142] ([Intel XE#3876])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@xe_exec_threads@threads-hang-userptr-invalidate.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@xe_exec_threads@threads-hang-userptr-invalidate.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          NOTRUN -> [ABORT][143] ([Intel XE#5530])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#2229])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#5103])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@xe_oa@buffer-size.html
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#5103])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-1/igt@xe_oa@buffer-size.html

  * igt@xe_oa@stress-open-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#3573])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/igt@xe_oa@stress-open-close.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#3573]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-2/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [PASS][149] -> [SKIP][150] ([Intel XE#4208]) +165 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@xe_pm@s2idle-exec-after.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2284])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-2/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#579])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#579])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-3/igt@xe_pm@vram-d3cold-threshold.html
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#5611] / [Intel XE#579])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-3/igt@xe_pm@vram-d3cold-threshold.html
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#579])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#584])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#4733])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#944])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#2134]) -> [PASS][160] +2 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@fbdev@read.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@fbdev@read.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][161] ([Intel XE#4665]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-3/igt@intel_hwmon@hwmon-write.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-bmg:          [FAIL][163] ([Intel XE#5376]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][165] ([Intel XE#2291]) -> [PASS][166] +1 other test pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][167] ([Intel XE#5354]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][169] ([Intel XE#1475]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][171] ([Intel XE#2316]) -> [PASS][172] +5 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][173] ([Intel XE#301]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-adlp:         [DMESG-WARN][175] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-4/igt@kms_flip@flip-vs-panning-interruptible.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-3/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][177] ([Intel XE#4543]) -> [PASS][178] +6 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-4/igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a1.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-3/igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a1.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-lnl:          [FAIL][179] ([Intel XE#3098]) -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-lnl-2/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-7/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][182] +16 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][183] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [DMESG-FAIL][185] ([Intel XE#4543]) -> [PASS][186] +8 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][187] ([Intel XE#4596]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-adlp:         [DMESG-WARN][189] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][190] +3 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-4/igt@kms_pm_rpm@basic-rte.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-3/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#4208] / [i915#2575]) -> [PASS][192] +101 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-180.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][193] ([Intel XE#1435]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [INCOMPLETE][195] ([Intel XE#4488] / [Intel XE#5545]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend.html
    - shard-bmg:          [INCOMPLETE][197] ([Intel XE#4488]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-5/igt@kms_vblank@ts-continuation-suspend.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][199] ([Intel XE#5545]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][201] ([Intel XE#4488]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#4208]) -> [PASS][204] +209 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1392]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][207] ([Intel XE#4208]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_module_load@reload.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-463/igt@xe_module_load@reload.html

  * igt@xe_pmu@engine-activity-single-load:
    - shard-dg2-set2:     [FAIL][209] -> [PASS][210] +6 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@xe_pmu@engine-activity-single-load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-466/igt@xe_pmu@engine-activity-single-load.html
    - shard-lnl:          [FAIL][211] -> [PASS][212] +4 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-lnl-7/igt@xe_pmu@engine-activity-single-load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-4/igt@xe_pmu@engine-activity-single-load.html

  * igt@xe_pmu@engine-activity-single-load@engine-drm_xe_engine_class_render0:
    - shard-adlp:         [FAIL][213] -> [PASS][214] +4 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-4/igt@xe_pmu@engine-activity-single-load@engine-drm_xe_engine_class_render0.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-1/igt@xe_pmu@engine-activity-single-load@engine-drm_xe_engine_class_render0.html
    - shard-bmg:          [FAIL][215] -> [PASS][216] +8 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-7/igt@xe_pmu@engine-activity-single-load@engine-drm_xe_engine_class_render0.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-8/igt@xe_pmu@engine-activity-single-load@engine-drm_xe_engine_class_render0.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#4208]) -> [SKIP][218] ([Intel XE#316]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#316]) -> [SKIP][220] ([Intel XE#4208]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#316]) -> [SKIP][222] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][224] ([Intel XE#619])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1124]) -> [SKIP][226] ([Intel XE#4208]) +5 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#4208]) -> [SKIP][228] ([Intel XE#610])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1124]) -> [SKIP][230] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][232] ([Intel XE#1124]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#4208]) -> [SKIP][234] ([Intel XE#1124]) +7 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#2191]) -> [SKIP][236] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#4208] / [i915#2575]) -> [SKIP][238] ([Intel XE#2191])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#4208] / [i915#2575]) -> [SKIP][240] ([Intel XE#367]) +3 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#367]) -> [SKIP][242] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][244] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#2907]) -> [SKIP][246] ([Intel XE#4208]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#4208]) -> [SKIP][248] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#4208]) -> [INCOMPLETE][250] ([Intel XE#3862])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#4208]) -> [SKIP][252] ([Intel XE#2907]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][253] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [INCOMPLETE][254] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][256] ([Intel XE#4208]) +11 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#306]) -> [SKIP][258] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#4208] / [i915#2575]) -> [SKIP][260] ([Intel XE#306]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_chamelium_color@gamma.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#373]) -> [SKIP][262] ([Intel XE#4208] / [i915#2575]) +9 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#4208] / [i915#2575]) -> [SKIP][264] ([Intel XE#373]) +10 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][265] ([Intel XE#1178]) -> [SKIP][266] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-432/igt@kms_content_protection@atomic.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#4208] / [i915#2575]) -> [FAIL][268] ([Intel XE#1178])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#307]) -> [SKIP][270] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#4208] / [i915#2575]) -> [SKIP][272] ([Intel XE#307])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#4208] / [i915#2575]) -> [SKIP][274] ([Intel XE#308]) +3 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][275] ([Intel XE#5299]) -> [FAIL][276] ([Intel XE#4633])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#4208] / [i915#2575]) -> [SKIP][278] ([Intel XE#323])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#455]) -> [SKIP][280] ([Intel XE#2351] / [Intel XE#4208])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#4356]) -> [SKIP][282] ([Intel XE#4208])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@kms_dp_link_training@uhbr-mst.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#4208]) -> [SKIP][284] ([Intel XE#4331])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-466/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][286] ([Intel XE#455]) +3 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_dsc@dsc-with-formats.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#4208]) -> [SKIP][288] ([Intel XE#4422])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#4208]) -> [SKIP][290] ([Intel XE#776])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_fbcon_fbt@psr.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][291] ([Intel XE#301]) -> [FAIL][292] ([Intel XE#301] / [Intel XE#3149])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-adlp:         [DMESG-FAIL][293] ([Intel XE#4543]) -> [DMESG-WARN][294] ([Intel XE#4543]) +1 other test dmesg-warn
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][295] ([Intel XE#4543]) -> [DMESG-WARN][296] ([Intel XE#2953] / [Intel XE#4173])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#4208] / [i915#2575]) -> [INCOMPLETE][298] ([Intel XE#2049] / [Intel XE#2597])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][299] ([Intel XE#2953] / [Intel XE#4173]) -> [DMESG-WARN][300] ([Intel XE#4543]) +1 other test dmesg-warn
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#4208]) -> [SKIP][302] ([Intel XE#455]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#455]) -> [SKIP][304] ([Intel XE#4208]) +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][305] ([Intel XE#2311]) -> [SKIP][306] ([Intel XE#2312]) +8 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][307] ([Intel XE#2312]) -> [SKIP][308] ([Intel XE#2311]) +5 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#4208]) -> [SKIP][310] ([Intel XE#651]) +22 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][312] ([Intel XE#651]) +12 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][313] ([Intel XE#5390]) -> [SKIP][314] ([Intel XE#2312]) +5 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][315] ([Intel XE#2312]) -> [SKIP][316] ([Intel XE#5390]) +2 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#651]) -> [SKIP][318] ([Intel XE#2351] / [Intel XE#4208]) +12 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#651]) -> [SKIP][320] ([Intel XE#4208]) +16 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#4208]) -> [SKIP][322] ([Intel XE#653]) +22 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][323] ([Intel XE#2312]) -> [SKIP][324] ([Intel XE#2313]) +8 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][325] ([Intel XE#2313]) -> [SKIP][326] ([Intel XE#2312]) +10 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][328] ([Intel XE#653]) +9 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#653]) -> [SKIP][330] ([Intel XE#2351] / [Intel XE#4208]) +8 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#653]) -> [SKIP][332] ([Intel XE#4208]) +17 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][333] ([Intel XE#3544]) -> [SKIP][334] ([Intel XE#3374] / [Intel XE#3544])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2925]) -> [SKIP][336] ([Intel XE#4208]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@kms_joiner@basic-force-ultra-joiner.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#4298]) -> [SKIP][338] ([Intel XE#4208])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#2927]) -> [SKIP][340] ([Intel XE#4208])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_joiner@basic-ultra-joiner.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#5021]) -> [SKIP][342] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#4208] / [i915#2575]) -> [SKIP][344] ([Intel XE#5020])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_plane_multiple@tiling-yf.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-466/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#870]) -> [SKIP][346] ([Intel XE#4208])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#4208]) -> [SKIP][348] ([Intel XE#870]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][350] ([Intel XE#1122])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1129]) -> [SKIP][352] ([Intel XE#4208])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#3309]) -> [SKIP][354] ([Intel XE#4208])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flops.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][356] ([Intel XE#1406] / [Intel XE#1489]) +10 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][358] ([Intel XE#1406] / [Intel XE#4208]) +9 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][360] ([Intel XE#1122] / [Intel XE#1406])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_psr2_su@page_flip-p010.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][362] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-432/igt@kms_psr@fbc-psr-no-drrs.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][364] ([Intel XE#1406] / [Intel XE#4208]) +7 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@kms_psr@fbc-psr2-dpms.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][366] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) -> [SKIP][368] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_psr@pr-dpms.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@kms_psr@pr-dpms.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][370] ([Intel XE#1406] / [Intel XE#2939])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#1127]) -> [SKIP][372] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#3414]) -> [SKIP][374] ([Intel XE#4208] / [i915#2575])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#4208] / [i915#2575]) -> [SKIP][376] ([Intel XE#1127])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#4208] / [i915#2575]) -> [SKIP][378] ([Intel XE#3414]) +2 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][379] ([Intel XE#2509]) -> [SKIP][380] ([Intel XE#2426])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#4208] / [i915#2575]) -> [SKIP][382] ([Intel XE#2168])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_vrr@cmrr.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#4208] / [i915#2575]) -> [SKIP][384] ([Intel XE#455]) +6 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_vrr@flip-dpms.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#455]) -> [SKIP][386] ([Intel XE#4208] / [i915#2575]) +4 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_vrr@flipline.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_vrr@flipline.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#4208] / [i915#2575]) -> [SKIP][388] ([Intel XE#1091] / [Intel XE#2849])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#4208]) -> [SKIP][390] ([Intel XE#5249])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_configfs@survivability-mode.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@xe_configfs@survivability-mode.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#4208]) -> [SKIP][392] ([Intel XE#1126])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#5626]) -> [SKIP][394] ([Intel XE#4208]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@xe_eu_stall@invalid-event-report-count.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eu_stall@invalid-sampling-rate:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#4208]) -> [SKIP][396] ([Intel XE#5626])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_eu_stall@invalid-sampling-rate.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/igt@xe_eu_stall@invalid-sampling-rate.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#4837]) -> [SKIP][398] ([Intel XE#4208]) +13 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@xe_eudebug@basic-close.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#4208]) -> [SKIP][400] ([Intel XE#4837]) +13 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_eudebug@vm-bind-clear-faultable.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#4518]) -> [SKIP][402] ([Intel XE#4208])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@xe_eudebug_sriov@deny-sriov.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#1392]) -> [SKIP][404] ([Intel XE#4208])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#4208]) -> [SKIP][406] ([Intel XE#1392]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#4208]) -> [SKIP][408] ([Intel XE#288]) +25 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#288]) -> [SKIP][410] ([Intel XE#4208]) +21 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#4208]) -> [SKIP][412] ([Intel XE#2360]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#2360]) -> [SKIP][414] ([Intel XE#4208])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#4208]) -> [SKIP][416] ([Intel XE#4915]) +278 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#4915]) -> [SKIP][418] ([Intel XE#4208]) +233 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#4208]) -> [DMESG-WARN][420] ([Intel XE#3876])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_exec_threads@threads-hang-rebind.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#255]) -> [SKIP][422] ([Intel XE#4208])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-464/igt@xe_huc_copy@huc_copy.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_huc_copy@huc_copy.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#4208]) -> [SKIP][424] ([Intel XE#560])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_media_fill@media-fill.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#3573]) -> [SKIP][426] ([Intel XE#4208]) +4 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@xe_oa@mi-rpc.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#4208]) -> [SKIP][428] ([Intel XE#3573]) +7 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_oa@mmio-triggered-reports.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#1337]) -> [SKIP][430] ([Intel XE#4208])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][432] ([Intel XE#4208])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-i2c:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#4208]) -> [SKIP][434] ([Intel XE#5694])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_pm@d3cold-i2c.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#4650]) -> [SKIP][436] ([Intel XE#4208])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@xe_pmu@fn-engine-activity-load.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [ABORT][437] ([Intel XE#3970]) -> [DMESG-WARN][438] ([Intel XE#3876])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-6/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#4208]) -> [SKIP][440] ([Intel XE#4733]) +1 other test skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#4733]) -> [SKIP][442] ([Intel XE#4208]) +3 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#944]) -> [SKIP][444] ([Intel XE#4208])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#4208]) -> [SKIP][446] ([Intel XE#944]) +3 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#4814]) -> [SKIP][448] ([Intel XE#4208])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@xe_render_copy@render-stress-0-copies.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#4208]) -> [SKIP][450] ([Intel XE#4814]) +1 other test skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_render_copy@render-stress-4-copies.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#4208]) -> [SKIP][452] ([Intel XE#4130]) +1 other test skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#4130]) -> [SKIP][454] ([Intel XE#4208]) +2 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5249
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5376
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5611]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5611
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5632
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8507 -> IGT_8508
  * Linux: xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577 -> xe-pw-149756v9

  IGT_8507: 8507
  IGT_8508: 939fac7f7b11a8902ebcf9a4bc9c26c14e87e8a6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577: 74c8b78443fb1a201ee11160087f9e71ce959577
  xe-pw-149756v9: 149756v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/index.html

--===============5540985528372967779==
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
<tr><td><b>Series:</b></td><td>Handle Firmware reported Hardware Errors (re=
v9)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149756/">https://patchwork.freedesktop.org/series/149756/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149756v9/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149756v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3616-74c8b78443fb1a201ee11160087f9e71c=
e959577_FULL -&gt; xe-pw-149756v9_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149756v9_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@core_s=
etmaster@master-drop-set-root.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@core_setmaste=
r@master-drop-set-root.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@fbdev@=
unaligned-read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@fbdev@unaligned-read.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/213=
4">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-lnl-7/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9756v9/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-lin=
ear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-ro=
tate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-5/igt@kms_big_fb@y-tiled-64bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-a=
dlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>) +15 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-st=
ride-32bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +=
1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-4/igt@kms_big_fb@yf-tiled-32bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-9/igt@kms_big_fb@yf-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/619">Intel XE#619</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_bw@connected-linear-tilin=
g-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@kms_bw@connected-linear-til=
ing-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +160 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-4/igt@kms_ccs@ccs-on-another-bo-4-t=
iled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-466/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-9/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-3/igt@kms_ccs@random-ccs-data-4-ti=
led-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-9/igt@kms_chamelium_hpd@hdmi-hpd-f=
ast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/373">Intel XE#373</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-fa=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-fa=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-7/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_content_protection@dp-m=
st-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-5/igt@kms_content_protection@lic-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3278">Intel XE#3278</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-2/igt@kms_content_protection@lic-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@kms_cursor_crc@cursor-onscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_cursor_crc@cursor-onscr=
een-64x64.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +13 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-4/igt@kms_curs=
or_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6=
/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">In=
tel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs=
-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other =
test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-=
flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-8/igt@kms_curs=
or_legacy@torture-bo@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-8/igt@kms_cursor_legacy=
@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) +2 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-8/igt@kms_dither@fb-8bpc-vs-panel-=
6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-5/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_feature_discover=
y@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-7/igt@kms_flip@2x-flip-vs-modeset.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1421">Intel XE#1421</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-8/igt@kms_flip@2x-flip-vs-modeset.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/310">Intel XE#310</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-4/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_=
flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-1/igt@kms_fli=
p@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-8/igt@kms_flip@basi=
c-flip-vs-dpms@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +13 other tests=
 dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@kms_fl=
ip@busy-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_flip@busy-flip.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2575">i915#2575</a>) +94 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf=
_vblank-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend@c-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-3/igt@kms_flip@flip-vs=
-suspend@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-=
dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-9/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149756v9/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bp=
p-xtile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel X=
E#4921</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE=
#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
c-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +64 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/sha=
rd-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap=
-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
c-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-463/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-1/igt@kms_hdr@=
static-toggle-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_hdr@static-toggle-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-1/igt@kms_joiner@invalid-modeset-u=
ltra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@kms_pl=
ane_cursor@viewport.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@kms_plane_cursor@viewpo=
rt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-1/igt@kms_plane_scaling@planes-down=
scale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-4/igt@kms_plane_scaling@planes-down=
scale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-3/igt@kms_psr2_sf@fbc-pr-overlay-pl=
ane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-overlay-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-plane-move=
-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/igt@kms_psr@fbc-psr2-cursor-pla=
ne-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other te=
sts skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane=
-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane=
-onoff@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-7/igt@kms_psr@pr-sprite-plane-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_psr@psr2-sprite-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-1/igt@kms_psr@psr2-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-3/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-1/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-2/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-8/igt@kms_vrr@flip-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">=
Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@kms_vrr@flip-basic-fastset.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-8/igt@xe_compute_preempt@compute-p=
reempt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5632">Intel XE#5632</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/igt@xe_compute_preempt@compute-=
preempt-many.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5890">Intel XE#5890</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-5/igt@xe_eudebug@basic-connect.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@xe_eudebug@basic-vm-access-=
parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-meta=
data-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a>) +6 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-2/igt@xe_eudebug@basic-vm-bind-met=
adata-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-466/igt@xe_eudebug_sriov@deny-eudeb=
ug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4518">Intel XE#4518</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-3/igt@xe_eudebug_sriov@deny-eudebug=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4518">Intel XE#4518</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-9/igt@xe_eudebug_sriov@deny-eudebu=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4519">Intel XE#4519</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-7/igt@xe_eudebug_sriov@deny-eudebug=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5793">Intel XE#5793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-4/igt@xe_exec=
_basic@many-execqueues-null.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-9/igt@xe_exec_basic@ma=
ny-execqueues-null.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-3/igt@xe_exec_=
basic@many-execqueues-null.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-5/igt@xe_exec_basic@many=
-execqueues-null.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@xe_e=
xec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-2/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>)=
 +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-4/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests=
 skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-5/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-9/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#=
5561</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@xe_exec_fault_mode@many-exe=
cqueues-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-9/igt@xe_exec_system_allocator@onc=
e-mmap-new-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4915">Intel XE#4915</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@xe_exec_system_allocator@th=
reads-many-execqueues-mmap-free.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +66 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-8/igt@xe_exec_system_allocator@thre=
ads-many-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-free-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-5/igt@xe_exec_system_allocator@twic=
e-large-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@xe_exe=
c_threads@threads-hang-userptr-invalidate.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@x=
e_exec_threads@threads-hang-userptr-invalidate.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#387=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-7/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@xe_live_ktest@xe_migrate@xe=
_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@xe_oa@buffer-size.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103"=
>Intel XE#5103</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-1/igt@xe_oa@buffer-size.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103">=
Intel XE#5103</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/igt@xe_oa@stress-open-close.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-2/igt@xe_oa@syncs-userptr-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@xe_pm@=
s2idle-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_pm@s2idle-exec-after.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>) +165 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-2/igt@xe_pm@s4-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/579">Intel XE#579</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-3/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-3/igt@xe_pm@vram-d3cold-threshold.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5611">Intel XE#5611</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/579">Intel XE#579</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@xe_pm_residency@cpg-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@xe_pxp@display-pxp-fb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-bmg-4/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@fbdev@=
read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@fbdev@read.html">PASS</a=
> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-3/igt@intel_hw=
mon@hwmon-write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4665">Intel XE#4665</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-4/igt@intel_hwmon@hwm=
on-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-4/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5376">Intel XE#5376</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-b=
mg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-6/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-b=
mg-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-4/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">=
Intel XE#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149756v9/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic=
-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-1/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-1/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg=
-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +5 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-4/igt@kms_fli=
p@flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1497=
56v9/shard-adlp-3/igt@kms_flip@flip-vs-panning-interruptible.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-4/igt@kms_fli=
p@flip-vs-panning-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9=
/shard-adlp-3/igt@kms_flip@flip-vs-panning-interruptible@b-hdmi-a1.html">PA=
SS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-lnl-2/igt@kms_flip=
@modeset-vs-vblank-race-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl=
-7/igt@kms_flip@modeset-vs-vblank-race-interruptible.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-64bpp-linear-upscaling.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-3/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">In=
tel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4921">Intel XE#4921</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149756v9/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64b=
pp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149756v9/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a=
-1-x-to-x.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-4/igt@kms_pm_=
rpm@basic-rte.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-3/=
igt@kms_pm_rpm@basic-rte.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_ro=
tation_crc@sprite-rotation-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/sh=
ard-dg2-464/igt@kms_rotation_crc@sprite-rotation-180.html">PASS</a> +101 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-6/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bm=
g-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-8/igt@kms_vbl=
ank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4488">Intel XE#4488</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9=
/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend.html">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-5/igt@kms_vbla=
nk@ts-continuation-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4488">Intel XE#4488</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/ig=
t@kms_vblank@ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-8/igt@kms_vbl=
ank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1497=
56v9/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-8/igt@kms_vbl=
ank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488">Intel XE#4488=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1497=
56v9/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_exe=
c_balancer@once-parallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/=
igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> +209 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2=
-433/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_mod=
ule_load@reload.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-463/igt@xe_module_loa=
d@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-single-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@xe_pmu=
@engine-activity-single-load.html">FAIL</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-466/igt@xe_pmu@engine-=
activity-single-load.html">PASS</a> +6 other tests pass</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-lnl-7/igt@xe_pmu@e=
ngine-activity-single-load.html">FAIL</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-4/igt@xe_pmu@engine-acti=
vity-single-load.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-single-load@engine-drm_xe_engine_class_render=
0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-4/igt@xe_pmu@=
engine-activity-single-load@engine-drm_xe_engine_class_render0.html">FAIL</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v=
9/shard-adlp-1/igt@xe_pmu@engine-activity-single-load@engine-drm_xe_engine_=
class_render0.html">PASS</a> +4 other tests pass</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-7/igt@xe_pmu@e=
ngine-activity-single-load@engine-drm_xe_engine_class_render0.html">FAIL</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9=
/shard-bmg-8/igt@xe_pmu@engine-activity-single-load@engine-drm_xe_engine_cl=
ass_render0.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_bi=
g_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@=
kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@kms_bi=
g_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@km=
s_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms=
_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/=
igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1497=
56v9/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hf=
lip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_bi=
g_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436=
/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v=
9/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149756v9/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bp=
p-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v=
9/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_bw=
@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/=
shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_bw=
@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149756v9/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2=
560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_bw=
@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1497=
56v9/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_bw=
@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-43=
4/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-464/igt@kms_cc=
s@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14975=
6v9/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_cc=
s@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434=
/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/s=
hard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-=
dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">=
Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-466=
/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149756v9/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel X=
E#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756=
v9/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@kms_ch=
amelium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt=
@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_ch=
amelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435=
/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@kms_ch=
amelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/=
igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_ch=
amelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
756v9/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
3">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-432/igt@kms_co=
ntent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_c=
ontent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_co=
ntent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shar=
d-dg2-433/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@kms_co=
ntent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/=
igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_co=
ntent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/sh=
ard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_cu=
rsor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9=
/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel X=
E#308</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-3/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-8/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_cursor_legac=
y@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">In=
tel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@kms_di=
rtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_dir=
tyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@kms_dp=
_link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_d=
p_link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_dp=
_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-466/=
igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_ds=
c@dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/=
igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_fb=
c_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/=
shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_fb=
con_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_fbcon_fbt@psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-lnl-2/igt@kms_flip@=
flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-4/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/sh=
ard-adlp-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543=
">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-adlp-3/igt@kms_fl=
ip@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/=
igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1497=
56v9/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543=
">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149756v9/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to=
-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149756v9/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-=
32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1497=
56v9/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
756v9/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/sha=
rd-dg2-436/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">I=
ntel XE#651</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/s=
hard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5=
390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49756v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9=
/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149756v9/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/sh=
ard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149756v9/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
756v9/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
756v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#23=
51</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149756v9/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-prim=
scrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756=
v9/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE=
#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149756v9/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@kms_jo=
iner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt=
@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@kms_jo=
iner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms=
_joiner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_jo=
iner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_j=
oiner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms=
_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_pl=
ane_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-=
466/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_pm=
_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_p=
m_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_pm=
_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-466/igt@=
kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_pm=
_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg=
2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-464/igt@kms_pm=
_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_pm_dc@dc5-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_pm=
_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_p=
m_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_ps=
r2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49756v9/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_ps=
r2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel=
 XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149756v9/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-d=
mg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_ps=
r2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-43=
6/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-432/igt@kms_ps=
r@fbc-psr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/sha=
rd-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#235=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@kms_ps=
r@fbc-psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard=
-dg2-434/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_ps=
r@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shar=
d-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">In=
tel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_ps=
r@pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2=
-433/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929<=
/a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_ps=
r_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149756v9/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-432/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-=
dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-d=
g2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#=
2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149756v9/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_ro=
tation_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/sh=
ard-dg2-464/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#341=
4</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/sha=
rd-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_vr=
r@cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms_vrr@=
cmrr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@kms_vr=
r@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@kms=
_vrr@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@kms_vr=
r@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@kms_vrr@flipline.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@sriov_=
basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149756v9/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvf=
s-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_con=
figfs@survivability-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt@xe_c=
onfigfs@survivability-mode.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5249">Intel XE#5249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_cop=
y_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/igt=
@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@xe_eu_=
stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/=
igt@xe_eu_stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-sampling-rate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_eu_=
stall@invalid-sampling-rate.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/igt@x=
e_eu_stall@invalid-sampling-rate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@xe_eud=
ebug@basic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_eudebug@b=
asic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_eud=
ebug@vm-bind-clear-faultable.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-464/igt@=
xe_eudebug@vm-bind-clear-faultable.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +13 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@xe_eud=
ebug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_eude=
bug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">In=
tel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149756v9/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-ma=
ny-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-=
dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel =
XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shar=
d-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Int=
el XE#288</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-464/igt@xe_exe=
c_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-4=
34/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/=
shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-d=
g2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_exe=
c_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@xe_exec_system_allocator@threa=
ds-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +278 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eo=
check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/491=
5">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_exec_system_allocator@threads-sha=
red-vm-many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +233 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_exe=
c_threads@threads-hang-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt=
@xe_exec_threads@threads-hang-rebind.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-464/igt@xe_huc=
_copy@huc_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_huc_copy@huc_=
copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_med=
ia_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@xe_media_f=
ill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@xe_oa@=
mi-rpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3573">Intel XE#3573</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_oa@mi-rpc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_oa@=
mmio-triggered-reports.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-433/igt@xe_oa@=
mmio-triggered-reports.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-466/igt@xe_pat=
@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_p=
at@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@xe_pm@=
d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt=
@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_pm@=
d3cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-435/igt@xe_pm@d3cold-i2c.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@xe_pmu=
@fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/igt@xe_p=
mu@fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-bmg-6/igt@xe_pmu@f=
n-engine-activity-sched-if-idle.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-bmg-6/ig=
t@xe_pmu@fn-engine-activity-sched-if-idle.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>=
)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_pxp=
@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-463/igt@x=
e_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@xe_pxp=
@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/=
igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-463/igt@xe_que=
ry@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard=
-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_que=
ry@multigpu-query-oa-units.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-432/igt@xe=
_query@multigpu-query-oa-units.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-433/igt@xe_ren=
der_copy@render-stress-0-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-434/=
igt@xe_render_copy@render-stress-0-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_ren=
der_copy@render-stress-4-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2-436/=
igt@xe_render_copy@render-stress-4-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-434/igt@xe_sri=
ov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149756v9/shard-dg2=
-432/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#413=
0</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577/shard-dg2-436/igt@xe_sri=
ov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE=
#4130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149756v9/shard-dg2-434/igt@xe_sriov_auto_provisioning@resources-released-o=
n-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8507 -&gt; IGT_8508</li>
<li>Linux: xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577 -&gt; xe-pw-149=
756v9</li>
</ul>
<p>IGT_8507: 8507<br />
  IGT_8508: 939fac7f7b11a8902ebcf9a4bc9c26c14e87e8a6 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-3616-74c8b78443fb1a201ee11160087f9e71ce959577: 74c8b78443fb1a201ee1116=
0087f9e71ce959577<br />
  xe-pw-149756v9: 149756v9</p>

</body>
</html>

--===============5540985528372967779==--
