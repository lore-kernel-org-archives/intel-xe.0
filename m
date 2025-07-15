Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19917C83F1D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 10:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4ED10E206;
	Tue, 15 Jul 2025 10:50:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A5710E1F4;
 Tue, 15 Jul 2025 10:50:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7798273651651100796=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_Cleaning_up_code_related_t?=
 =?utf-8?q?o_VRAM_regions_and_its_initialization_-_part_2_=28rev15=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 15 Jul 2025 10:50:41 -0000
Message-ID: <175257664158.162637.5324681260051267572@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250714184818.89201-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250714184818.89201-1-piotr.piorkowski@intel.com>
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

--===============7798273651651100796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Cleaning up code related to VRAM regions and its initialization - part 2 (rev15)
URL   : https://patchwork.freedesktop.org/series/149503/
State : success

== Summary ==

CI Bug Log - changes from xe-3412-b012f04b5be909a307ff629b297387e0ed55195a_FULL -> xe-pw-149503v15_FULL
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

  Here are the changes found in xe-pw-149503v15_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#911]) +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#316]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#1124]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1407]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#610])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][8] -> [DMESG-FAIL][9] ([Intel XE#4543]) +5 other tests dmesg-fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#2314] / [Intel XE#2894])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2314] / [Intel XE#2894]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#2191])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1512])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#2191])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#367])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#367])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#2907])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#787]) +132 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#3442])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#3432])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#3432])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#787]) +8 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2887]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][30] -> [INCOMPLETE][31] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][32] -> [INCOMPLETE][33] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][34] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#455] / [Intel XE#787]) +22 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#373]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-5/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#306])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#373]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-464/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2252]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_color@invalid-gamma-lut-sizes:
    - shard-bmg:          [PASS][40] -> [DMESG-WARN][41] ([Intel XE#3428]) +2 other tests dmesg-warn
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@kms_color@invalid-gamma-lut-sizes.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-6/igt@kms_color@invalid-gamma-lut-sizes.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#1178])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1424])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2320]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#309]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2291])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2291]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@single-bo:
    - shard-bmg:          [PASS][49] -> [DMESG-WARN][50] ([Intel XE#5354]) +1 other test dmesg-warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-2/igt@kms_cursor_legacy@single-bo.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-7/igt@kms_cursor_legacy@single-bo.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-adlp:         [PASS][51] -> [DMESG-WARN][52] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-2/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-3/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#5428])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#455]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#4422])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#4422])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#4422])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1421])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-7/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#2316]) +6 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][61] -> [FAIL][62] ([Intel XE#301])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][63] -> [FAIL][64] ([Intel XE#301] / [Intel XE#3321])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1:
    - shard-adlp:         [PASS][65] -> [DMESG-WARN][66] ([Intel XE#4543]) +15 other tests dmesg-warn
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-4/igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-3/igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:
    - shard-bmg:          [PASS][67] -> [FAIL][68] ([Intel XE#5338]) +1 other test fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [PASS][69] -> [DMESG-WARN][70] ([Intel XE#4543] / [Intel XE#5208])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-8/igt@kms_flip@flip-vs-rmfb.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-8/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2293] / [Intel XE#2380])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1401] / [Intel XE#1745])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1401])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#455])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2293])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][76] -> [DMESG-FAIL][77] ([Intel XE#4543] / [Intel XE#4921]) +5 other tests dmesg-fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#651]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#651]) +10 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#5390]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1151])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#658])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#651]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2311]) +6 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#656]) +8 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#656])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2313]) +12 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#653]) +8 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2312]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#653]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#2927])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2927])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#356])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][94] ([Intel XE#616]) +2 other tests fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][95] -> [SKIP][96] ([Intel XE#4596])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2763]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][98] -> [FAIL][99] ([Intel XE#718])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#2893]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1489])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#1489]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#1489]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1122])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1128])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-8/igt@kms_psr2_su@page_flip-nv12.html
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2387])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.html
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1122])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#4609])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1406]) +2 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-1/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@psr-cursor-render:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@kms_psr@psr-cursor-render.html
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-7/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-463/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-basic:
    - shard-lnl:          [PASS][114] -> [FAIL][115] ([Intel XE#5298]) +1 other test fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-8/igt@kms_psr@psr2-basic.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-2/igt@kms_psr@psr2-basic.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#3414] / [Intel XE#3904])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#3414] / [Intel XE#3904])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#3414])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][119] -> [FAIL][120] ([Intel XE#2883]) +2 other tests fail
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-436/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-466/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2168])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-4/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#1499])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#5249])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-432/igt@xe_configfs@survivability-mode.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#4837]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence.html
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#4837])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-3/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#4837]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#4518])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#688])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][129] -> [SKIP][130] ([Intel XE#1392]) +6 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2322]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#1392]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#288]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-6/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#288]) +7 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#4837]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-463/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#4943]) +7 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-4/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-large-execqueues-new-busy:
    - shard-bmg:          [PASS][137] -> [DMESG-WARN][138] ([Intel XE#3428] / [Intel XE#5215]) +2 other tests dmesg-warn
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-4/igt@xe_exec_system_allocator@many-large-execqueues-new-busy.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-6/igt@xe_exec_system_allocator@many-large-execqueues-new-busy.html

  * igt@xe_exec_system_allocator@many-stride-malloc:
    - shard-bmg:          [PASS][139] -> [INCOMPLETE][140] ([Intel XE#5401])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-malloc.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc.html

  * igt@xe_exec_system_allocator@once-new-busy-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#4915]) +14 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@xe_exec_system_allocator@once-new-busy-nomemset.html

  * igt@xe_exec_system_allocator@process-many-mmap-huge:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#4915]) +97 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-466/igt@xe_exec_system_allocator@process-many-mmap-huge.html
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#4943]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-4/igt@xe_exec_system_allocator@process-many-mmap-huge.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#5100])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-8/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_oa@invalid-oa-exponent:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#2541] / [Intel XE#3573])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@xe_oa@invalid-oa-exponent.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2284])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-1/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#2284] / [Intel XE#366])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#584]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-4/igt@xe_pm@s3-mocs.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     NOTRUN -> [FAIL][149] ([Intel XE#4819]) +1 other test fail
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@xe_pmu@gt-frequency.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#4733])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#944])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#4130])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-1/igt@xe_sriov_auto_provisioning@fair-allocation.html
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#4130])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@xe_sriov_auto_provisioning@fair-allocation.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][154] ([Intel XE#4208]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@core_getversion@all-cards.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@core_getversion@all-cards.html
    - shard-adlp:         [FAIL][156] ([Intel XE#4671]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@core_getversion@all-cards.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-8/igt@core_getversion@all-cards.html

  * igt@intel_sysfs_debugfs@xe-forcewake:
    - shard-adlp:         [SKIP][158] ([Intel XE#4618] / [Intel XE#4945]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@intel_sysfs_debugfs@xe-forcewake.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-4/igt@intel_sysfs_debugfs@xe-forcewake.html
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#4208] / [Intel XE#4618]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@intel_sysfs_debugfs@xe-forcewake.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-466/igt@intel_sysfs_debugfs@xe-forcewake.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [FAIL][162] ([Intel XE#911]) -> [PASS][163] +3 other tests pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][164] ([Intel XE#3884]) -> [PASS][165] +1 other test pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-9/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][166] ([Intel XE#3908]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [DMESG-FAIL][168] ([Intel XE#4543]) -> [PASS][169] +13 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][170] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][172] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][174] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][175] +1 other test pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][176] ([Intel XE#2291]) -> [PASS][177] +5 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [SKIP][178] ([Intel XE#2316]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-panning@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][180] ([Intel XE#4543]) -> [PASS][181] +7 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-8/igt@kms_flip@flip-vs-panning@d-hdmi-a1.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-8/igt@kms_flip@flip-vs-panning@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#4208]) -> [PASS][183] +35 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
    - shard-adlp:         [SKIP][184] ([Intel XE#4947]) -> [PASS][185] +1 other test pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-adlp:         [SKIP][186] ([Intel XE#4950]) -> [PASS][187] +13 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][188] ([Intel XE#718]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [SKIP][190] ([Intel XE#4692]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#4208] / [i915#2575]) -> [PASS][193] +14 other tests pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][194] ([Intel XE#4459]) -> [PASS][195] +1 other test pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1392]) -> [PASS][197] +4 other tests pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][198] ([Intel XE#5018]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-adlp:         [FAIL][200] ([Intel XE#3099]) -> [PASS][201] +1 other test pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_live_ktest@xe_dma_buf.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-9/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_vm@munmap-style-unbind-many-all:
    - shard-adlp:         [SKIP][202] ([Intel XE#4945]) -> [PASS][203] +32 other tests pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_vm@munmap-style-unbind-many-all.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-8/igt@xe_vm@munmap-style-unbind-many-all.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#4208]) -> [SKIP][205] ([Intel XE#316]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
    - shard-adlp:         [SKIP][206] ([Intel XE#4947]) -> [SKIP][207] ([Intel XE#316])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [SKIP][208] ([Intel XE#4947]) -> [DMESG-FAIL][209] ([Intel XE#4543])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#4208]) -> [SKIP][211] ([Intel XE#1124])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-adlp:         [SKIP][212] ([Intel XE#4947]) -> [SKIP][213] ([Intel XE#1124])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][215] ([Intel XE#1124])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         [SKIP][216] ([Intel XE#4950]) -> [SKIP][217] ([Intel XE#367])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-8/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#4208] / [i915#2575]) -> [SKIP][219] ([Intel XE#367])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-adlp:         [SKIP][220] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][221] ([Intel XE#455] / [Intel XE#787])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][223] ([Intel XE#455] / [Intel XE#787])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-adlp:         [SKIP][224] ([Intel XE#4947]) -> [SKIP][225] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#4208]) -> [SKIP][227] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][228] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][229] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-adlp:         [SKIP][230] ([Intel XE#4950]) -> [SKIP][231] ([Intel XE#373]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_chamelium_audio@dp-audio-edid.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-4/igt@kms_chamelium_audio@dp-audio-edid.html
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#4208] / [i915#2575]) -> [SKIP][233] ([Intel XE#373]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_chamelium_audio@dp-audio-edid.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][234] ([Intel XE#1178]) -> [SKIP][235] ([Intel XE#2341]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-4/igt@kms_content_protection@atomic.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-adlp:         [SKIP][236] ([Intel XE#4950]) -> [SKIP][237] ([Intel XE#309]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-adlp:         [SKIP][238] ([Intel XE#4945]) -> [SKIP][239] ([Intel XE#4422])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#4208]) -> [SKIP][241] ([Intel XE#4422])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-adlp:         [SKIP][242] ([Intel XE#4950]) -> [SKIP][243] ([Intel XE#310])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_flip@2x-flip-vs-dpms.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-3/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-adlp:         [SKIP][244] ([Intel XE#4947]) -> [SKIP][245] ([Intel XE#455])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#4208]) -> [SKIP][247] ([Intel XE#455])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][248] ([Intel XE#2312]) -> [SKIP][249] ([Intel XE#2311]) +11 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][250] ([Intel XE#2311]) -> [SKIP][251] ([Intel XE#2312]) +8 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-adlp:         [SKIP][252] ([Intel XE#4947]) -> [SKIP][253] ([Intel XE#656]) +7 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][254] ([Intel XE#2312]) -> [SKIP][255] ([Intel XE#5390]) +5 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][256] ([Intel XE#5390]) -> [SKIP][257] ([Intel XE#2312]) +6 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][259] ([Intel XE#651])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#4208]) -> [SKIP][261] ([Intel XE#651])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][263] ([Intel XE#653])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-adlp:         [SKIP][264] ([Intel XE#4947]) -> [SKIP][265] ([Intel XE#653]) +3 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#4208]) -> [SKIP][267] ([Intel XE#653]) +6 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][268] ([Intel XE#2312]) -> [SKIP][269] ([Intel XE#2313]) +11 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][270] ([Intel XE#2313]) -> [SKIP][271] ([Intel XE#2312]) +10 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-adlp:         [SKIP][272] ([Intel XE#4947]) -> [SKIP][273] ([Intel XE#2927])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_cursor@primary:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#4208] / [i915#2575]) -> [FAIL][275] ([Intel XE#616])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_plane_cursor@primary.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-463/igt@kms_plane_cursor@primary.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          [SKIP][276] ([Intel XE#1909]) -> [SKIP][277] ([Intel XE#736])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#4208]) -> [SKIP][279] ([Intel XE#1489])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
    - shard-adlp:         [SKIP][280] ([Intel XE#4947]) -> [SKIP][281] ([Intel XE#1489])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-adlp:         [SKIP][282] ([Intel XE#4947]) -> [SKIP][283] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_psr@fbc-pr-no-drrs.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-2/igt@kms_psr@fbc-pr-no-drrs.html
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][285] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-464/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#4208]) -> [SKIP][287] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-adlp:         [SKIP][288] ([Intel XE#4950]) -> [SKIP][289] ([Intel XE#1127])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-adlp:         [SKIP][290] ([Intel XE#4950]) -> [SKIP][291] ([Intel XE#455])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_vrr@seamless-rr-switch-virtual.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#4208] / [i915#2575]) -> [SKIP][293] ([Intel XE#455])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_vrr@seamless-rr-switch-virtual.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#4208]) -> [SKIP][295] ([Intel XE#4837]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
    - shard-adlp:         [SKIP][296] ([Intel XE#4945]) -> [SKIP][297] ([Intel XE#4837]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-2/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - shard-adlp:         [SKIP][298] ([Intel XE#4945]) -> [SKIP][299] ([Intel XE#688])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         [SKIP][300] ([Intel XE#4945]) -> [SKIP][301] ([Intel XE#1392]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#4208]) -> [SKIP][303] ([Intel XE#1392])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - shard-adlp:         [SKIP][304] ([Intel XE#4945]) -> [SKIP][305] ([Intel XE#288]) +4 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-8/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#4208]) -> [SKIP][307] ([Intel XE#288]) +4 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-fork-read:
    - shard-adlp:         [SKIP][308] ([Intel XE#4945]) -> [SKIP][309] ([Intel XE#4915]) +43 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-fork-read.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-fork-read.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#4208]) -> [SKIP][311] ([Intel XE#4915]) +40 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-adlp:         [SKIP][312] ([Intel XE#4945]) -> [SKIP][313] ([Intel XE#5100])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_mmap@pci-membarrier-parallel.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-6/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][314], [SKIP][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339]) ([Intel XE#2457]) -> ([PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [DMESG-WARN][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [SKIP][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364]) ([Intel XE#2457] / [Intel XE#3428] / [Intel XE#5215])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-8/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-8/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-8/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-8/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-1/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-1/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-1/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-1/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-3/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-3/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-3/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-7/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-7/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-7/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-7/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-4/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-4/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-4/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-2/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-2/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-2/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-2/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-3/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-3/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-4/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-4/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-6/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-4/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-7/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-7/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-7/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-2/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-1/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-1/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-6/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-3/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-3/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-2/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-2/igt@xe_module_load@load.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-adlp:         [SKIP][365] ([Intel XE#4945]) -> [SKIP][366] ([Intel XE#2541] / [Intel XE#3573])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_oa@non-system-wide-paranoid.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-4/igt@xe_oa@non-system-wide-paranoid.html
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#4208]) -> [SKIP][368] ([Intel XE#2541] / [Intel XE#3573])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@xe_oa@non-system-wide-paranoid.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-466/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#4208]) -> [SKIP][370] ([Intel XE#4733])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
    - shard-adlp:         [SKIP][371] ([Intel XE#4945]) -> [SKIP][372] ([Intel XE#4733])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-8/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#4208]) -> [SKIP][374] ([Intel XE#4130])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@xe_sriov_auto_provisioning@fair-allocation.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
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
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4671
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5215]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5215
  [Intel XE#5249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5249
  [Intel XE#5298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5298
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5401
  [Intel XE#5428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5428
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8457 -> IGT_8458
  * Linux: xe-3412-b012f04b5be909a307ff629b297387e0ed55195a -> xe-pw-149503v15

  IGT_8457: 756ebdbf0e4c75f0680c0a36db206a9f6ff126ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8458: ff0457015d1bea8b5276b6b36c4bff6093081799 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3412-b012f04b5be909a307ff629b297387e0ed55195a: b012f04b5be909a307ff629b297387e0ed55195a
  xe-pw-149503v15: 149503v15

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/index.html

--===============7798273651651100796==
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
<tr><td><b>Series:</b></td><td>Cleaning up code related to VRAM regions and=
 its initialization - part 2 (rev15)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149503/">https://patchwork.freedesktop.org/series/149503/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149503v15/index.html">https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149503v15/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3412-b012f04b5be909a307ff629b297387e0e=
d55195a_FULL -&gt; xe-pw-149503v15_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149503v15_FULL that come from known =
issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-2/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15=
/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pi=
pe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-r=
otate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-1/igt@kms_big_fb@4-tiled-64bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-s=
tride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-1/igt@kms_big_fb@x-tiled-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-s=
ize-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-=
adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.htm=
l">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4543">Intel XE#4543</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw=
-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other tes=
t skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/i=
gt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#=
2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_bw@connected-linear-tili=
ng-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@kms_bw@connected-linear-ti=
ling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-8/igt@kms_bw@connected-linear-tili=
ng-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@kms_bw@connected-linear-til=
ing-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@kms_bw@linear-tiling-3-displ=
ays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-1/igt@kms_bw@linear-tiling-3-displ=
ays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-6/igt@kms_ccs@bad-pixel-format-y-t=
iled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_ccs@crc-primary-basic-=
4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@kms_ccs@crc-primary-basic-=
4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +132 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-y=
-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-434/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shar=
d-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">In=
tel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">In=
tel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-=
tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +22 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-5/igt@kms_chamelium_audio@dp-audio=
-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-432/igt@kms_chamelium_color@ctm-li=
mited-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-464/igt@kms_chamelium_edid@hdmi-ed=
id-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-aft=
er-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-gamma-lut-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@kms_colo=
r@invalid-gamma-lut-sizes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-6/igt@kms_color@invalid-=
gamma-lut-sizes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +2 other tests dmesg-war=
n</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-432/igt@kms_content_protection@srm=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-6/igt@kms_cursor_crc@cursor-offscr=
een-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-6/igt@kms_cursor_crc@cursor-rapid-=
movement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-1/igt@kms_cursor_legacy@2x-long-cu=
rsor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_cursor_legacy@2x-long-cu=
rsor-vs-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/s=
hard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varyin=
g-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2291">Intel XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-2/igt@kms_curs=
or_legacy@single-bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-7/igt@kms_cursor_legacy@single=
-bo.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5354">Intel XE#5354</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-2/igt@kms_cur=
sor_legacy@torture-bo@pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-3/igt@kms_cursor_leg=
acy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 o=
ther tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5428">Intel XE#5428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@kms_dsc@dsc-with-output-fo=
rmats-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dir=
ty-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-4/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-7/igt@kms_flip@2x-flip-vs-dpms.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_flip@2x-flip-vs-=
dpms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2316">Intel XE#2316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/sh=
ard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6=
-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/sh=
ard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6=
-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-4/igt@kms_fli=
p@basic-flip-vs-modeset@c-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-3/igt@kms_flip@=
basic-flip-vs-modeset@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +15 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-8/igt@kms_flip=
@flip-vs-absolute-wf_vblank@a-dp2.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-1/igt@kms_flip@f=
lip-vs-absolute-wf_vblank@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5338</a>) +1 other test =
fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-8/igt@kms_fli=
p@flip-vs-rmfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149503v15/shard-adlp-8/igt@kms_flip@flip-vs-rmfb.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4543">Intel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32b=
pp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#238=
0</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32b=
pp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#174=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32b=
pp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel =
XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32=
bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32b=
pp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE=
#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-9/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149503v15/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16b=
pp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel =
XE#4921</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-adlp-3/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-433/igt@kms_frontbuffer_tracking@d=
rrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc=
-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-adlp-8/igt@kms_frontbuffer_tracking@fb=
c-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-432/igt@kms_frontbuffer_tracking@f=
bc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc=
drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-adlp-4/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_frontbuffer_tracking@f=
bcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc=
psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-3/igt@kms_joiner@invalid-modeset-u=
ltra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@kms_joiner@invalid-modeset-u=
ltra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_multipipe_modeset@basi=
c-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-463/igt@kms_plane_cursor@primary@p=
ipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-6/igt@kms_plane_multiple@2x=
-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-4/igt@kms_plane_scaling@planes-ups=
cale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-6/igt@kms_pm_d=
c@dc5-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149503v15/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel X=
E#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-plane-mov=
e-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plan=
e-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-1/igt@kms_psr2_sf@pr-overlay-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1122">Intel XE#1122</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-8/igt@kms_psr2_su@page_flip-nv12.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1128">Intel XE#1128</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_psr2_su@page_flip-nv12.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2387">Intel XE#2387</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@kms_psr2_su@page_flip-nv12.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plan=
e-onoff@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-1/igt@kms_psr@pr-cursor-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@kms_psr@psr-cursor-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-7/igt@kms_psr@psr-cursor-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-463/igt@kms_psr@psr-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850"=
>Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-8/igt@kms_psr@=
psr2-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149503v15/shard-lnl-2/igt@kms_psr@psr2-basic.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5298">Inte=
l XE#5298</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_rotation_crc@bad-tiling.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-7/igt@kms_rotation_crc@primary-4-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_rotation_crc@primary-y=
-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-436/igt@kms_se=
tmode@basic@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-466/igt@kms_setmode@ba=
sic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-4/igt@kms_vrr@lobf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-v=
irtual.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-432/igt@xe_configfs@survivability-=
mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5249">Intel XE#5249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufe=
nce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-adlp-3/igt@xe_eudebug@basic-vm-bind-uf=
ence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufe=
nce-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebu=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-6/igt@xe_evict_ccs@evict-overcommi=
t-standalone-nofree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-432/igt@=
xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>=
) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other test=
s skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-1/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-adlp-6/igt@xe_exec_fault_mode@many-bin=
dexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-466/igt@xe_exec_fault_mode@once-bi=
ndexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-463/igt@xe_exec_sip_eudebug@breakp=
oint-writesip-nodebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-4/igt@xe_exec_system_allocator@man=
y-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-4/igt@xe_exec_=
system_allocator@many-large-execqueues-new-busy.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-6/=
igt@xe_exec_system_allocator@many-large-execqueues-new-busy.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428"=
>Intel XE#3428</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5215">Intel XE#5215</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@xe_exec_=
system_allocator@many-stride-malloc.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-7/igt@xe_exec_=
system_allocator@many-stride-malloc.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5401">Intel XE#5401</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-busy-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@xe_exec_system_allocator@on=
ce-new-busy-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-huge:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-466/igt@xe_exec_system_allocator@p=
rocess-many-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +97 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-4/igt@xe_exec_system_allocator@pro=
cess-many-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-8/igt@xe_mmap@pci-membarrier-paral=
lel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@xe_oa@invalid-oa-exponent.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-1/igt@xe_pm@d3cold-basic-exec.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-4/igt@xe_pm@s3-mocs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel=
 XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@xe_pmu@gt-frequency.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/48=
19">Intel XE#4819</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@xe_pxp@pxp-termination-key-u=
pdate-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-dg2-436/igt@xe_query@multigpu-query-uc=
-fw-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-lnl-1/igt@xe_sriov_auto_provisioning@f=
air-allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@xe_sriov_auto_provisioning@f=
air-allocation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@core_g=
etversion@all-cards.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@core_get=
version@all-cards.html">PASS</a></li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@core_ge=
tversion@all-cards.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4671">Intel XE#4671</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-8/igt@core_getve=
rsion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-forcewake:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@intel_s=
ysfs_debugfs@xe-forcewake.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-=
adlp-4/igt@intel_sysfs_debugfs@xe-forcewake.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@intel_=
sysfs_debugfs@xe-forcewake.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard=
-dg2-466/igt@intel_sysfs_debugfs@xe-forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-4/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911=
">Intel XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149503v15/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-fl=
ip-events-linear-atomic@pipe-c-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-4/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp=
-9/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-6/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
03v15/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-f=
encing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#454=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
503v15/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hfl=
ip.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_ccs@random-ccs=
-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/igt@kms_ccs@random-c=
cs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-6/igt@kms_cur=
sor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel =
XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149503v15/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-7=
/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +5 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-2/i=
gt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-8/igt@kms_fli=
p@flip-vs-panning@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-8=
/igt@kms_flip@flip-vs-panning@d-hdmi-a1.html">PASS</a> +7 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
03v15/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-=
move.html">PASS</a> +35 other tests pass</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v=
15/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_pla=
ne_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel=
 XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149503v15/shard-adlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-=
75-upscale-factor-0-25.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-6/igt@kms_pm_d=
c@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-3/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/sh=
ard-lnl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_ro=
tation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
503v15/shard-dg2-436/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html"=
>PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-8/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-2/igt@kms_vrr@cmrr=
@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">In=
tel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149503v15/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-m=
any-vm-bindexecqueue-userptr.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-3/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018"=
>Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149503v15/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared=
-vm-many-large-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_live=
_ktest@xe_dma_buf.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3099">Intel XE#3099</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-9/igt@xe_live_kte=
st@xe_dma_buf.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_vm@m=
unmap-style-unbind-many-all.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-8/igt@x=
e_vm@munmap-style-unbind-many-all.html">PASS</a> +32 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_bi=
g_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/ig=
t@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other t=
est skip</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_big=
_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-8/igt@=
kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel X=
E#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149503v15/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-=
0-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149503v15/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotat=
e-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_big=
_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v1=
5/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1124">Intel XE#1124</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149503v15/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-=
rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_bw@=
linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp=
-8/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</=
a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_bw=
@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
03v15/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"=
>Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_ccs=
@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#494=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
503v15/shard-adlp-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
55">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/787">Intel XE#787</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_cc=
s@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9503v15/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_ccs=
@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shar=
d-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Inte=
l XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/787">Intel XE#787</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_cc=
s@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/sha=
rd-dg2-432/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">In=
tel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149503v15/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212"=
>Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_cha=
melium_audio@dp-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-4/igt@km=
s_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test sk=
ip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_ch=
amelium_audio@dp-audio-edid.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shar=
d-dg2-436/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-4/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_cur=
sor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-=
2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_fbc=
_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v=
15/shard-adlp-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4422">Intel XE#4422</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_fb=
c_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
03v15/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-=
area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_fli=
p@2x-flip-vs-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-3/igt@kms_flip@2x=
-flip-vs-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_fli=
p_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel=
 XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149503v15/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-=
64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149503v15/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-t=
o-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
03v15/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149503v15/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
03v15/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49503v15/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb=
-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5390">Intel XE#5390</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#=
5390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149503v15/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Int=
el XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149503v15/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149503v15/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-sh=
rfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel=
 XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149503v15/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_fro=
ntbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#49=
47</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9503v15/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-=
plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49503v15/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indf=
b-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9503v15/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-=
fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149503v15/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_joi=
ner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-3/=
igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_pl=
ane_cursor@primary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-463=
/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-lnl-3/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1909">Intel XE#1909</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-lnl-5/igt@kms_pm_=
dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_ps=
r2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-=
436/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_psr=
2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-=
2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_psr=
@fbc-pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-2/igt@kms_psr@fbc-p=
r-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_ps=
r@fbc-pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-464=
/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_ps=
r@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-435/ig=
t@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_rot=
ation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-ad=
lp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#11=
27</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@kms_vrr=
@seamless-rr-switch-virtual.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-1/igt@k=
ms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@kms_vr=
r@seamless-rr-switch-virtual.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/sha=
rd-dg2-436/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@xe_eud=
ebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-=
464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837=
</a>) +1 other test skip</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_eude=
bug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-=
2/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_evic=
t_ccs@evict-overcommit-standalone-nofree-samefd.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v1=
5/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_exec=
_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#49=
45</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9503v15/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-=
invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49503v15/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userpt=
r-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_exec=
_fault_mode@once-userptr-invalidate-prefetch.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/s=
hard-adlp-8/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288=
">Intel XE#288</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@xe_exe=
c_fault_mode@once-userptr-invalidate-prefetch.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/=
shard-dg2-435/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
88">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-fork-re=
ad:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_exec=
_system_allocator@threads-shared-vm-many-large-malloc-fork-read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">I=
ntel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149503v15/shard-adlp-2/igt@xe_exec_system_allocator@threads-shared-=
vm-many-large-malloc-fork-read.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +43 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-large-new-bo-map.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149503v15/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-m=
any-large-new-bo-map.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_mmap=
@pci-membarrier-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-6/igt@xe_m=
map@pci-membarrier-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-8/igt@xe_=
module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55=
195a/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0=
ed55195a/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b2973=
87e0ed55195a/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b=
297387e0ed55195a/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff=
629b297387e0ed55195a/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a3=
07ff629b297387e0ed55195a/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be9=
09a307ff629b297387e0ed55195a/shard-bmg-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b=
5be909a307ff629b297387e0ed55195a/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-b012=
f04b5be909a307ff629b297387e0ed55195a/shard-bmg-4/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3412-=
b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-=
bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3412-b012f04b5be909a307ff629b297387e0ed55195=
a/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-=
bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-3/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149503v15/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149503v15/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/s=
hard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-6/igt@xe_module_load=
@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149503v15/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-7/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149503v15/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149503v15/shard-bmg-7/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/sh=
ard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@xe_module_load@=
load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149503v15/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149503v15/shard-bmg-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503=
v15/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149503v15/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bm=
g-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49503v15/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-bmg-2/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5215">Intel XE#5215</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_oa@n=
on-system-wide-paranoid.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp-4/igt@xe_oa=
@non-system-wide-paranoid.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@xe_oa@=
non-system-wide-paranoid.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2-466/igt@xe_=
oa@non-system-wide-paranoid.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@xe_pxp=
@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2=
-435/igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733=
</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-adlp-3/igt@xe_pxp@=
pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-adlp=
-8/igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3412-b012f04b5be909a307ff629b297387e0ed55195a/shard-dg2-466/igt@xe_sri=
ov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149503v15/shard-dg2=
-435/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130=
</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8457 -&gt; IGT_8458</li>
<li>Linux: xe-3412-b012f04b5be909a307ff629b297387e0ed55195a -&gt; xe-pw-149=
503v15</li>
</ul>
<p>IGT_8457: 756ebdbf0e4c75f0680c0a36db206a9f6ff126ce @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8458: ff0457015d1bea8b5276b6b36c4bff6093081799 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-3412-b012f04b5be909a307ff629b297387e0ed55195a: b012f04b5be909a307ff629=
b297387e0ed55195a<br />
  xe-pw-149503v15: 149503v15</p>

</body>
</html>

--===============7798273651651100796==--
