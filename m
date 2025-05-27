Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0455AC54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 15:50:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102D410E4F9;
	Tue, 27 May 2025 15:49:59 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8796310E4CD;
 Tue, 27 May 2025 15:49:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7089167808328062947=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_series_starting_with_=5B1/?=
 =?utf-8?q?1=5D_drm/xe/svm=3A_Avoid_duplicate_eviction_on_get=5Fpages=28=29_?=
 =?utf-8?q?failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 May 2025 15:49:58 -0000
Message-ID: <174836099854.24728.18038499108729102960@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250526163907.1011529-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250526163907.1011529-1-himal.prasad.ghimiray@intel.com>
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

--===============7089167808328062947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/1] drm/xe/svm: Avoid duplicate eviction on get_pages() failure
URL   : https://patchwork.freedesktop.org/series/149506/
State : success

== Summary ==

CI Bug Log - changes from xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba_FULL -> xe-pw-149506v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba_FULL and xe-pw-149506v1_FULL:

### New IGT tests (3) ###

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.44] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.29] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.31] s

  

Known issues
------------

  Here are the changes found in xe-pw-149506v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#873])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2327])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][3] ([Intel XE#1124]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#607])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][5] ([Intel XE#4543])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#2314] / [Intel XE#2894])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#787]) +11 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +5 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#787]) +118 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][15] -> [INCOMPLETE][16] ([Intel XE#3862]) +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2652] / [Intel XE#787]) +13 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#455] / [Intel XE#787]) +16 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][20] -> [INCOMPLETE][21] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][22] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cdclk@plane-scaling:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#4416] / [Intel XE#455])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#4416]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#306])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#373])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2252]) +8 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][28] ([Intel XE#1178])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2390])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][30] ([Intel XE#1178]) +2 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-464/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#4208] / [i915#2575]) +17 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-436/igt@kms_cursor_crc@cursor-dpms.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#455])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2320]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2321]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#455]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#308])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][37] ([Intel XE#3226])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2291]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#309])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2291]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#4302])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#4354])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#4354])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#776])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2373])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1138])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-busy-flip:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2316])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#310]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][52] -> [FAIL][53] ([Intel XE#301] / [Intel XE#3321])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][54] -> [FAIL][55] ([Intel XE#301])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg2-set2:     [PASS][56] -> [FAIL][57] ([Intel XE#886])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][58] ([Intel XE#886])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a2-dp2.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#2316]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#301]) +2 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][62] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_event_leak@basic:
    - shard-adlp:         [PASS][63] -> [DMESG-WARN][64] ([Intel XE#2953] / [Intel XE#4173]) +5 other tests dmesg-warn
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-2/igt@kms_flip_event_leak@basic.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-8/igt@kms_flip_event_leak@basic.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2293]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][67] -> [DMESG-FAIL][68] ([Intel XE#4543]) +1 other test dmesg-fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][69] -> [FAIL][70] ([Intel XE#1874]) +2 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#656]) +8 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2311]) +11 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#4141]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#651]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#651]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1151])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2312]) +8 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2313]) +8 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#653]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#653])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#1503])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][83] -> [SKIP][84] ([Intel XE#3012])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#4298])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-434/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2927])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][87] -> [SKIP][88] ([Intel XE#4596])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-x.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:
    - shard-dg2-set2:     [PASS][89] -> [SKIP][90] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2763]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#870])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#3309])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#836])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#1489]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1489])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1122])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2387])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2850] / [Intel XE#929])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@pr-cursor-render:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2414])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#2939])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#3414]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][107] -> [SKIP][108] ([Intel XE#1435]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][109] -> [FAIL][110] ([Intel XE#4459]) +1 other test fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#1499])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#1091] / [Intel XE#2849])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#1126])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#4837]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#4837]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#261] / [Intel XE#688])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#688])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#1392])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [PASS][119] -> [SKIP][120] ([Intel XE#1392]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#1392]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2322]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-rebind-imm:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#288]) +5 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_exec_fault_mode@twice-rebind-imm.html

  * igt@xe_exec_system_allocator@once-large-new:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#4915]) +65 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_exec_system_allocator@once-large-new.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#4208]) +110 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#4943]) +17 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][127] -> [FAIL][128] ([Intel XE#5018])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#4915]) +5 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-434/igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2229])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#586])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@xe_mmap@small-bar.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2236])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#2284] / [Intel XE#366])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][135] -> [ABORT][136] ([Intel XE#1794])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-lnl-4/igt@xe_pm@s4-exec-after.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#4650])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#4733])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#4733]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#944])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#944])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#4130])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#4273])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_vm@munmap-style-unbind-many-all:
    - shard-dg2-set2:     [PASS][144] -> [SKIP][145] ([Intel XE#4208])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-all.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-436/igt@xe_vm@munmap-style-unbind-many-all.html

  * igt@xe_vm@munmap-style-unbind-one-partial:
    - shard-bmg:          [PASS][146] -> [INCOMPLETE][147] ([Intel XE#2594])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@xe_vm@munmap-style-unbind-one-partial.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-7/igt@xe_vm@munmap-style-unbind-one-partial.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][148] ([Intel XE#4543]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][150] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][152] ([Intel XE#2291]) -> [PASS][153] +2 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][154] ([Intel XE#2316]) -> [PASS][155] +5 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][156] ([Intel XE#301]) -> [PASS][157] +2 other tests pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][158] ([Intel XE#301]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [FAIL][160] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][161] +3 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:
    - shard-bmg:          [FAIL][162] ([Intel XE#3321]) -> [PASS][163] +1 other test pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check@b-edp1:
    - shard-lnl:          [FAIL][164] ([Intel XE#886]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@b-edp1.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-adlp:         [FAIL][166] ([Intel XE#886]) -> [PASS][167] +2 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-9/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-1/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [DMESG-WARN][168] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][169] +10 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][170] ([Intel XE#1499]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@kms_vrr@negative-basic.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-7/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1392]) -> [PASS][173] +3 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-464/igt@xe_exec_basic@multigpu-once-rebind.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-dg2-set2:     [INCOMPLETE][174] ([Intel XE#4912]) -> [SKIP][175] ([Intel XE#4208] / [i915#2575])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-436/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#367]) -> [SKIP][177] ([Intel XE#4208] / [i915#2575])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][178] ([Intel XE#2341]) -> [FAIL][179] ([Intel XE#1178])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][180] ([Intel XE#2311]) -> [SKIP][181] ([Intel XE#2312]) +9 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][182] ([Intel XE#2312]) -> [SKIP][183] ([Intel XE#4141]) +5 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][184] ([Intel XE#4141]) -> [SKIP][185] ([Intel XE#2312]) +4 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][186] ([Intel XE#2312]) -> [SKIP][187] ([Intel XE#2311]) +12 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][188] ([Intel XE#2313]) -> [SKIP][189] ([Intel XE#2312]) +10 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][190] ([Intel XE#2312]) -> [SKIP][191] ([Intel XE#2313]) +12 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][193] ([Intel XE#4208])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@kms_psr@fbc-pr-sprite-blt.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-436/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][194] ([Intel XE#1729]) -> [SKIP][195] ([Intel XE#362])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#330]) -> [SKIP][197] ([Intel XE#4208] / [i915#2575])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#4915]) -> [SKIP][199] ([Intel XE#4208]) +4 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-stride-mmap.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-stride-mmap.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][200], [PASS][201], [PASS][202], [SKIP][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [DMESG-WARN][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225]) ([Intel XE#2953] / [Intel XE#378] / [Intel XE#4173]) -> ([PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [SKIP][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251]) ([Intel XE#378])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-2/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-1/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-4/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-8/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-6/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-6/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-6/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-2/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-3/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-2/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-2/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-3/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-3/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-3/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-9/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-3/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-9/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-9/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-1/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-8/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-1/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-8/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-8/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-8/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-4/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-4/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-8/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-8/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-8/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-9/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-9/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-9/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-1/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-1/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-9/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-1/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-1/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-1/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-3/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-3/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-3/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-2/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-2/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-2/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-6/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-6/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-6/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-6/igt@xe_module_load@load.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][252] ([Intel XE#1173]) -> [SKIP][253] ([Intel XE#1061])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-463/igt@xe_peer2peer@read.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-432/igt@xe_peer2peer@read.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
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
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba -> xe-pw-149506v1

  IGT_8380: 8380
  xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba: 1ba472d34ab7f4d19d74cb93f53622fb940de8ba
  xe-pw-149506v1: 149506v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/index.html

--===============7089167808328062947==
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
<tr><td><b>Series:</b></td><td>series starting with [1/1] drm/xe/svm: Avoid=
 duplicate eviction on get_pages() failure</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149506/">https://patchwork.freedesktop.org/series/149506/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149506v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149506v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3144-1ba472d34ab7f4d19d74cb93f53622fb9=
40de8ba_FULL -&gt; xe-pw-149506v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3144-1ba472d34ab7f4d19d74cb93f=
53622fb940de8ba_FULL and xe-pw-149506v1_FULL:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.31] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149506v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_async_flips@invalid-async=
-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-st=
ride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/ig=
t@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_bw@connected-linear-tilin=
g-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_bw@linear-tiling-2-displ=
ays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_ccs@bad-rotation-90-4-ti=
led-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +118 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-6/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-=
y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_cdclk@plane-scaling.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4416">Intel XE#4416</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_cdclk@plane-scaling@pipe=
-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4416">Intel XE#4416</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_chamelium_color@ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_chamelium_frames@hdmi-cr=
c-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-st=
orm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-7/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-dg2-464/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-dg2-436/igt@kms_cursor_crc@cursor-dpms.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/2575">i915#2575</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-dg2-434/igt@kms_cursor_crc@cursor-offsc=
reen-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_cursor_crc@cursor-random-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-=
movement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_cursor_crc@cursor-slidin=
g-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs=
-flip-toggle.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs=
-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipb-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_c=
ursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-2/igt@kms_disp=
lay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_display_mod=
es@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-4/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_dp_link_trainin=
g@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_fbcon_fbt@psr-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_flip@2x-busy-flip.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
6">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-off=
-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/sha=
rd-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/sha=
rd-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-463/igt@kms_fl=
ip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-432/igt@kms_flip@2x-pl=
ain-flip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-r=
ecreate@ab-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-4/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_flip=
@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-2/igt@kms_fli=
p_event_leak@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149506v1/shard-adlp-8/igt@kms_flip_event_leak@basic=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +5 other tests dmesg-warn=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel =
XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#229=
3</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-2/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp=
-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-2/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp=
-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
drrs-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
sr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-dg2-434/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"=
>Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-2/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-dg2-434/igt@kms_joiner@basic-max-non-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_plane_multiple@2x-=
tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@kms_pl=
ane_scaling@plane-scaler-unity-scaling-with-rotation.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg=
2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_pm_backlight@fade-with-su=
spend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_pm_dc@dc5-retention-flop=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-=
stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_psr2_su@page_flip-p010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_psr2_su@page_flip-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-dg2-434/igt@kms_psr@fbc-pr-cursor-blt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_psr@pr-cursor-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@kms_psr@psr-sprite-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_psr_stress_test@invalida=
te-primary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@kms_rotation_crc@bad-pixel-f=
ormat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-4/igt@kms_setm=
ode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_setmode@clone-ex=
clusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-lnl-1/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149506v1/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear=
-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_eudebug@basic-vm-access-f=
aultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-meta=
data-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_evict@evict-small-externa=
l-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommi=
t-standalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-d=
g2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_exec_fault_mode@twice-reb=
ind-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-new:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_exec_system_allocator@onc=
e-large-new.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4915">Intel XE#4915</a>) +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-dg2-436/igt@xe_exec_system_allocator@th=
reads-many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +110 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-mmap-free-huge.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943=
</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-lnl-4/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
06v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-=
new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-remap-dontunmap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-dg2-434/igt@xe_exec_system_allocator@tw=
ice-mmap-remap-dontunmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_mi=
grate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">In=
tel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_oa@invalid-create-userspa=
ce-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_pm@d3cold-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-lnl-4/igt@xe_pm@s4=
-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149506v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">In=
tel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@xe_pmu@all-fn-engine-activity=
-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_pxp@pxp-stale-bo-exec-pos=
t-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-exec-post=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_query@multigpu-query-uc-f=
w-version-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-2/igt@xe_sriov_auto_provisioning@se=
lfconfig-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149506v1/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@xe_vm@=
munmap-style-unbind-many-all.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-436/igt@xe_vm@munmap-s=
tyle-unbind-many-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-one-partial:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@xe_vm@mu=
nmap-style-unbind-one-partial.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-7/igt@xe_vm@munmap-st=
yle-unbind-one-partial.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-3/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">I=
ntel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149506v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-ro=
tate-0-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2=
-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-7/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> +2 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/s=
hard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">=
PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149506v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@cd-hdmi-a6-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shar=
d-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-464/igt@kms_fl=
ip@flip-vs-expired-vblank@c-dp4.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/sha=
rd-dg2-434/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">PASS</a> +3 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@kms_flip=
@flip-vs-expired-vblank@d-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-7/i=
gt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-lnl-8/igt@kms_flip=
@plain-flip-ts-check@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-lnl-1/igt@kms_f=
lip@plain-flip-ts-check@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-9/igt@kms_fli=
p@wf_vblank-ts-check@a-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-1/igt@k=
ms_flip@wf_vblank-ts-check@a-hdmi-a1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-8/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel X=
E#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149506v1/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.ht=
ml">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-7/igt@kms_vrr@negative=
-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-rebind.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-464/igt@=
xe_exec_basic@multigpu-once-rebind.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@kms_as=
ync_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4912">Intel XE#4912</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard=
-dg2-436/igt@kms_async_flips@async-flip-suspend-resume.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@kms_bw=
@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-43=
6/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@kms_cont=
ent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-bmg-7/igt@kms_=
content_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149506v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
06v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v=
1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel=
 XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149506v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
06v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
06v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@kms_ps=
r@fbc-pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-436/=
igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@kms_ti=
led_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-463/=
igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@kms_tv=
_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-436/igt@kms_tv=
_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-435/igt@xe_exe=
c_system_allocator@threads-many-stride-mmap.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/sha=
rd-dg2-436/igt@xe_exec_system_allocator@threads-many-stride-mmap.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-ad=
lp-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/sha=
rd-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8b=
a/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb94=
0de8ba/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f5362=
2fb940de8ba/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93=
f53622fb940de8ba/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d7=
4cb93f53622fb940de8ba/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4=
d19d74cb93f53622fb940de8ba/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34=
ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba4=
72d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144=
-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-3/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-9/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-3/igt@xe_mod=
ule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-9=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-a=
dlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/sh=
ard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8=
ba/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb9=
40de8ba/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74cb93f536=
22fb940de8ba/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d19d74c=
b93f53622fb940de8ba/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab7f4d1=
9d74cb93f53622fb940de8ba/shard-adlp-8/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472d34ab=
7f4d19d74cb93f53622fb940de8ba/shard-adlp-4/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3144-1ba472=
d34ab7f4d19d74cb93f53622fb940de8ba/shard-adlp-4/igt@xe_module_load@load.htm=
l">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/378">Intel XE#378</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-8/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149506v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard=
-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149506v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149506v1/shard-adlp-4/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/=
shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-9/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149506v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1495=
06v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149506v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-a=
dlp-1/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-3/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149506v1/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149506v1/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/sh=
ard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149506v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-adlp-6/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149506v1/shard-adlp-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149506=
v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba/shard-dg2-463/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149506v1/shard-dg2-432/igt@xe_peer2peer@read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba -&gt; xe-pw-149=
506v1</li>
</ul>
<p>IGT_8380: 8380<br />
  xe-3144-1ba472d34ab7f4d19d74cb93f53622fb940de8ba: 1ba472d34ab7f4d19d74cb9=
3f53622fb940de8ba<br />
  xe-pw-149506v1: 149506v1</p>

</body>
</html>

--===============7089167808328062947==--
