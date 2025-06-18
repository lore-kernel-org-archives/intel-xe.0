Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415ACC7115B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 06:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029BC10E42B;
	Wed, 18 Jun 2025 06:12:48 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0139310E42B;
 Wed, 18 Jun 2025 06:12:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3686619084442369013=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_Add_debugfs_node_to_expose?=
 =?utf-8?q?_G-state_and_pcie_link_state_residency_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Jun 2025 06:12:45 -0000
Message-ID: <175022716598.89783.7915902939718741488@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250617171600.2905682-1-soham.purkait@intel.com>
In-Reply-To: <20250617171600.2905682-1-soham.purkait@intel.com>
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

--===============3686619084442369013==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add debugfs node to expose G-state and pcie link state residency (rev2)
URL   : https://patchwork.freedesktop.org/series/149793/
State : success

== Summary ==

CI Bug Log - changes from xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed_FULL -> xe-pw-149793v2_FULL
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

  Here are the changes found in xe-pw-149793v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1] ([Intel XE#3767]) +31 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][2] ([Intel XE#873])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][4] ([Intel XE#610])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1407])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#316]) +6 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#607])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#610])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124]) +18 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +4 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2328])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#607]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#2314] / [Intel XE#2894])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#2191])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2314] / [Intel XE#2894])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#2191]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#367]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#367]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +17 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +43 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +153 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#2907]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#3442]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#787]) +20 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][31] -> [INCOMPLETE][32] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][33] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][34] ([Intel XE#2705] / [Intel XE#4212])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2887]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][36] ([Intel XE#4212])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][37] -> [INCOMPLETE][38] ([Intel XE#2705] / [Intel XE#4212])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#373])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_chamelium_audio@hdmi-audio-edid.html
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2252]) +8 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2325]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#306]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#373]) +16 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#373])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#5176])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][46] ([Intel XE#1178]) +2 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#307])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#1178]) +3 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][49] ([Intel XE#1188])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-3/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#308]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2320]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1424])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2321]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#2291]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#309]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#309])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][58] -> [FAIL][59] ([Intel XE#4633])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#323])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2286])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#323]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#1340])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#4494] / [i915#3804])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#4354])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@kms_dp_link_training@uhbr-mst.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#4356])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2244]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#2244])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#455]) +34 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4422])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4156])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#776])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_fbcon_fbt@psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#776])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1137])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1135])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1421])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][78] -> [FAIL][79] ([Intel XE#301]) +1 other test fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][80] -> [SKIP][81] ([Intel XE#2316]) +7 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#310]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-bmg:          [PASS][83] -> [FAIL][84] ([Intel XE#2882]) +1 other test fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][85] -> [INCOMPLETE][86] ([Intel XE#2049]) +1 other test incomplete
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-435/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank.html
    - shard-lnl:          [PASS][87] -> [FAIL][88] ([Intel XE#886]) +6 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][89] ([Intel XE#2049] / [Intel XE#2594])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#301]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [PASS][92] -> [DMESG-WARN][93] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-2/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-3/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1401] / [Intel XE#1745])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1401])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2293]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2380]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#455]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#651]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2312]) +3 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#4141]) +9 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#656]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#651]) +56 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2311]) +24 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#658])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#653]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#653]) +48 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1158])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2313]) +25 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#656]) +8 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#4298])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@kms_joiner@basic-max-non-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#4298])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_joiner@basic-max-non-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#4298])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#346])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#2927])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2927])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2486])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][119] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-1.html

  * igt@kms_plane@pixel-format@pipe-b-plane-0:
    - shard-adlp:         NOTRUN -> [FAIL][120] ([Intel XE#5195]) +4 other tests fail
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_plane@pixel-format@pipe-b-plane-0.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2393])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][122] -> [SKIP][123] ([Intel XE#4596])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-4.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][124] ([Intel XE#4658]) +3 other tests fail
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_plane_multiple@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#5020]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#870])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2938])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#870]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          NOTRUN -> [FAIL][129] ([Intel XE#718])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1129]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#908])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#1439] / [Intel XE#836])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#2893])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#1489]) +13 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#2893] / [Intel XE#4608])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#4608]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#1489]) +6 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2387])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#1122])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#1122])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1406])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#2850] / [Intel XE#929]) +31 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2234] / [Intel XE#2850]) +12 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2234])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2414])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#2939])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2330])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#3414]) +4 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][151] -> [SKIP][152] ([Intel XE#1435])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2426])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][154] ([Intel XE#1729])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#1500])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#330])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#2168])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_vrr@cmrr.html
    - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#2168])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][159] -> [SKIP][160] ([Intel XE#1499])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-3/igt@kms_vrr@negative-basic.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#1499]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#1123]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#4497]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#4837]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#4837]) +21 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_evict@evict-large:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#261] / [Intel XE#688])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@xe_evict@evict-large.html

  * igt@xe_evict@evict-small-cm:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#688])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2322]) +7 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#1392]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][171] ([Intel XE#1392])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm:
    - shard-adlp:         NOTRUN -> [SKIP][172] ([Intel XE#288]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#288]) +45 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][174] ([Intel XE#2360]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         [PASS][175] -> [DMESG-WARN][176] ([Intel XE#4812])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-1/igt@xe_exec_reset@gt-reset-stress.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][177] -> [DMESG-WARN][178] ([Intel XE#3876])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
    - shard-bmg:          NOTRUN -> [SKIP][179] ([Intel XE#4837]) +11 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#4943]) +21 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-mmap-huge.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro:
    - shard-adlp:         NOTRUN -> [SKIP][181] ([Intel XE#4915]) +35 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#4943]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@xe_exec_system_allocator@threads-many-large-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][183] -> [FAIL][184] ([Intel XE#5018])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#4915]) +457 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     NOTRUN -> [ABORT][186] ([Intel XE#4917])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#255])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#378])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212]) -> ([PASS][213], [PASS][214], [SKIP][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238]) ([Intel XE#2457])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-3/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-3/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-3/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-2/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-2/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-2/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-7/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-7/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-7/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-1/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-1/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-1/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-8/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-8/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-4/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-4/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-4/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-2/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-2/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-3/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-8/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-8/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-3/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-3/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-8/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258]) -> ([PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [SKIP][284]) ([Intel XE#378])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-435/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-435/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-435/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-466/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-466/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-466/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-436/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-436/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-436/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-464/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-464/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-464/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-464/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-434/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-434/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-434/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-433/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-433/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-433/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@xe_module_load@load.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-adlp:         NOTRUN -> [SKIP][285] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][286] ([Intel XE#2541] / [Intel XE#3573]) +10 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][287] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][288] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][289] ([Intel XE#979])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][290] ([Intel XE#1173]) +1 other test fail
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][291] ([Intel XE#2284] / [Intel XE#366])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][292] ([Intel XE#2284])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][293] -> [ABORT][294] ([Intel XE#1794])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-3/igt@xe_pm@s4-vm-bind-prefetch.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][295] ([Intel XE#579])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][296] ([Intel XE#4650])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][297] ([Intel XE#4733]) +5 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][298] ([Intel XE#4733]) +5 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][299] ([Intel XE#4733])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][300] ([Intel XE#944]) +3 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-topology:
    - shard-bmg:          NOTRUN -> [SKIP][301] ([Intel XE#944])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@xe_query@multigpu-query-topology.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][302] ([Intel XE#4821])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          NOTRUN -> [SKIP][303] ([Intel XE#4130])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][304] ([Intel XE#4130]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][305] ([Intel XE#3342])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html
    - shard-bmg:          NOTRUN -> [SKIP][306] ([Intel XE#3342])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-dg2-set2:     NOTRUN -> [SKIP][307] ([Intel XE#4273])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     NOTRUN -> [SKIP][308] ([Intel XE#4351])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-read:
    - shard-adlp:         [SKIP][309] ([Intel XE#2134]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@fbdev@unaligned-read.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@fbdev@unaligned-read.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][311] ([Intel XE#4543]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][313] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][314] +1 other test pass
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][315] ([Intel XE#3862]) -> [PASS][316] +1 other test pass
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][317] ([Intel XE#2291]) -> [PASS][318] +3 other tests pass
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][319] ([Intel XE#4354]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][321] ([Intel XE#2316]) -> [PASS][322] +5 other tests pass
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][323] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     [FAIL][325] ([Intel XE#301]) -> [PASS][326] +6 other tests pass
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][327] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][328] +1 other test pass
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-adlp:         [SKIP][329] ([Intel XE#4950]) -> [PASS][330] +9 other tests pass
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@b-hdmi-a1:
    - shard-adlp:         [FAIL][331] ([Intel XE#886]) -> [PASS][332]
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-6/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-1/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-adlp:         [SKIP][333] ([Intel XE#4947]) -> [PASS][334] +2 other tests pass
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][335] ([Intel XE#3012]) -> [PASS][336]
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc:
    - shard-adlp:         [DMESG-WARN][337] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][338] +4 other tests pass
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-8/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-3/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][339] ([Intel XE#4596]) -> [PASS][340]
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [INCOMPLETE][341] -> [PASS][342]
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_pm_rpm@system-suspend-modeset.html
    - shard-adlp:         [SKIP][343] ([Intel XE#4962]) -> [PASS][344]
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_pm_rpm@system-suspend-modeset.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][345] ([Intel XE#4459]) -> [PASS][346] +1 other test pass
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][347] ([Intel XE#2142]) -> [PASS][348] +1 other test pass
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_pm@s4-basic-exec:
    - shard-bmg:          [ABORT][349] ([Intel XE#5255]) -> [PASS][350]
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@xe_pm@s4-basic-exec.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_pm@s4-basic-exec.html
    - shard-adlp:         [ABORT][351] ([Intel XE#1794]) -> [PASS][352]
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-bmg:          [ABORT][353] -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@xe_pm@s4-multiple-execs.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_vm@large-split-binds-2147483648:
    - shard-adlp:         [SKIP][355] ([Intel XE#4945]) -> [PASS][356] +25 other tests pass
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_vm@large-split-binds-2147483648.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@xe_vm@large-split-binds-2147483648.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         [SKIP][357] ([Intel XE#4947]) -> [SKIP][358] ([Intel XE#1124])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [SKIP][359] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][360] ([Intel XE#1124]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-adlp:         [SKIP][361] ([Intel XE#4947]) -> [SKIP][362] ([Intel XE#316])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-adlp:         [SKIP][363] ([Intel XE#4950]) -> [SKIP][364] ([Intel XE#2191]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-adlp:         [SKIP][365] ([Intel XE#4947]) -> [SKIP][366] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         [SKIP][367] ([Intel XE#4950]) -> [SKIP][368] ([Intel XE#306])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_chamelium_color@ctm-max.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-adlp:         [SKIP][369] ([Intel XE#4950]) -> [SKIP][370] ([Intel XE#373])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-adlp:         [SKIP][371] ([Intel XE#4950]) -> [SKIP][372] ([Intel XE#307])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_content_protection@dp-mst-lic-type-0.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][373] ([Intel XE#2341]) -> [FAIL][374] ([Intel XE#1178])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@kms_content_protection@legacy.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][375] ([Intel XE#2341]) -> [FAIL][376] ([Intel XE#1188])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@kms_content_protection@uevent.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-adlp:         [SKIP][377] ([Intel XE#4950]) -> [SKIP][378] ([Intel XE#455]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-adlp:         [SKIP][379] ([Intel XE#4950]) -> [SKIP][380] ([Intel XE#323])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-adlp:         [SKIP][381] ([Intel XE#4945]) -> [SKIP][382] ([Intel XE#4422])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-adlp:         [SKIP][383] ([Intel XE#4947]) -> [SKIP][384] ([Intel XE#455])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][385] ([Intel XE#4947]) -> [SKIP][386] ([Intel XE#651]) +1 other test skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][387] ([Intel XE#2311]) -> [SKIP][388] ([Intel XE#2312]) +18 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][389] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][390] ([Intel XE#656])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][391] ([Intel XE#2312]) -> [SKIP][392] ([Intel XE#2311]) +13 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-adlp:         [SKIP][393] ([Intel XE#4947]) -> [SKIP][394] ([Intel XE#656]) +8 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][395] ([Intel XE#4141]) -> [SKIP][396] ([Intel XE#2312]) +9 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][397] ([Intel XE#2312]) -> [SKIP][398] ([Intel XE#4141]) +6 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][399] ([Intel XE#2312]) -> [SKIP][400] ([Intel XE#2313]) +17 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][401] ([Intel XE#2313]) -> [SKIP][402] ([Intel XE#2312]) +14 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [SKIP][403] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][404] ([Intel XE#653])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         [SKIP][405] ([Intel XE#4947]) -> [SKIP][406] ([Intel XE#1129])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         [SKIP][407] ([Intel XE#4947]) -> [SKIP][408] ([Intel XE#1489])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-adlp:         [SKIP][409] ([Intel XE#4947]) -> [SKIP][410] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@xe_eu_stall@non-blocking-read:
    - shard-adlp:         [SKIP][411] ([Intel XE#4945]) -> [SKIP][412] ([Intel XE#4497])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_eu_stall@non-blocking-read.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@xe_eu_stall@non-blocking-read.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-adlp:         [SKIP][413] ([Intel XE#4945]) -> [SKIP][414] ([Intel XE#4837]) +2 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-adlp:         [SKIP][415] ([Intel XE#4945]) -> [SKIP][416] ([Intel XE#261] / [Intel XE#688])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_evict@evict-beng-large-external-cm.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - shard-adlp:         [SKIP][417] ([Intel XE#4945]) -> [SKIP][418] ([Intel XE#288]) +3 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap:
    - shard-adlp:         [SKIP][419] ([Intel XE#4945]) -> [SKIP][420] ([Intel XE#4915]) +44 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap.html

  * igt@xe_mmap@vram:
    - shard-adlp:         [SKIP][421] ([Intel XE#4945]) -> [SKIP][422] ([Intel XE#1008])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_mmap@vram.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@xe_mmap@vram.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-adlp:         [SKIP][423] ([Intel XE#4945]) -> [SKIP][424] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_oa@syncs-ufence-wait.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-adlp:         [SKIP][425] ([Intel XE#4945]) -> [SKIP][426] ([Intel XE#944])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_query@multigpu-query-cs-cycles.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@xe_query@multigpu-query-cs-cycles.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4658
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4812
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5172
  [Intel XE#5176]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5176
  [Intel XE#5195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195
  [Intel XE#5255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5255
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed -> xe-pw-149793v2

  IGT_8413: 8413
  xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed: eb615557c4565c6236cd13b9cd164d472df1d0ed
  xe-pw-149793v2: 149793v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/index.html

--===============3686619084442369013==
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
<tr><td><b>Series:</b></td><td>Add debugfs node to expose G-state and pcie =
link state residency (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149793/">https://patchwork.freedesktop.org/series/149793/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149793v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149793v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3264-eb615557c4565c6236cd13b9cd164d472=
df1d0ed_FULL -&gt; xe-pw-149793v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149793v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a=
-hdmi-a-6-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_async_flips@async-flip-=
with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">In=
tel XE#3767</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_async_flips@invalid-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-si=
ze-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_big_fb@yf-tiled-64bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_big_fb@yf-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-s=
ize-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/607">Intel XE#607</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_bw@connected-linear-tili=
ng-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_bw@connected-linear-til=
ing-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_bw@linear-tiling-1-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_bw@linear-tiling-2-disp=
lays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_ccs@ccs-on-another-bo-4-=
tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +153 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@kms_ccs@crc-primary-suspend=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1=
:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-ba=
sic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg=
2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705=
">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_chamelium_audio@hdmi-aud=
io-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_chamelium_audio@hdmi-audi=
o-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@kms_chamelium_color@gamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-=
change-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-aft=
er-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_content_protection@atomic=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5176">Intel XE#5176</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_content_protection@dp-m=
st-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-3/igt@kms_content_protection@uevent=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_cursor_crc@cursor-offsc=
reen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_cursor_crc@cursor-onscree=
n-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_cursor_crc@cursor-onscree=
n-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@kms_cursor_crc@cursor-random-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-2/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs=
-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-=
flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-8/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-1/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@kms_dither@fb-8bpc-v=
s-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@kms_dp_link_training@uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_dp_link_training@uhbr-m=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-format=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_fbcon_fbt@fbc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">I=
ntel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_fbcon_fbt@psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">In=
tel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@kms_fbcon_fbt@psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">=
Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_feature_discovery@dp-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_feature_discovery@psr1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_flip@2x-flip-vs-blocking-=
wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt=
@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-1/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@kms_flip@2x-plain-=
flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_flip@2x-plain-flip-ts-ch=
eck-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-1/igt@kms_flip=
@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@kms_flip@basic-flip-=
vs-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-435/igt@kms_fl=
ip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-433/igt@kms_flip@flip=
-vs-absolute-wf_vblank.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test inc=
omplete</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-lnl-7/igt@kms_flip=
@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-2/igt@kms_flip@flip-vs-=
absolute-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_flip@flip-vs-dpms-on-nop-=
interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-4/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-3/igt@kms_flip@flip-vs=
-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel =
XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">=
Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">In=
tel XE#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64b=
pp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +9 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
drrs-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +56 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2311">Intel XE#2311</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
psr-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cpsr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_frontbuffer_tracking@pl=
ane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +25 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@kms_joiner@basic-max-non-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4298">Intel XE#4298</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_joiner@basic-max-non-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4298">Intel XE#4298</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_joiner@basic-max-non-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_joiner@invalid-modeset-=
big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_joiner@invalid-modeset-u=
ltra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_panel_fitting@legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_pipe_crc_basic@read-crc-=
frame-sequence@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_plane@pixel-format@pipe-=
b-plane-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5195">Intel XE#5195</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-3/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@kms_plane_multiple@2x-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_plane_multiple@tiling-x@p=
ipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4658">Intel XE#4658</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_plane_multiple@tiling-y=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5020">Intel XE#5020</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_pm_backlight@basic-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_pm_backlight@brightness-w=
ith-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@kms_pm_backlight@fade-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">I=
ntel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"=
>Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-=
plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +13 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-plane-mo=
ve-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2387">Intel XE#2387</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_psr2_su@frontbuffer-xrgb=
8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@kms_psr@fbc-pr-primary-page-f=
lip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_psr@psr-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_psr@psr2-no-drrs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@kms_psr@psr2-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@kms_psr_stress_test@flip-pr=
imary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_rotation_crc@sprite-rotat=
ion-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-1/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@kms_tiled_display@basic-tes=
t-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_tiled_display@basic-tes=
t-pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@kms_tv_load_detect@load-det=
ect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@kms_vrr@cmrr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_vrr@cmrr.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-3/igt@kms_vrr@=
negative-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@kms_vrr@negative-basic.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/149=
9">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_compute_preempt@compute-=
preempt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@xe_copy_basic@mem-copy-line=
ar-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_eu_stall@blocking-re-ena=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4497">Intel XE#4497</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@xe_eudebug_online@interrupt-o=
ther-debuggable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_eudebug_online@resume-ds=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@xe_evict@evict-large.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/261=
">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@xe_evict@evict-small-cm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
88">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +7 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@xe_exec_basic@multigpu-once-b=
indexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@xe_exec_basic@multigpu-once-=
null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-userptr-imm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-us=
erptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +45 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@xe_exec_mix_modes@exec-simp=
le-batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-1/igt@xe_exec=
_reset@gt-reset-stress.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-6/igt@xe_exec_reset@gt-rese=
t-stress.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4812">Intel XE#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@xe_exe=
c_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_exec_reset@par=
allel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_exec_sip_eudebug@breakpoin=
t-writesip-nodebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_exec_system_allocator@proc=
ess-many-large-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +21 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@xe_exec_system_allocator@pro=
cess-many-large-mmap-remap-ro.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +35 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-lnl-7/igt@xe_exec_system_allocator@thre=
ads-many-large-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-lnl-4/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149793v2/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-=
many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eo=
check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>)=
 +457 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_fault_injection@probe-fa=
il-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@xe_huc_copy@huc_copy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
5">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@xe_module_load@force-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1=
d0ed/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d47=
2df1d0ed/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd16=
4d472df1d0ed/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9=
cd164d472df1d0ed/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd=
13b9cd164d472df1d0ed/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c62=
36cd13b9cd164d472df1d0ed/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c456=
5c6236cd13b9cd164d472df1d0ed/shard-bmg-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557=
c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb61=
5557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-=
eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-=
bmg-4/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149793v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/ig=
t@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149793v2/shard-bmg-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149793v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149793v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149793v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149793v2/shard-bmg-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-6/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149793v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-5/igt@xe_module_loa=
d@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2457">Intel XE#2457</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-435/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-435/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-4=
35/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard=
-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed=
/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472d=
f1d0ed/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd16=
4d472df1d0ed/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd1=
3b9cd164d472df1d0ed/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6=
236cd13b9cd164d472df1d0ed/shard-dg2-436/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c=
4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb6=
15557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-32=
64-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-464=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-d=
g2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d472df1=
d0ed/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9cd164d=
472df1d0ed/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3264-eb615557c4565c6236cd13b9=
cd164d472df1d0ed/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shar=
d-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149793v2/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-433=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
793v2/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/sha=
rd-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149793v2/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-46=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-433/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9793v2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/sh=
ard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149793v2/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-4=
35/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49793v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/s=
hard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-435/igt@xe_module_l=
oad@load.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@xe_oa@non-system-wide-parano=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_oa@polling-small-buf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3573">Intel XE#3573</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_oa@syncs-ufence-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@xe_oa@syncs-userptr-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_pm@d3cold-multiple-execs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-3/igt@xe_pm@s=
4-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149793v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_pmu@all-fn-engine-activi=
ty-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_pxp@display-pxp-fb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-po=
st-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4733">Intel XE#4733</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@xe_pxp@pxp-stale-bo-exec-pos=
t-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_query@multigpu-query-oa-=
units.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@xe_query@multigpu-query-topol=
ogy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-434/igt@xe_spin_batch@spin-mem-copy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4821">Intel XE#4821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@xe_sriov_auto_provisioning@=
selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3342">Intel XE#3342</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-bmg-7/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@xe_sriov_flr@flr-vfs-parall=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149793v2/shard-dg2-466/igt@xe_sriov_scheduling@equal-t=
hroughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@fbdev@u=
naligned-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@fbdev@unaligned-=
read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-1/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel X=
E#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149793v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0=
-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149793v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x=
1080p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-435/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/=
shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@kms_curs=
or_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-b=
mg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> +3 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_d=
p_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg=
-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> +5 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149793v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank=
-interruptible@ab-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@d-dp4.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/sha=
rd-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html">PA=
SS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
793v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_fli=
p@modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-ad=
lp-4/igt@kms_flip@modeset-vs-vblank-race-interruptible.html">PASS</a> +9 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-6/igt@kms_fli=
p@plain-flip-ts-check@b-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-1/igt@=
kms_flip@plain-flip-ts-check@b-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_fli=
p_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE=
#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149793v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-yt=
ile-downscaling.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-8/igt@kms_pip=
e_crc_basic@disable-crc-after-crtc.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4=
173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49793v2/shard-adlp-3/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html">PA=
SS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-1/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-dg2-436/igt@kms_pm=
_rpm@system-suspend-modeset.html">INCOMPLETE</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-dg2-436/igt@kms_pm_rp=
m@system-suspend-modeset.html">PASS</a></li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_pm_=
rpm@system-suspend-modeset.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms=
_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-lnl-8/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-lnl-6/igt@kms_vrr@cmrr@=
pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-lnl-8/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-l=
nl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@xe_pm@s4=
-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5255">Intel XE#5255</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_pm@s4-basic-exe=
c.html">PASS</a></li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-9/igt@xe_pm@s=
4-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-8/igt@xe_pm@s4-basic-e=
xec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@xe_pm@s4=
-multiple-execs.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@xe_pm@s4-multiple-execs.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-2147483648:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_vm@l=
arge-split-binds-2147483648.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@xe=
_vm@large-split-binds-2147483648.html">PASS</a> +25 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_big=
_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-=
adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel =
XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_big=
_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49793v2/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_big=
_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@k=
ms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_bw@=
connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/s=
hard-adlp-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
91">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_ccs=
@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-a=
dlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/78=
7">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_cha=
melium_color@ctm-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_chame=
lium_color@ctm-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_cha=
melium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/i=
gt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_con=
tent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/=
igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-4/igt@kms_conte=
nt_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-bmg-3/igt@kms_conte=
nt_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_cur=
sor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-=
4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_cur=
sor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2=
/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_fbc=
_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v=
2/shard-adlp-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_fli=
p_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE=
#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149793v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-y=
ftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE=
#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149793v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-in=
dfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1497=
93v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-=
primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149793v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1497=
93v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49793v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1497=
93v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49793v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
793v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#=
2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_pm_=
dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms_pm_dc@dc5-psr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_psr=
2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shar=
d-adlp-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">In=
tel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@kms_psr=
@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@kms=
_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-read:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_eu_s=
tall@non-blocking-read.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@xe_eu_s=
tall@non-blocking-read.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_eude=
bug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp=
-4/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_evic=
t@evict-beng-large-external-cm.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/i=
gt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_exec=
_fault_mode@twice-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard=
-adlp-4/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel=
 XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_exec=
_system_allocator@threads-shared-vm-many-mmap-shared-remap.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel =
XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149793v2/shard-adlp-4/igt@xe_exec_system_allocator@threads-shared-vm-man=
y-mmap-shared-remap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_mmap=
@vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@xe_mmap@vram.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">I=
ntel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_oa@s=
yncs-ufence-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@xe_oa@syncs-u=
fence-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed/shard-adlp-4/igt@xe_quer=
y@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149793v2/shard-adlp-4/igt@xe_=
query@multigpu-query-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed -&gt; xe-pw-149=
793v2</li>
</ul>
<p>IGT_8413: 8413<br />
  xe-3264-eb615557c4565c6236cd13b9cd164d472df1d0ed: eb615557c4565c6236cd13b=
9cd164d472df1d0ed<br />
  xe-pw-149793v2: 149793v2</p>

</body>
</html>

--===============3686619084442369013==--
