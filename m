Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E115CC77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 16:20:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDFC10E00B;
	Tue, 24 Jun 2025 16:20:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD89510E00B;
 Tue, 24 Jun 2025 16:20:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5555988510639114926=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_Revert_patch_to_reject_HBR?=
 =?utf-8?q?3_for_all_eDP_panels_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Jun 2025 16:20:17 -0000
Message-ID: <175078201775.104499.5658268236717146806@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250620124417.2041233-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250620124417.2041233-1-ankit.k.nautiyal@intel.com>
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

--===============5555988510639114926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revert patch to reject HBR3 for all eDP panels (rev2)
URL   : https://patchwork.freedesktop.org/series/150568/
State : success

== Summary ==

CI Bug Log - changes from xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7_FULL -> xe-pw-150568v2_FULL
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

  Here are the changes found in xe-pw-150568v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          NOTRUN -> [FAIL][1] ([Intel XE#4665])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][2] -> [ABORT][3] ([Intel XE#3970])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][4] ([Intel XE#1124]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#316])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
    - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#316])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][8] -> [DMESG-FAIL][9] ([Intel XE#4543])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +4 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1124])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#2314] / [Intel XE#2894])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2314] / [Intel XE#2894])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#367]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#367]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#787]) +160 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#455] / [Intel XE#787]) +26 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][20] -> [INCOMPLETE][21] ([Intel XE#3862]) +1 other test incomplete
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#3432])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#2907])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#787]) +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2887]) +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][28] -> [INCOMPLETE][29] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][30] ([Intel XE#3124])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][31] ([Intel XE#1727] / [Intel XE#3113])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#4417] / [Intel XE#455])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2724])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#4417]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#4417]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2325])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#306])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2252]) +8 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#373])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#373]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][41] ([Intel XE#1178])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2341])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][43] ([Intel XE#1188])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2320])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#455]) +13 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2291])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#309])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#2291]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@forked-move@pipe-a:
    - shard-dg2-set2:     [PASS][50] -> [INCOMPLETE][51] ([Intel XE#3226]) +1 other test incomplete
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-435/igt@kms_cursor_legacy@forked-move@pipe-a.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-a.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#4354])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-sst.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2244]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#4422])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#776])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2372])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2316]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [PASS][59] -> [FAIL][60] ([Intel XE#301])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#310])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][62] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#2316]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][65] ([Intel XE#301] / [Intel XE#3321]) +2 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][66] ([Intel XE#301]) +8 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][67] -> [DMESG-WARN][68] ([Intel XE#2953] / [Intel XE#4173]) +4 other tests dmesg-warn
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-bmg:          NOTRUN -> [INCOMPLETE][69] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#455]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2293]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#4141]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#651]) +13 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#656]) +3 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2311]) +12 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#658])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#653])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#653]) +10 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2350])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2313]) +10 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2312]) +15 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][83] -> [SKIP][84] ([Intel XE#1503])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#346])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][86] -> [SKIP][87] ([Intel XE#3012])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2927])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2486])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][90] ([Intel XE#616])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#4596])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#5020])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#870]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][95] ([Intel XE#2953] / [Intel XE#4173])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#1489]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1489]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1489]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1122])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1122])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#2850] / [Intel XE#929])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1127])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1127])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#3414])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#3414] / [Intel XE#3904])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2413]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#362])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][110] ([Intel XE#1729])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#1499])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_vrr@flipline.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#1091] / [Intel XE#2849])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_eu_stall@non-blocking-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#5308])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@xe_eu_stall@non-blocking-read.html

  * igt@xe_eudebug@read-metadata:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#4837]) +8 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#4837])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2322]) +6 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1392])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1392])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][119] -> [SKIP][120] ([Intel XE#1392]) +7 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#288]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#288]) +15 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#4837]) +7 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#4943]) +17 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#4943]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-lnl-1/igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@once-mmap-new-race:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#4915]) +34 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@xe_exec_system_allocator@once-mmap-new-race.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#4915]) +115 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][128] -> [FAIL][129] ([Intel XE#5018])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#5100])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#512])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154]) -> ([PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [SKIP][177], [PASS][178]) ([Intel XE#2457])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-2/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-8/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-8/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-2/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-2/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-8/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-2/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-1/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-1/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-1/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-1/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-1/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-1/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-8/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-8/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-8/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-8/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@xe_module_load@load.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@short-reads:
    - shard-adlp:         NOTRUN -> [SKIP][180] ([Intel XE#2541] / [Intel XE#3573])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@xe_oa@short-reads.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#2236])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#2284]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-8/igt@xe_pm@d3cold-basic.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#4733])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#4733]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#944])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#944])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_render_copy@render-stress-2-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#4814])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@xe_render_copy@render-stress-2-copies.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#4130])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][190] ([Intel XE#4543]) -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][192] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][194] ([Intel XE#2291]) -> [PASS][195] +2 other tests pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [SKIP][196] ([Intel XE#2316]) -> [PASS][197] +4 other tests pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_flip@2x-plain-flip-interruptible.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][198] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][200] ([Intel XE#1503]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][202] ([Intel XE#4596]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][204] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][205] +7 other tests pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1392]) -> [PASS][207] +9 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [DMESG-WARN][208] ([Intel XE#3876]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_pm@s3-basic:
    - shard-bmg:          [INCOMPLETE][210] ([Intel XE#569]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@xe_pm@s3-basic.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-bmg:          [ABORT][212] ([Intel XE#5255]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@xe_pm@s4-vm-bind-prefetch.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][214] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [INCOMPLETE][215] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][216] ([Intel XE#2341]) -> [FAIL][217] ([Intel XE#1178])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_content_protection@legacy.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][218] ([Intel XE#2341]) -> [FAIL][219] ([Intel XE#1188])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@kms_content_protection@uevent.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_content_protection@uevent.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][220] ([Intel XE#2312]) -> [SKIP][221] ([Intel XE#2311]) +9 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][222] ([Intel XE#2311]) -> [SKIP][223] ([Intel XE#2312]) +14 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][224] ([Intel XE#2312]) -> [SKIP][225] ([Intel XE#4141]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][226] ([Intel XE#4141]) -> [SKIP][227] ([Intel XE#2312]) +8 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][228] ([Intel XE#2313]) -> [SKIP][229] ([Intel XE#2312]) +19 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][230] ([Intel XE#2312]) -> [SKIP][231] ([Intel XE#2313]) +10 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][232] ([Intel XE#4596]) -> [SKIP][233] ([Intel XE#5021])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][234] ([Intel XE#2426]) -> [SKIP][235] ([Intel XE#2509])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
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
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5255
  [Intel XE#5308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5308
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7 -> xe-pw-150568v2

  IGT_8423: 8423
  xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7: da56936fad6f5e1d5f0cef8b50277bfb071eefe7
  xe-pw-150568v2: 150568v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/index.html

--===============5555988510639114926==
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
<tr><td><b>Series:</b></td><td>Revert patch to reject HBR3 for all eDP pane=
ls (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/150568/">https://patchwork.freedesktop.org/series/150568/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-150568v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150568v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3296-da56936fad6f5e1d5f0cef8b50277bfb0=
71eefe7_FULL -&gt; xe-pw-150568v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-150568v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@intel_hwmon@hwmon-write.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
665">Intel XE#4665</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-435/igt@kms_bi=
g_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-433/igt@kms_big_fb@4-=
tiled-64bpp-rotate-180.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_big_fb@x-tiled-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-adlp-6/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-a=
dlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 ot=
her tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_bw@connected-linear-tilin=
g-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_bw@linear-tiling-2-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@kms_bw@linear-tiling-3-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +160 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y=
f-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-435/igt@km=
s_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862=
</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_ccs@missing-ccs-buffer-y-=
tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-463/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">In=
tel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3124">Intel XE#3124</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_cdclk@mode-transition.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4417">Intel XE#4417</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_cdclk@mode-transition-all=
-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_cdclk@mode-transition@p=
ipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_cdclk@mode-transition@pi=
pe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4417">Intel XE#4417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_chamelium_color@ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_chamelium_color@degamma=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_chamelium_frames@dp-crc-s=
ingle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_chamelium_frames@vga-fra=
me-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-f=
or-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_content_protection@legacy=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_content_protection@srm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_content_protection@uevent=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_cursor_crc@cursor-onscree=
n-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@kms_cursor_crc@cursor-slidi=
ng-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipb-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_c=
ursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-435/igt@kms_cu=
rsor_legacy@forked-move@pipe-a.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-433/igt@kms_cursor_l=
egacy@forked-move@pipe-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) +1 other test i=
ncomplete</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-2/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_dp_link_trainin=
g@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-n=
op-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-432/igt@kms_fl=
ip@2x-flip-vs-expired-vblank.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-433/igt@kms_flip@2x-fl=
ip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_flip@2x-flip-vs-modeset-=
vs-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend=
-interruptible@cd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vb=
lank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vb=
lank@b-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/301">Intel XE#301</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-adlp-3/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
 +4 other tests dmesg-warn</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_flip@flip-vs-suspend-inte=
rruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test in=
complete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64b=
pp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cpsr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-=
1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +15 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_panel_fitting@legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-435/igt@kms_plane_cursor@overlay@pi=
pe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_plane_multiple@tiling-y=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_pm_backlight@fade-with-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stres=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_pm_rpm@system-suspend-mo=
deset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-plane-m=
ove-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_psr2_sf@pr-cursor-plane=
-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_psr2_su@page_flip-xrgb88=
88.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1122">Intel XE#1122</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_psr@fbc-psr2-primary-ren=
der.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_psr@psr2-sprite-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_rotation_crc@sprite-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_scaling_modes@scaling-mod=
e-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2413">Intel XE#2413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@kms_tiled_display@basic-test=
-pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/362">Intel XE#362</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@kms_tiled_display@basic-tes=
t-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_vrr@flipline.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">In=
tel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@sriov_basic@enable-vfs-bind=
-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@xe_eu_stall@non-blocking-re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5308">Intel XE#5308</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe_eudebug@read-metadata.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@xe_eudebug_online@reset-with=
-attention.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#=
2322</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-e=
xec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@xe_exec_basic@multigpu-no-ex=
ec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-43=
2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Inte=
l XE#1392</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@xe_exec_fault_mode@many-exe=
cqueues-userptr-invalidate-prefetch.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@xe_exec_sip_eudebug@breakpo=
int-writesip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4837">Intel XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@xe_exec_system_allocator@many=
-large-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +17 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-lnl-1/igt@xe_exec_system_allocator@once=
-large-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@xe_exec_system_allocator@onc=
e-mmap-new-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4915">Intel XE#4915</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-=
nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@xe_exec_system_allocator@th=
reads-many-large-execqueues-malloc-mlock-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +115 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-lnl-8/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-150568v2/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-=
many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@xe_mmap@pci-membarrier-bad-p=
agesize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@xe_mmap@small-bar.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">=
Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071e=
efe7/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb=
071eefe7/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b5027=
7bfb071eefe7/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b=
50277bfb071eefe7/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0c=
ef8b50277bfb071eefe7/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f5e1d=
5f0cef8b50277bfb071eefe7/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936fad6f=
5e1d5f0cef8b50277bfb071eefe7/shard-bmg-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56936f=
ad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-da56=
936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3296-=
da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-=
3/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-1/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150568v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-150568v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150568v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150568v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-8/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150568v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150568v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe=
_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">I=
ntel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@xe_oa@closed-fd-and-unmappe=
d-access.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-adlp-9/igt@xe_oa@short-reads.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">=
Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@xe_oa@syncs-ufence-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-8/igt@xe_pm@d3cold-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">=
Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-po=
st-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post=
-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@xe_query@multigpu-query-confi=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@xe_query@multigpu-query-inv=
alid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-dg2-432/igt@xe_render_copy@render-stres=
s-2-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543"=
>Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-150568v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-=
rotate-180-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150568v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_flip=
@2x-plain-flip-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@km=
s_flip@2x-plain-flip-interruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-433/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
568v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@kms_hdr@s=
tatic-toggle-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-adlp-6/igt@kms_vbl=
ank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2=
/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> +7 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard=
-dg2-434/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a>=
 +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-433/igt@xe_exe=
c_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-dg2-463/=
igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@xe_pm@s3=
-basic.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@xe_pm@s3-basic.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@xe_pm@s4=
-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5255">Intel XE#5255</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-5/igt@xe_pm@s4-vm-=
bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-150568v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel X=
E#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_conte=
nt_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-6/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_conte=
nt_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1505=
68v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-150568v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1505=
68v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1505=
68v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50568v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
568v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/shard-bmg-3/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7/shard-bmg-2/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150568v2/sha=
rd-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">=
Intel XE#2509</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7 -&gt; xe-pw-150=
568v2</li>
</ul>
<p>IGT_8423: 8423<br />
  xe-3296-da56936fad6f5e1d5f0cef8b50277bfb071eefe7: da56936fad6f5e1d5f0cef8=
b50277bfb071eefe7<br />
  xe-pw-150568v2: 150568v2</p>

</body>
</html>

--===============5555988510639114926==--
