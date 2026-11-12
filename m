Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5D260A3827
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 15:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E17B10E0A1;
	Thu, 12 Nov 2026 15:22:51 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982E210E0A1;
 Thu, 12 Nov 2026 15:22:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2202920030290858993=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Introduce_Xe_PCIe_FLR_=28r?=
 =?utf-8?q?ev15=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Nov 2026 15:22:50 -0000
Message-ID: <179449697061.16527.16733423014787447933@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261112091033.1813803-1-raag.jadav@intel.com>
In-Reply-To: <20261112091033.1813803-1-raag.jadav@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2202920030290858993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce Xe PCIe FLR (rev15)
URL   : https://patchwork.freedesktop.org/series/162055/
State : success

== Summary ==

CI Bug Log - changes from xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82_FULL -> xe-pw-162055v15_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82_FULL and xe-pw-162055v15_FULL:

### New IGT tests (31) ###

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.07, 58.28] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.50] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [7.10] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.09] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [7.19] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.21] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [7.03] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [7.98] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [7.16] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.02] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - Statuses : 1 pass(s) 1 skip(s)
    - Exec time: [0.30, 31.85] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-dp-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-dp-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.04] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.03] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.03] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.01, 0.04] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - Statuses : 3 skip(s)
    - Exec time: [0.02] s

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - Statuses : 3 skip(s)
    - Exec time: [0.02, 0.04] s

  * igt@xe_waitfence@invalid-flag:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_waitfence@invalid-ops:
    - Statuses : 3 pass(s)
    - Exec time: [0.03, 0.05] s

  

Known issues
------------

  Here are the changes found in xe-pw-162055v15_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2233])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-ptl:          NOTRUN -> [SKIP][2] ([Intel XE#3157])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#5901]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][4] ([Intel XE#6925])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][6] ([Intel XE#7085])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-lnl:          [PASS][7] -> [ABORT][8] ([Intel XE#4760])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2328] / [Intel XE#7367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#5808]) +10 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#5855])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#7679]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#367]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2652]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#3432])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#5822]) +11 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#9311])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#5824])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2325] / [Intel XE#7358])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7358]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html
    - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#8391]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#2252]) +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2252]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#9671])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html
    - shard-ptl:          NOTRUN -> [SKIP][28] ([Intel XE#9671])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3:
    - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#6969]) +7 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#6974])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#5832] / [Intel XE#6974])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][32] ([Intel XE#3304]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-7/igt@kms_content_protection@legacy@pipe-a-dp-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#7642])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][34] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@mei-interface:
    - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#5845])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][36] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2320]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-ptl:          NOTRUN -> [SKIP][38] ([Intel XE#5900]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#5846]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#5962]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][41] ([Intel XE#5962] / [Intel XE#7343]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@uhbr-sst-direct-train:
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#9529])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_dp_link_training@uhbr-sst-direct-train.html
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#9529])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst-direct-train.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#9009])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
    - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#9009])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#8265])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-6/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#5907]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#8680])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2372] / [Intel XE#7359])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#2375])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2374] / [Intel XE#6128])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-ptl:          NOTRUN -> [SKIP][52] ([Intel XE#2316]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#5828]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-ptl:          NOTRUN -> [SKIP][56] ([Intel XE#7178]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#7178] / [Intel XE#7351])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#7179])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#656] / [Intel XE#7905])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:
    - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#5800] / [Intel XE#6312]) +9 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#6312]) +12 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#5812]) +72 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#4141]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2352] / [Intel XE#7399])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2311]) +17 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-plflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#7865]) +17 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#7399])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#7061]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#7061]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][71] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2313]) +17 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#6901])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
    - shard-ptl:          NOTRUN -> [SKIP][74] ([Intel XE#6912])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_plane@pixel-format-x-tiled-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][75] ([Intel XE#7283]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_plane@pixel-format-x-tiled-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#7283]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-ptl:          NOTRUN -> [SKIP][77] ([Intel XE#5946])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-ptl:          NOTRUN -> [SKIP][78] ([Intel XE#4596] / [Intel XE#5854])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#6886]) +9 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2499])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-ptl:          NOTRUN -> [SKIP][81] ([Intel XE#5810])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-ptl:          NOTRUN -> [SKIP][82] ([Intel XE#7304]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#5858])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#1489])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-ptl:          NOTRUN -> [SKIP][86] ([Intel XE#7413])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][87] ([Intel XE#1406] / [Intel XE#5835]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-ptl:          NOTRUN -> [SKIP][89] ([Intel XE#1406]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#3904] / [Intel XE#7342])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-ptl:          NOTRUN -> [SKIP][91] ([Intel XE#5821]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-ptl:          NOTRUN -> [SKIP][92] ([Intel XE#5910])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-ptl:          NOTRUN -> [SKIP][93] ([Intel XE#5857])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#5764]) +8 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#8370])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_evict@evict-small-multi-queue:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#6540] / [Intel XE#688])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-6/igt@xe_evict@evict-small-multi-queue.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#7482])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-6/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_balancer@once-cm-parallel-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][98] ([Intel XE#7482]) +18 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_exec_balancer@once-cm-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][99] ([Intel XE#5575] / [Intel XE#7484]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-multi-queue-imm:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#8374]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@xe_exec_fault_mode@many-multi-queue-imm.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][102] ([Intel XE#8374]) +11 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem:
    - shard-ptl:          NOTRUN -> [SKIP][103] ([Intel XE#8364]) +22 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem.html

  * igt@xe_exec_multi_queue@max-queues-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#8364]) +8 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@xe_exec_multi_queue@max-queues-userptr-invalidate.html

  * igt@xe_exec_reset@multi-queue-cancel:
    - shard-ptl:          NOTRUN -> [SKIP][105] ([Intel XE#8369]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_exec_reset@multi-queue-cancel.html

  * igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#8369])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#8378]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][108] ([Intel XE#8378]) +6 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#6964])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-6/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][110] ([Intel XE#6964]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#6964])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html

  * igt@xe_page_reclaim@pde-vs-pd:
    - shard-ptl:          NOTRUN -> [SKIP][112] ([Intel XE#7793]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_page_reclaim@pde-vs-pd.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-ptl:          NOTRUN -> [SKIP][113] ([Intel XE#5741]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-ptl:          [PASS][114] -> [DMESG-WARN][115] ([Intel XE#7727])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-ptl-6/igt@xe_pm@s4-vm-bind-prefetch.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][116] -> [DMESG-WARN][117] ([Intel XE#7727])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-lnl-8/igt@xe_pm@s4-vm-bind-userptr.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [PASS][118] -> [FAIL][119] ([Intel XE#9254])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:
    - shard-lnl:          [PASS][120] -> [FAIL][121] ([Intel XE#9461])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html

  * igt@xe_prefetch_fault@l2-prefetch-fault:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#8815])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@xe_prefetch_fault@l2-prefetch-fault.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-ptl:          NOTRUN -> [SKIP][123] ([Intel XE#7599])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#4733] / [Intel XE#7417])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_query@multigpu-query-engines:
    - shard-ptl:          NOTRUN -> [SKIP][125] ([Intel XE#6019]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#944]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-ptl:          NOTRUN -> [SKIP][127] ([Intel XE#6376] / [Intel XE#7422])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@xe_sriov_vram@vf-access-provisioned.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:
    - shard-ptl:          NOTRUN -> [SKIP][128] ([Intel XE#9597])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][129] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3:
    - shard-bmg:          [FAIL][131] ([Intel XE#6078]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][133] ([Intel XE#367]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs (NEW):
    - shard-bmg:          [INCOMPLETE][135] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][136] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][137] ([Intel XE#301]) -> [PASS][138] +1 other test pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_vrr@flip-basic:
    - shard-ptl:          [FAIL][139] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][140] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-ptl-7/igt@kms_vrr@flip-basic.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-8/igt@kms_vrr@flip-basic.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:
    - shard-bmg:          [ABORT][141] ([Intel XE#1727] / [Intel XE#6652]) -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][143] ([Intel XE#9362]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-lnl-5/igt@xe_pm@s4-basic.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-6/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-ptl:          [ABORT][145] ([Intel XE#9362]) -> [PASS][146] +2 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-ptl-3/igt@xe_pm@s4-basic-exec.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [FAIL][147] ([Intel XE#9254]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0:
    - shard-lnl:          [FAIL][149] ([Intel XE#9461]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][151] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][152] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][153] ([Intel XE#3544]) -> [SKIP][154] ([Intel XE#3374] / [Intel XE#3544])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][155] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][156] ([Intel XE#2426] / [Intel XE#5848])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5810]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5810
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5828]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828
  [Intel XE#5832]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#5845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5845
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5855]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5855
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910
  [Intel XE#5946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9311
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9461
  [Intel XE#9529]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9529
  [Intel XE#9597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597
  [Intel XE#9671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671


Build changes
-------------

  * Linux: xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82 -> xe-pw-162055v15

  IGT_9187: 9187
  xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82: 21bbb4e37d134297f83b5897188c2097defbbc82
  xe-pw-162055v15: 162055v15

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/index.html

--===============2202920030290858993==
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
<tr><td><b>Series:</b></td><td>Introduce Xe PCIe FLR (rev15)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162055/">https://patchwork.freedesktop.org/series/162055/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82_FULL -&gt; xe-pw-162055v15_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82_FULL and xe-pw-162055v15_FULL:</p>
<h3>New IGT tests (31)</h3>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.07, 58.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>Statuses : 1 pass(s) 1 skip(s)</li>
<li>Exec time: [0.30, 31.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@invalid-flag:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@invalid-ops:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.03, 0.05] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162055v15_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925">Intel XE#6925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5855">Intel XE#5855</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_cdclk@mode-rejected-max-dotclock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9311">Intel XE#9311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824">Intel XE#5824</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671">Intel XE#9671</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671">Intel XE#9671</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832">Intel XE#5832</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-7/igt@kms_content_protection@legacy@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5845">Intel XE#5845</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846">Intel XE#5846</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-direct-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_dp_link_training@uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9529">Intel XE#9529</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_dp_link_training@uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9529">Intel XE#9529</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009">Intel XE#9009</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128">Intel XE#6128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828">Intel XE#5828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_frontbuffer_tracking@drrs-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +72 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-xtiled:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_plane@pixel-format-x-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946">Intel XE#5946</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5810">Intel XE#5810</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-6/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910">Intel XE#5910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@xe_evict@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-6/igt@xe_evict@evict-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-6/igt@xe_exec_balancer@many-cm-virtual-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_exec_balancer@once-cm-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@xe_exec_fault_mode@many-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@xe_exec_multi_queue@max-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_exec_reset@multi-queue-cancel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-6/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pde-vs-pd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_page_reclaim@pde-vs-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741">Intel XE#5741</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-ptl-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_pm@s4-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-lnl-8/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9461">Intel XE#9461</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@l2-prefetch-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@xe_prefetch_fault@l2-prefetch-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815">Intel XE#8815</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_prefetch_fault@prefetch-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-6/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-6/igt@xe_sriov_vram@vf-access-provisioned.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597">Intel XE#9597</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs (NEW):</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-ptl-7/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-8/igt@kms_vrr@flip-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-10/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-lnl-5/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-6/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-ptl-3/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-ptl-1/igt@xe_pm@s4-basic-exec.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9461">Intel XE#9461</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v15/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82 -&gt; xe-pw-162055v15</li>
</ul>
<p>IGT_9187: 9187<br />
  xe-6120-21bbb4e37d134297f83b5897188c2097defbbc82: 21bbb4e37d134297f83b5897188c2097defbbc82<br />
  xe-pw-162055v15: 162055v15</p>

</body>
</html>

--===============2202920030290858993==--
