Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F587C79FA0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 09:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E063510E0DC;
	Tue,  8 Sep 2026 09:37:26 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37F410E0DC;
 Tue,  8 Sep 2026 09:37:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8351361853329279079=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/debugfs=3A_Expose_p?=
 =?utf-8?q?er-engine_idle_status_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Sep 2026 09:37:25 -0000
Message-ID: <178886024584.134370.2298518241891756752@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908060103.999079-2-sk.anirban@intel.com>
In-Reply-To: <20260908060103.999079-2-sk.anirban@intel.com>
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

--===============8351361853329279079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/debugfs: Expose per-engine idle status (rev4)
URL   : https://patchwork.freedesktop.org/series/168204/
State : success

== Summary ==

CI Bug Log - changes from xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7_FULL -> xe-pw-168204v4_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-168204v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@read:
    - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#2134])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@fbdev@read.html

  * igt@kms_3d@basic:
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#6011])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_3d@basic.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1466])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1407]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#7059] / [Intel XE#7085])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> ([SKIP][6], [SKIP][7]) ([Intel XE#1407])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> ([SKIP][8], [SKIP][9]) ([Intel XE#1124]) +2 other tests ( 2 skip )
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1428] / [Intel XE#7387])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#8365])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#367]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-lnl:          NOTRUN -> ([SKIP][14], [SKIP][15]) ([Intel XE#8365])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> ([SKIP][16], [SKIP][17]) ([Intel XE#2887]) +3 other tests ( 2 skip )
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2669] / [Intel XE#7389]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][20] -> ([INCOMPLETE][21], [INCOMPLETE][22]) ([Intel XE#7084] / [Intel XE#8150]) +1 other test ( 2 incomplete )
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#3432])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#4417] / [Intel XE#5447]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-lnl:          NOTRUN -> ([SKIP][25], [SKIP][26]) ([Intel XE#306] / [Intel XE#7358])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_chamelium_color@ctm-0-75.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#306] / [Intel XE#7358])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#7358]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#373]) +9 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-lnl:          NOTRUN -> ([SKIP][30], [SKIP][31]) ([Intel XE#373]) +1 other test ( 2 skip )
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#6507])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_color@ctm-blue-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#3297]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-lnl:          [PASS][34] -> ([PASS][35], [SKIP][36]) ([Intel XE#7006])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#6974])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#7642])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-lnl:          NOTRUN -> ([SKIP][39], [SKIP][40]) ([Intel XE#7642])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_content_protection@uevent-hdcp14.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-lnl:          NOTRUN -> ([SKIP][41], [SKIP][42]) ([Intel XE#1424])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-lnl:          [PASS][43] -> ([SKIP][44], [PASS][45]) ([Intel XE#9125]) +12 other tests ( 1 pass, 1 skip )
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-lnl:          NOTRUN -> ([SKIP][46], [SKIP][47]) ([Intel XE#2321] / [Intel XE#7355])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1424]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_edge_walk@256x256-right-edge:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#9125]) +92 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_cursor_edge_walk@256x256-right-edge.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#309] / [Intel XE#7343]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          NOTRUN -> ([SKIP][52], [SKIP][53]) ([Intel XE#323] / [Intel XE#6035])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#8265]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          NOTRUN -> ([SKIP][55], [SKIP][56]) ([Intel XE#8265])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#702] / [Intel XE#7344])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@dsc:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#8586])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_feature_discovery@dsc.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1421]) +10 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> ([SKIP][60], [SKIP][61]) ([Intel XE#1421]) +2 other tests ( 2 skip )
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2482]) +7 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][63] -> ([SKIP][64], [PASS][65]) ([Intel XE#2482]) +1 other test ( 1 pass, 1 skip )
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> ([SKIP][66], [SKIP][67]) ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) +1 other test ( 2 skip )
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> ([SKIP][68], [SKIP][69]) ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144]) +1 other test ( 2 skip )
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1745] / [Intel XE#9144]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7178] / [Intel XE#7351]) +5 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#7179])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#352])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> ([SKIP][75], [SKIP][76]) ([Intel XE#6312] / [Intel XE#651])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          [PASS][77] -> ([PASS][78], [SKIP][79]) ([Intel XE#7779])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> ([SKIP][81], [SKIP][82]) ([Intel XE#6312]) +2 other tests ( 2 skip )
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> ([SKIP][83], [SKIP][84]) ([Intel XE#7061] / [Intel XE#7356]) +1 other test ( 2 skip )
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1469] / [Intel XE#7399])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#7905]) +21 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#7061])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#6312]) +8 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-lnl:          NOTRUN -> ([SKIP][90], [SKIP][91]) ([Intel XE#7399])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][92], [SKIP][93]) ([Intel XE#7865]) +6 other tests ( 2 skip )
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> ([SKIP][94], [SKIP][95]) ([Intel XE#7061]) +2 other tests ( 2 skip )
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          [PASS][96] -> ([PASS][97], [SKIP][98]) ([Intel XE#2548] / [Intel XE#7779]) +4 other tests ( 1 pass, 1 skip )
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> ([SKIP][99], [SKIP][100]) ([Intel XE#656] / [Intel XE#7905]) +8 other tests ( 2 skip )
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#7865]) +14 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> ([SKIP][102], [SKIP][103]) ([Intel XE#7905]) +9 other tests ( 2 skip )
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#7779]) +79 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#656] / [Intel XE#7905]) +16 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#2548] / [Intel XE#7779]) +47 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1470] / [Intel XE#2853])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> ([SKIP][108], [SKIP][109]) ([Intel XE#3374] / [Intel XE#3544])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_hdr@brightness-with-hdr.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_invalid_mode@bad-vsync-start:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#2568])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_invalid_mode@bad-vsync-start.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#6900] / [Intel XE#7362])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#6901])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#8348])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#7283]) +5 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#8303]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#599] / [Intel XE#7382]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#4596] / [Intel XE#5854])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          NOTRUN -> ([SKIP][118], [SKIP][119]) ([Intel XE#5020] / [Intel XE#7348])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_plane_multiple@tiling-yf.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#7687] / [Intel XE#9125])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-lnl:          [PASS][121] -> ([PASS][122], [SKIP][123]) ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +1 other test ( 1 pass, 1 skip )
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +7 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#2763] / [Intel XE#6886]) +15 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#870])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#7643])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#4886])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#9129]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#2893] / [Intel XE#7304]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#4608])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#4608] / [Intel XE#7304])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1489]) +5 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> ([SKIP][135], [SKIP][136]) ([Intel XE#2893] / [Intel XE#7304]) +1 other test ( 2 skip )
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-lnl:          [PASS][137] -> ([PASS][138], [SKIP][139]) ([Intel XE#1489])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1406] / [Intel XE#7345]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-lnl:          NOTRUN -> ([SKIP][141], [SKIP][142]) ([Intel XE#1406] / [Intel XE#7345])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-dpms@edp-1:
    - shard-lnl:          NOTRUN -> ([SKIP][143], [SKIP][144]) ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms@edp-1.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_psr@fbc-psr2-dpms@edp-1.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#1406])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-lnl:          [PASS][148] -> ([PASS][149], [SKIP][150]) ([Intel XE#2850] / [Intel XE#929]) +1 other test ( 1 pass, 1 skip )
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_psr@psr2-sprite-blt.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_psr@psr2-sprite-blt.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          NOTRUN -> ([SKIP][151], [SKIP][152]) ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_rotation_crc@primary-rotation-90.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#1435] / [Intel XE#9142])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#1499])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_vrr@negative-basic.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#1091] / [Intel XE#2849])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#8866])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html

  * igt@xe_ccs@vm-bind-fault-mode-decompress:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#7644])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_ccs@vm-bind-fault-mode-decompress.html

  * igt@xe_compute_preempt@compute-preempt-many-vram:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#5191] / [Intel XE#7316] / [Intel XE#7346])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_compute_preempt@compute-preempt-many-vram.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#1062] / [Intel XE#7318] / [Intel XE#7457])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@xe_create@create-big-vram.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#7319] / [Intel XE#7350] / [Intel XE#944])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#8608])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][162] -> ([INCOMPLETE][163], [INCOMPLETE][164]) ([Intel XE#6321] / [Intel XE#8355])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#6540] / [Intel XE#688]) +14 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> ([SKIP][166], [SKIP][167]) ([Intel XE#6540] / [Intel XE#688]) +2 other tests ( 2 skip )
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#7482]) +22 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_exec_balancer@no-exec-cm-parallel-rebind.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:
    - shard-lnl:          NOTRUN -> ([SKIP][169], [SKIP][170]) ([Intel XE#7482]) +4 other tests ( 2 skip )
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-lnl:          NOTRUN -> ([SKIP][171], [SKIP][172]) ([Intel XE#1392]) +2 other tests ( 2 skip )
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#1392]) +11 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm:
    - shard-lnl:          NOTRUN -> ([SKIP][174], [SKIP][175]) ([Intel XE#8374]) +4 other tests ( 2 skip )
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#8374]) +17 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_exec_fault_mode@many-multi-queue-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:
    - shard-lnl:          NOTRUN -> [SKIP][177] ([Intel XE#9003])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html

  * igt@xe_exec_multi_queue@many-execs-priority:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#8364]) +34 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_exec_multi_queue@many-execs-priority.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:
    - shard-lnl:          NOTRUN -> ([SKIP][179], [SKIP][180]) ([Intel XE#8364]) +6 other tests ( 2 skip )
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html

  * igt@xe_exec_reset@multi-queue-cancel-on-secondary:
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#8369]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_exec_reset@multi-queue-cancel-on-secondary.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:
    - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#6196]) +1 other test skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-bmg:          [PASS][183] -> ([FAIL][184], [PASS][185]) ([Intel XE#9096]) +1 other test ( 1 fail, 1 pass )
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-10/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#8378]) +11 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic:
    - shard-lnl:          NOTRUN -> ([SKIP][187], [SKIP][188]) ([Intel XE#8378]) +1 other test ( 2 skip )
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#2833])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_madvise@atomic-global:
    - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#7980])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_madvise@atomic-global.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_multigpu_svm@mgpu-coherency-basic:
    - shard-lnl:          NOTRUN -> ([SKIP][192], [SKIP][193]) ([Intel XE#6964])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_multigpu_svm@mgpu-coherency-basic.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_multigpu_svm@mgpu-coherency-basic.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][194] ([Intel XE#6964]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_noexec_ping_pong@basic:
    - shard-lnl:          NOTRUN -> ([SKIP][195], [SKIP][196]) ([Intel XE#6259] / [Intel XE#7324] / [Intel XE#7406])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_noexec_ping_pong@basic.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_noexec_ping_pong@basic.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][197] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_page_reclaim@pat-index-xd:
    - shard-lnl:          NOTRUN -> [SKIP][198] ([Intel XE#7793]) +3 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_page_reclaim@pat-index-xd.html

  * igt@xe_page_reclaim@random:
    - shard-lnl:          NOTRUN -> ([SKIP][199], [SKIP][200]) ([Intel XE#7793])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_page_reclaim@random.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_page_reclaim@random.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-lnl:          NOTRUN -> [FAIL][201] ([Intel XE#7695])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          NOTRUN -> [SKIP][202] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3hot-i2c:
    - shard-lnl:          NOTRUN -> [SKIP][203] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][204] ([Intel XE#584] / [Intel XE#7369]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> ([SKIP][205], [SKIP][206]) ([Intel XE#584] / [Intel XE#7369])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_pm@s3-vm-bind-prefetch.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][207] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-lnl:          NOTRUN -> [SKIP][208] ([Intel XE#944]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled:
    - shard-lnl:          NOTRUN -> [SKIP][209] ([Intel XE#7174]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled.html

  * igt@xe_sriov_admin@bulk-preempt-timeout-vfs-disabled:
    - shard-lnl:          NOTRUN -> ([SKIP][210], [SKIP][211]) ([Intel XE#7174])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_sriov_admin@bulk-preempt-timeout-vfs-disabled.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_sriov_admin@bulk-preempt-timeout-vfs-disabled.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-lnl:          NOTRUN -> [SKIP][212] ([Intel XE#4130] / [Intel XE#7366]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_vfio@open-basic:
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#7724])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_sriov_vfio@open-basic.html

  * igt@xe_survivability@i2c-functionality:
    - shard-lnl:          NOTRUN -> [SKIP][214] ([Intel XE#8415])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_survivability@i2c-functionality.html

  * igt@xe_vm@out-of-memory:
    - shard-lnl:          NOTRUN -> [SKIP][215] ([Intel XE#5745] / [Intel XE#7892])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@xe_vm@out-of-memory.html

  * igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:
    - shard-lnl:          NOTRUN -> ([SKIP][216], [SKIP][217]) ([Intel XE#7892])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:
    - shard-lnl:          NOTRUN -> [SKIP][218] ([Intel XE#7892])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html

  
#### Possible fixes ####

  * igt@kms_cursor_crc@cursor-tearing-position-change:
    - shard-lnl:          [SKIP][219] ([Intel XE#9125]) -> [PASS][220] +14 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_cursor_crc@cursor-tearing-position-change.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_cursor_crc@cursor-tearing-position-change.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-lnl:          [SKIP][221] ([Intel XE#2482]) -> [PASS][222] +1 other test pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:
    - shard-lnl:          [SKIP][223] ([Intel XE#1745] / [Intel XE#9144]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - shard-lnl:          [SKIP][225] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][226] +3 other tests pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][227] ([Intel XE#1503]) -> ([PASS][228], [PASS][229])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping:
    - shard-lnl:          [SKIP][230] ([Intel XE#7250] / [Intel XE#9128]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a:
    - shard-lnl:          [SKIP][232] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][233] +1 other test pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c:
    - shard-lnl:          [SKIP][234] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][235] +1 other test pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-lnl:          [SKIP][236] ([Intel XE#7106]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_pm_rpm@drm-resources-equal.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [SKIP][238] ([Intel XE#1489]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-lnl:          [SKIP][240] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][241] +1 other test pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr@psr2-cursor-plane-onoff.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_psr@psr2-cursor-plane-onoff.html

  
#### Warnings ####

  * igt@fbdev@info:
    - shard-lnl:          [SKIP][242] ([Intel XE#2134]) -> ([PASS][243], [SKIP][244]) ([Intel XE#2134]) +1 other test ( 1 pass, 1 skip )
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@fbdev@info.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@fbdev@info.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@fbdev@info.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-lnl:          [SKIP][245] ([Intel XE#1407]) -> ([SKIP][246], [SKIP][247]) ([Intel XE#1407] / [Intel XE#9125]) +1 other test ( 2 skip )
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-lnl:          [SKIP][248] ([Intel XE#9125]) -> ([SKIP][249], [SKIP][250]) ([Intel XE#1407] / [Intel XE#9125]) +1 other test ( 2 skip )
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [SKIP][251] ([Intel XE#9125]) -> ([SKIP][252], [SKIP][253]) ([Intel XE#7059] / [Intel XE#7085] / [Intel XE#9125])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          [SKIP][254] ([Intel XE#1124]) -> ([SKIP][255], [SKIP][256]) ([Intel XE#1124] / [Intel XE#9125]) +2 other tests ( 2 skip )
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          [SKIP][257] ([Intel XE#9125]) -> [SKIP][258] ([Intel XE#1124]) +2 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [SKIP][259] ([Intel XE#9125]) -> ([SKIP][260], [SKIP][261]) ([Intel XE#1124] / [Intel XE#9125]) +4 other tests ( 2 skip )
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          [SKIP][262] ([Intel XE#7679]) -> ([SKIP][263], [SKIP][264]) ([Intel XE#7679] / [Intel XE#9125])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][265] ([Intel XE#9125]) -> [SKIP][266] ([Intel XE#7679])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][267] ([Intel XE#9125]) -> ([SKIP][268], [SKIP][269]) ([Intel XE#367] / [Intel XE#9125])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
    - shard-lnl:          [SKIP][270] ([Intel XE#9125]) -> [SKIP][271] ([Intel XE#367])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          [SKIP][272] ([Intel XE#2887]) -> ([SKIP][273], [SKIP][274]) ([Intel XE#2887] / [Intel XE#9125]) +3 other tests ( 2 skip )
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][275] ([Intel XE#9125]) -> ([SKIP][276], [SKIP][277]) ([Intel XE#2669] / [Intel XE#7389] / [Intel XE#9125])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          [SKIP][278] ([Intel XE#3432]) -> ([SKIP][279], [SKIP][280]) ([Intel XE#3432] / [Intel XE#9125])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          [SKIP][281] ([Intel XE#9125]) -> ([SKIP][282], [SKIP][283]) ([Intel XE#3432] / [Intel XE#9125]) +1 other test ( 2 skip )
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-lnl:          [SKIP][284] ([Intel XE#9125]) -> [SKIP][285] ([Intel XE#2887]) +3 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-lnl:          [SKIP][286] ([Intel XE#9125]) -> ([SKIP][287], [SKIP][288]) ([Intel XE#2887] / [Intel XE#9125]) +5 other tests ( 2 skip )
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          [SKIP][289] ([Intel XE#9125]) -> ([SKIP][290], [SKIP][291]) ([Intel XE#7008] / [Intel XE#9125])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_cdclk@mode-transition-all-outputs.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_color@ctm-0-75:
    - shard-lnl:          [SKIP][292] ([Intel XE#3297]) -> ([PASS][293], [SKIP][294]) ([Intel XE#3297])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_color@ctm-0-75.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_color@ctm-0-75.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_color@ctm-0-75.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-lnl:          [SKIP][295] ([Intel XE#7006]) -> ([SKIP][296], [PASS][297]) ([Intel XE#7006])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_content_protection@content-type-change:
    - shard-lnl:          [SKIP][298] ([Intel XE#9125]) -> [SKIP][299] ([Intel XE#7642]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_content_protection@content-type-change.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          [SKIP][300] ([Intel XE#307] / [Intel XE#6974]) -> ([SKIP][301], [SKIP][302]) ([Intel XE#307] / [Intel XE#6974] / [Intel XE#9125])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_content_protection@dp-mst-lic-type-1.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-1.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-1:
    - shard-lnl:          [SKIP][303] ([Intel XE#9125]) -> ([SKIP][304], [SKIP][305]) ([Intel XE#7642] / [Intel XE#9125]) +2 other tests ( 2 skip )
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_content_protection@lic-type-1.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_content_protection@lic-type-1.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          [SKIP][306] ([Intel XE#9125]) -> [SKIP][307] ([Intel XE#2321] / [Intel XE#7355])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-lnl:          [SKIP][308] ([Intel XE#9125]) -> ([SKIP][309], [SKIP][310]) ([Intel XE#2321] / [Intel XE#7355] / [Intel XE#9125]) +1 other test ( 2 skip )
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-lnl:          [SKIP][311] ([Intel XE#9125]) -> [SKIP][312] ([Intel XE#1424])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_cursor_crc@cursor-random-32x10.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-lnl:          [SKIP][313] ([Intel XE#9125]) -> ([SKIP][314], [SKIP][315]) ([Intel XE#1424] / [Intel XE#9125])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          [SKIP][316] ([Intel XE#9125]) -> ([SKIP][317], [SKIP][318]) ([Intel XE#309] / [Intel XE#7343] / [Intel XE#9125])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][319] ([Intel XE#309] / [Intel XE#7343]) -> ([SKIP][320], [SKIP][321]) ([Intel XE#309] / [Intel XE#7343] / [Intel XE#9125]) +1 other test ( 2 skip )
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][322] ([Intel XE#9125]) -> [SKIP][323] ([Intel XE#309] / [Intel XE#7343])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          [SKIP][324] ([Intel XE#1508]) -> ([SKIP][325], [SKIP][326]) ([Intel XE#1508] / [Intel XE#9125])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-lnl:          [SKIP][327] ([Intel XE#9125]) -> [SKIP][328] ([Intel XE#4331] / [Intel XE#7227])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-lnl:          [SKIP][329] ([Intel XE#9125]) -> ([SKIP][330], [SKIP][331]) ([Intel XE#8265] / [Intel XE#9125]) +1 other test ( 2 skip )
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:
    - shard-lnl:          [SKIP][332] ([Intel XE#8265]) -> ([SKIP][333], [SKIP][334]) ([Intel XE#8265] / [Intel XE#9125])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-lnl:          [SKIP][335] ([Intel XE#9125]) -> [SKIP][336] ([Intel XE#8265])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-lnl:          [SKIP][337] ([Intel XE#9127]) -> ([PASS][338], [SKIP][339]) ([Intel XE#9127])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_fbcon_fbt@fbc.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [SKIP][340] ([Intel XE#8680]) -> ([PASS][341], [SKIP][342]) ([Intel XE#8680])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr2:
    - shard-lnl:          [SKIP][343] ([Intel XE#1135] / [Intel XE#6128]) -> ([SKIP][344], [PASS][345]) ([Intel XE#1135] / [Intel XE#6128])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_feature_discovery@psr2.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_feature_discovery@psr2.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          [SKIP][346] ([Intel XE#2482]) -> ([SKIP][347], [PASS][348]) ([Intel XE#2482]) +3 other tests ( 1 pass, 1 skip )
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          [SKIP][349] ([Intel XE#1745] / [Intel XE#9144]) -> ([SKIP][350], [SKIP][351]) ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-lnl:          [SKIP][352] ([Intel XE#9144]) -> ([SKIP][353], [PASS][354]) ([Intel XE#9144])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          [SKIP][355] ([Intel XE#2548] / [Intel XE#7779]) -> ([SKIP][356], [SKIP][357]) ([Intel XE#2548] / [Intel XE#6312] / [Intel XE#651] / [Intel XE#7779]) +6 other tests ( 2 skip )
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][358] ([Intel XE#7061] / [Intel XE#7356]) -> ([SKIP][359], [SKIP][360]) ([Intel XE#7061] / [Intel XE#7356] / [Intel XE#7779]) +1 other test ( 2 skip )
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          [SKIP][361] ([Intel XE#6312]) -> ([SKIP][362], [SKIP][363]) ([Intel XE#6312] / [Intel XE#7779]) +3 other tests ( 2 skip )
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-rte:
    - shard-lnl:          [SKIP][364] ([Intel XE#7779]) -> [SKIP][365] ([Intel XE#6312]) +2 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-rte.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@drrshdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][366] ([Intel XE#2548] / [Intel XE#7779]) -> ([SKIP][367], [SKIP][368]) ([Intel XE#2548] / [Intel XE#656] / [Intel XE#7779] / [Intel XE#7905]) +17 other tests ( 2 skip )
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-lnl:          [SKIP][369] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][370] ([Intel XE#656] / [Intel XE#7905]) +10 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-lnl:          [SKIP][371] ([Intel XE#656] / [Intel XE#7905]) -> ([SKIP][372], [SKIP][373]) ([Intel XE#2548] / [Intel XE#656] / [Intel XE#7779] / [Intel XE#7905]) +8 other tests ( 2 skip )
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          [SKIP][374] ([Intel XE#6312] / [Intel XE#651]) -> ([SKIP][375], [SKIP][376]) ([Intel XE#2548] / [Intel XE#6312] / [Intel XE#651] / [Intel XE#7779]) +3 other tests ( 2 skip )
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-lnl:          [SKIP][377] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][378] ([Intel XE#6312] / [Intel XE#651]) +3 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          [SKIP][379] ([Intel XE#7779]) -> ([SKIP][380], [SKIP][381]) ([Intel XE#6312] / [Intel XE#7779]) +7 other tests ( 2 skip )
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          [SKIP][382] ([Intel XE#7779]) -> ([SKIP][383], [SKIP][384]) ([Intel XE#7779] / [Intel XE#7865]) +11 other tests ( 2 skip )
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          [SKIP][385] ([Intel XE#7779]) -> [SKIP][386] ([Intel XE#7865]) +4 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][387] ([Intel XE#7779]) -> [SKIP][388] ([Intel XE#7905]) +12 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          [SKIP][389] ([Intel XE#7905]) -> ([SKIP][390], [SKIP][391]) ([Intel XE#7779] / [Intel XE#7905]) +12 other tests ( 2 skip )
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-lnl:          [SKIP][392] ([Intel XE#7399]) -> ([SKIP][393], [SKIP][394]) ([Intel XE#7399] / [Intel XE#7779])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][395] ([Intel XE#7779]) -> ([PASS][396], [SKIP][397]) ([Intel XE#7779]) +1 other test ( 1 pass, 1 skip )
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:
    - shard-lnl:          [SKIP][398] ([Intel XE#7779]) -> ([SKIP][399], [SKIP][400]) ([Intel XE#7061] / [Intel XE#7356] / [Intel XE#7779]) +1 other test ( 2 skip )
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:
    - shard-lnl:          [SKIP][401] ([Intel XE#7779]) -> [SKIP][402] ([Intel XE#7061] / [Intel XE#7356])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-lnl:          [SKIP][403] ([Intel XE#2548] / [Intel XE#7779]) -> ([SKIP][404], [PASS][405]) ([Intel XE#2548] / [Intel XE#7779]) +11 other tests ( 1 pass, 1 skip )
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][406] ([Intel XE#7779]) -> ([SKIP][407], [SKIP][408]) ([Intel XE#7779] / [Intel XE#7905]) +22 other tests ( 2 skip )
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          [SKIP][409] ([Intel XE#7865]) -> ([SKIP][410], [SKIP][411]) ([Intel XE#7779] / [Intel XE#7865]) +1 other test ( 2 skip )
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-render.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-render.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][412] ([Intel XE#7779]) -> ([SKIP][413], [SKIP][414]) ([Intel XE#7061] / [Intel XE#7779]) +2 other tests ( 2 skip )
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
    - shard-lnl:          [SKIP][415] ([Intel XE#7061]) -> ([SKIP][416], [SKIP][417]) ([Intel XE#7061] / [Intel XE#7779]) +1 other test ( 2 skip )
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][418] ([Intel XE#7779]) -> [SKIP][419] ([Intel XE#7061]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][420] ([Intel XE#3544]) -> ([SKIP][421], [SKIP][422]) ([Intel XE#3374] / [Intel XE#3544])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          [SKIP][423] ([Intel XE#9125]) -> ([SKIP][424], [SKIP][425]) ([Intel XE#1503] / [Intel XE#9125]) +1 other test ( 2 skip )
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_hdr@invalid-metadata-sizes.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_hdr@invalid-metadata-sizes.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          [SKIP][426] ([Intel XE#1503]) -> ([SKIP][427], [SKIP][428]) ([Intel XE#1503] / [Intel XE#9125])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_hdr@static-toggle.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_hdr@static-toggle.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_hdr@static-toggle.html

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - shard-lnl:          [SKIP][429] ([Intel XE#7250] / [Intel XE#9128]) -> ([SKIP][430], [PASS][431]) ([Intel XE#7250] / [Intel XE#9128])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-modifier.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-modifier.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_plane@pixel-format-4-tiled-modifier.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [SKIP][432] ([Intel XE#9128]) -> ([SKIP][433], [PASS][434]) ([Intel XE#9128])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plane@plane-position-hole.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plane@plane-position-hole.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [SKIP][435] ([Intel XE#9125]) -> ([PASS][436], [SKIP][437]) ([Intel XE#9125]) +28 other tests ( 1 pass, 1 skip )
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plane_cursor@primary.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_plane_cursor@primary.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          [SKIP][438] ([Intel XE#9125]) -> ([SKIP][439], [SKIP][440]) ([Intel XE#599] / [Intel XE#9125])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plane_lowres@tiling-yf.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_plane_lowres@tiling-yf.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-lnl:          [SKIP][441] ([Intel XE#7343] / [Intel XE#7687] / [Intel XE#9125]) -> ([SKIP][442], [SKIP][443]) ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7687] / [Intel XE#9125])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-lnl:          [SKIP][444] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [SKIP][445] ([Intel XE#2763] / [Intel XE#6886]) +1 other test skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-lnl:          [SKIP][446] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> ([PASS][447], [SKIP][448]) ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +3 other tests ( 1 pass, 1 skip )
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b:
    - shard-lnl:          [SKIP][449] ([Intel XE#2763] / [Intel XE#6886]) -> ([PASS][450], [SKIP][451]) ([Intel XE#2763] / [Intel XE#6886]) +3 other tests ( 1 pass, 1 skip )
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-lnl:          [SKIP][452] ([Intel XE#870]) -> ([PASS][453], [SKIP][454]) ([Intel XE#870])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_pm_backlight@fade.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_pm_backlight@fade.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][455] ([Intel XE#8399]) -> ([FAIL][456], [PASS][457]) ([Intel XE#8399])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          [SKIP][458] ([Intel XE#1489]) -> [SKIP][459] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          [SKIP][460] ([Intel XE#1489]) -> ([SKIP][461], [SKIP][462]) ([Intel XE#1489] / [Intel XE#2893] / [Intel XE#7304]) +2 other tests ( 2 skip )
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-lnl:          [SKIP][463] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) -> ([SKIP][464], [SKIP][465]) ([Intel XE#1489] / [Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          [SKIP][466] ([Intel XE#1489]) -> ([SKIP][467], [SKIP][468]) ([Intel XE#1489] / [Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          [SKIP][469] ([Intel XE#2850] / [Intel XE#929]) -> ([SKIP][470], [SKIP][471]) ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests ( 2 skip )
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-lnl:          [SKIP][472] ([Intel XE#1406]) -> ([SKIP][473], [SKIP][474]) ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_psr@fbc-pr-primary-blt.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_psr@fbc-pr-primary-blt.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-lnl:          [SKIP][475] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][476] ([Intel XE#1406])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-plane-move.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-lnl:          [SKIP][477] ([Intel XE#2850] / [Intel XE#929]) -> ([SKIP][478], [SKIP][479]) ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#7345] / [Intel XE#929])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-blt.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_psr@fbc-psr2-primary-blt.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-lnl:          [SKIP][480] ([Intel XE#2850] / [Intel XE#929]) -> ([PASS][481], [SKIP][482]) ([Intel XE#2850] / [Intel XE#929]) +2 other tests ( 1 pass, 1 skip )
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr@psr2-sprite-render.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr@psr2-sprite-render.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          [SKIP][483] ([Intel XE#9125]) -> ([SKIP][484], [SKIP][485]) ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342] / [Intel XE#9125]) +2 other tests ( 2 skip )
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_rotation_crc@bad-tiling.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][486] ([Intel XE#1127] / [Intel XE#5813]) -> ([SKIP][487], [SKIP][488]) ([Intel XE#1127] / [Intel XE#5813] / [Intel XE#9125])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][489] ([Intel XE#2426] / [Intel XE#5848]) -> ([SKIP][490], [FAIL][491]) ([Intel XE#1729] / [Intel XE#2426] / [Intel XE#5848] / [Intel XE#7424])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][492] ([Intel XE#2426] / [Intel XE#5848]) -> ([SKIP][493], [SKIP][494]) ([Intel XE#2426] / [Intel XE#2509] / [Intel XE#5848] / [Intel XE#7437])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-lnl:          [SKIP][495] ([Intel XE#9125]) -> [SKIP][496] ([Intel XE#8397])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_vrr@lobf-dc3co.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_vrr@lobf-dc3co.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          [SKIP][497] ([Intel XE#1499]) -> ([SKIP][498], [SKIP][499]) ([Intel XE#1499] / [Intel XE#9125])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-vrr.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-vrr.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][500] ([Intel XE#6321] / [Intel XE#8355]) -> ([INCOMPLETE][501], [PASS][502]) ([Intel XE#6321] / [Intel XE#8355])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [DMESG-WARN][503] ([Intel XE#8963]) -> ([ABORT][504], [ABORT][505]) ([Intel XE#8591] / [Intel XE#8963])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-7/igt@xe_wedged@basic-wedged.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-7/igt@xe_wedged@basic-wedged.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-1/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5447
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6011]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7008
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7316
  [Intel XE#7318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7318
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7324
  [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7346
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7406
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7643]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7643
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7724
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8866
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9003]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127
  [Intel XE#9128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128
  [Intel XE#9129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9129
  [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7 -> xe-pw-168204v4

  IGT_9085: 9085
  xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7: 8968c3fbc95e850342a9316f74df831afc2376b7
  xe-pw-168204v4: 168204v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/index.html

--===============8351361853329279079==
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
<tr><td><b>Series:</b></td><td>drm/xe/debugfs: Expose per-engine idle statu=
s (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/168204/">https://patchwork.freedesktop.org/series/168204/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-168204v4/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-168204v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5702-8968c3fbc95e850342a9316f74df831af=
c2376b7_FULL -&gt; xe-pw-168204v4_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168204v4_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@fbdev@read.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE=
#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_3d@basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_3d@basic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011">Intel =
XE#6011</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_big_fb@linear-max-hw-stri=
de-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rot=
ate-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-168204v4/shard-lnl-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
7">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rot=
ate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-168204v4/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1428">Intel XE#1428</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_bw@linear-tiling-2-displa=
ys-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_bw@linear-tiling-4-displ=
ays-target-2560x1440p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_bw@linear-tiling-4-displ=
ays-target-2560x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_ccs@bad-rotation-90-y-ti=
led-gen12-rc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_ccs@bad-rotation-90-y-tiled-g=
en12-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-t=
iled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-6/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-2/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE=
#8150</a>) +1 other test ( 2 incomplete )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_cdclk@mode-transition@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4417">Intel XE#4417</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5447">Intel XE#5447</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_chamelium_color@ctm-0-75=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-168204v4/shard-lnl-7/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#3=
06</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/735=
8">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_chamelium_color@ctm-red-t=
o-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_chamelium_color_pipeline@=
plane-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_chamelium_frames@hdmi-crc=
-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-s=
torm-disable.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disa=
ble.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_chamelium_sharpness_filte=
r@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_color@ctm-blue-to-red.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3297">Intel XE#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_colo=
r_pipeline@plane-lut1d-post-ctm3x4.html">PASS</a> -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_color=
_pipeline@plane-lut1d-post-ctm3x4.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_color_pipeli=
ne@plane-lut1d-post-ctm3x4.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_content_protection@dp-mst=
-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_content_protection@srm.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_content_protection@ueven=
t-hdcp14.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-168204v4/shard-lnl-3/igt@kms_content_protection@uevent-hdcp14.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_cursor_crc@cursor-offscr=
een-max-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-max-s=
ize.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_curs=
or_crc@cursor-onscreen-64x64.html">PASS</a> -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_cursor_crc@=
cursor-onscreen-64x64.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_cursor_crc@cursor-onscre=
en-64x64.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9125">Intel XE#9125</a>) +12 other tests ( 1 pass, 1 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-=
movement-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movem=
ent-512x512.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding=
-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-right-edge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_cursor_edge_walk@256x256-=
right-edge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/9125">Intel XE#9125</a>) +92 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_cursor_legacy@2x-nonblock=
ing-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-toggle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_cursor_legacy@short=
-busy-flip-before-cursor-toggle.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-ultrajoi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_dsc@dsc-with-output-form=
ats-with-bpc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_dsc@dsc-with-output-formats-with-=
bpc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_feature_discovery@display=
-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/702">Intel XE#702</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_feature_discovery@dsc.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_flip@2x-flip-vs-rmfb-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend-=
interruptible.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_flip@2x-flip-vs-suspend-interrup=
tible.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1421">Intel XE#1421</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_flip@basic-flip-vs-modese=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2482">Intel XE#2482</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_flip@f=
lip-vs-expired-vblank-interruptible.html">PASS</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +1 other =
test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32b=
pp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_flip_scale=
d_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745"=
>Intel XE#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7385">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/9144">Intel XE#9144</a>) +1 other test ( 2 skip )</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32b=
pp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-=
3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-=
a-default-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) +1=
 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
85">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-p016=
-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_force_connector_basic@for=
ce-connector-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuff=
er_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#631=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"=
>Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render.html">PASS</a> -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shar=
d-lnl-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shr=
fb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7779">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-=
argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontb=
uffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel =
XE#6312</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc=
drrs-abgr161616f-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_track=
ing@fbcdrrs-abgr161616f-draw-render.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1469">Intel XE#1469</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +21 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc=
drrshdr-tiling-y.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrsh=
dr-tiling-y.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc=
hdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_t=
racking@fbchdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +=
6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc=
hdr-argb161616f-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_track=
ing@fbchdr-argb161616f-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other =
tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html">PASS</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-ln=
l-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v=
4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-ono=
ff.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +4 other tests ( 1 pass, 1 s=
kip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc=
psr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tr=
acking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7=
905</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcp=
srhdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +14 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@hdr=
-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tr=
acking@hdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +9 =
other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-=
rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7779">Intel XE#7779</a>) +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +16=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>=
) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_hdmi_inject@inject-audio.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1470">Intel XE#1470</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_hdr@brightness-with-hdr.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
168204v4/shard-lnl-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#33=
74</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/354=
4">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_invalid_mode@bad-vsync-st=
art.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6900">Intel XE#6900</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_joiner@invalid-modeset-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_mst@mst-suspend-read-crc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_plane@pixel-format-4-tile=
d-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +5 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_plane@pixel-format-x-tile=
d-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_plane_lowres@tiling-x@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/599">Intel XE#599</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_plane_multiple@2x-tiling-=
none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_plane_multiple@tiling-yf=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-168204v4/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#=
5020</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plane_scaling@invalid-par=
ameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7687">Intel XE#7687</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_plan=
e_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a> =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/=
shard-lnl-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel=
-formats.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipp=
ing-clamping-pixel-formats.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#=
7687</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
125">Intel XE#9125</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plane_scaling@plane-upsca=
le-factor-0-25-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel X=
E#7687</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/9125">Intel XE#9125</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plane_scaling@plane-upsca=
le-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_pm_backlight@basic-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_pm_lpsp@kms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7643=
">Intel XE#7643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_pm_rpm@legacy-planes.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4886">Intel XE#4886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp-stres=
s-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_properties@crtc-propertie=
s-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/9129">Intel XE#9129</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-plane-move=
-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-=
edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-b-=
edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel =
XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane=
-update-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-u=
pdate-sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test=
 ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_psr2=
_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">PASS</a> -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1=
/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shar=
d-lnl-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_psr@fbc-psr2-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7345">Intel XE#7345</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204=
v4/shard-lnl-3/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#=
7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr@fbc-psr2-dpms@edp-1.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
168204v4/shard-lnl-3/igt@kms_psr@fbc-psr2-dpms@edp-1.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#14=
06</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/460=
9">Intel XE#4609</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-blt@=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_psr@fbc-psr2-sprite-plane=
-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_psr@pr-sprite-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_psr@=
psr2-sprite-blt.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_psr@psr2-sprite-blt.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1682=
04v4/shard-lnl-6/igt@kms_psr@psr2-sprite-blt.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel =
XE#929</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_rotation_crc@primary-rot=
ation-90.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-168204v4/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-90.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_setmode@clone-exclusive-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_vrr@negative-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
99">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@sriov_basic@pf-unbind-with-vf=
s-enabled-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8866">Intel XE#8866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-fault-mode-decompress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_ccs@vm-bind-fault-mode-dec=
ompress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_compute_preempt@compute-pr=
eempt-many-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5191">Intel XE#5191</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7316">Intel XE#7316</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7346">Intel XE#7346</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@xe_create@create-big-vram.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1062">Intel XE#1062</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7318">Intel XE#7318</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7457">Intel XE#7457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_create@multigpu-create-mas=
sive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7319">Intel XE#7319</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7350">Intel XE#7350</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@xe_cw_post_sync@walker-post-s=
ync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8608">Intel XE#8608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-5/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-4/igt@xe_evic=
t@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-7/igt@xe_evi=
ct@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel=
 XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_evict@evict-threads-small-=
multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_evict_ccs@evict-overcommi=
t-standalone-instantfree-reopen.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_evict_ccs@evict=
-overcommit-standalone-instantfree-reopen.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#=
688</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_exec_balancer@no-exec-cm-p=
arallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7482">Intel XE#7482</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_exec_balancer@no-exec-cm-=
parallel-userptr-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_exec_balancer@no-exec-c=
m-parallel-userptr-rebind.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +4 other tests ( 2 =
skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-null-defer-bind.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_exec_basic@m=
ultigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a=
>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@xe_exec_basic@multigpu-once-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_exec_fault_mode@many-exec=
queues-multi-queue-rebind-imm.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_exec_fault_mode@m=
any-execqueues-multi-queue-rebind-imm.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_exec_fault_mode@many-multi=
-queue-userptr-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +17 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_exec_mix_modes@exec-multi-=
queue-spinner-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9003">Intel XE#9003</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_exec_multi_queue@many-exec=
s-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8364">Intel XE#8364</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_exec_multi_queue@many-que=
ues-preempt-mode-userptr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_exec_multi_queue@many-=
queues-preempt-mode-userptr.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests ( =
2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel-on-secondary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_exec_reset@multi-queue-can=
cel-on-secondary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-wt-multi-vma.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-5/igt@xe_exec_=
threads@threads-hang-userptr-invalidate-race.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-10/i=
gt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-=
5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel=
 XE#9096</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@xe_exec_threads@threads-multi=
-queue-cm-shared-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +11 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_exec_threads@threads-mult=
i-queue-mixed-shared-vm-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_exec_threads@thre=
ads-multi-queue-mixed-shared-vm-basic.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 othe=
r test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-global:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_madvise@atomic-global.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@xe_mmap@pci-membarrier-bad-pa=
gesize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5100">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7322">Intel XE#7322</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_multigpu_svm@mgpu-coheren=
cy-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-168204v4/shard-lnl-3/igt@xe_multigpu_svm@mgpu-coherency-basic.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@xe_multigpu_svm@mgpu-latency-=
copy-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong@basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_noexec_ping_pong@basic.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
8204v4/shard-lnl-7/igt@xe_noexec_ping_pong@basic.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259">Intel XE#6259=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7324"=
>Intel XE#7324</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7406">Intel XE#7406</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7325">Intel XE#7325</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7393">Intel XE#7393</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pat-index-xd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_page_reclaim@pat-index-xd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7793">Intel XE#7793</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@random:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_page_reclaim@random.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16820=
4v4/shard-lnl-7/igt@xe_page_reclaim@random.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_pat@pat-sw-hw-suspend.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_peer2peer@read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">I=
ntel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@xe_pm@d3hot-i2c.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Int=
el XE#5742</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7328">Intel XE#7328</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7400">Intel XE#7400</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@xe_pm@s3-multiple-execs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
84">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7369">Intel XE#7369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_pm@s3-vm-bind-prefetch.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
8204v4/shard-lnl-7/igt@xe_pm@s3-vm-bind-prefetch.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369">I=
ntel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_pm@s4-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_query@multigpu-query-oa-un=
its.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@xe_sriov_admin@bulk-exec-quan=
tum-vfs-disabled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7174">Intel XE#7174</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@bulk-preempt-timeout-vfs-disabled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_sriov_admin@bulk-preempt-=
timeout-vfs-disabled.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_sriov_admin@bulk-preempt-t=
imeout-vfs-disabled.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_sriov_auto_provisioning@re=
sources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@open-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_sriov_vfio@open-basic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7724">Intel XE#7724</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@i2c-functionality:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@xe_survivability@i2c-function=
ality.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8415">Intel XE#8415</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@out-of-memory:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@xe_vm@out-of-memory.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745"=
>Intel XE#5745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@xe_vm@overcommit-fault-vram-=
lr-no-overcommit.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@xe_vm@overcommit-fault-vram-lr-no=
-overcommit.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@xe_vm@overcommit-nonfault-vra=
m-lr-external-nodefer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-tearing-position-change:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_curs=
or_crc@cursor-tearing-position-change.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl=
-5/igt@kms_cursor_crc@cursor-tearing-position-change.html">PASS</a> +14 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_flip=
@flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms=
_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#=
1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
144">Intel XE#9144</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linea=
r-to-32bpp-linear-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-tiling-linear.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1682=
04v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">PA=
SS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-4/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-8/igt@kms_hdr@invalid-hd=
r.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-168204v4/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plan=
e@pixel-format-linear-modifier-source-clamping.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7250">Intel XE#7250</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Inte=
l XE#9128</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-168204v4/shard-lnl-5/igt@kms_plane@pixel-format-linear-modifier-source=
-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plan=
e_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-a.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel=
 XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_plane_scaling@planes-unity-s=
caling-downscale-factor-0-75@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plan=
e_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel=
 XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6886">Intel XE#6886</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7687">Intel XE#7687</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_=
plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_pm_r=
pm@drm-resources-equal.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7106">Intel XE#7106</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_pm_r=
pm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr2=
_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#14=
89</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
8204v4/shard-lnl-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed=
-fully-sf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr@=
psr2-cursor-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5=
/igt@kms_psr@psr2-cursor-plane-onoff.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@fbdev@in=
fo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2134">Intel XE#2134</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@fbdev@info.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-l=
nl-6/igt@fbdev@info.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test ( 1 pass, 1=
 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_big_=
fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@km=
s_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_big_fb@4-til=
ed-16bpp-rotate-270.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1407">Intel XE#1407</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other te=
st ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_big_=
fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_=
big_fb@linear-16bpp-rotate-90.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_big_fb@linear-16=
bpp-rotate-90.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1407">Intel XE#1407</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test ( 2=
 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_big_=
fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/s=
hard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v=
4/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7059">Intel XE#7059</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7085">Intel XE#7085</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/=
shard-lnl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16820=
4v4/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1124">Intel XE#1124</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/9125">Intel XE#9125</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard=
-lnl-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Inte=
l XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_big_=
fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel X=
E#9125</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-168204v4/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-=
0-hflip-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stri=
de-32bpp-rotate-0-hflip-async-flip.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125=
</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_bw@c=
onnected-linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168=
204v4/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-1920=
x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-168204v4/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-t=
arget-1920x1080p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7679">Intel XE#7679</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1682=
04v4/shard-lnl-5/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_bw@l=
inear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shar=
d-lnl-3/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shar=
d-lnl-6/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Int=
el XE#367</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_bw@l=
inear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard=
-lnl-5/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel=
 XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_ccs@=
bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1=
/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@km=
s_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#=
9125</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_ccs@=
crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/=
igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_=
ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#738=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125=
">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shar=
d-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shar=
d-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">In=
tel XE#3432</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard=
-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-=
lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel=
 XE#3432</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/9125">Intel XE#9125</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_ccs@=
missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-l=
nl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE=
#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_ccs@=
random-ccs-data-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@km=
s_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_ccs@random-c=
cs-data-y-tiled-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2887">Intel XE#2887</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +5 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_cdcl=
k@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/ig=
t@kms_cdclk@mode-transition-all-outputs.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_cdclk@=
mode-transition-all-outputs.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7008">Intel XE#7008</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_colo=
r@ctm-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3297">Intel XE#3297</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_color@ctm-0-75.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
168204v4/shard-lnl-6/igt@kms_color@ctm-0-75.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_colo=
r_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/=
igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_=
color_pipeline@plane-lut1d-pre-ctm3x4.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_cont=
ent_protection@content-type-change.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/=
igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_cont=
ent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/s=
hard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-=
1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel=
 XE#6974</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_cont=
ent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_=
content_protection@lic-type-1.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_content_protecti=
on@lic-type-1.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7642">Intel XE#7642</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +2 other tests ( =
2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_curs=
or_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/ig=
t@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#=
7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_curs=
or_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/ig=
t@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_curso=
r_crc@cursor-onscreen-512x170.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel =
XE#9125</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_curs=
or_crc@cursor-random-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_=
cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_curs=
or_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3=
/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@km=
s_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#=
9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7=
/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@km=
s_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#73=
43</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/912=
5">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel X=
E#309</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7343">Intel XE#7343</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb=
-atomic-transitions-varying-size.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_cursor_legacy=
@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">I=
ntel XE#7343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/9125">Intel XE#9125</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel =
XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-168204v4/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_dir=
tyfb@drrs-dirtyfb-ioctl.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-i=
octl.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1508">Intel XE#1508</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/ig=
t@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7=
227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_dsc@=
dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/ig=
t@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_dsc@d=
sc-fractional-bpp-ultrajoiner.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +=
1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_dsc@=
dsc-fractional-bpp-with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-=
lnl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-ln=
l-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE=
#8265</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_dsc@=
dsc-with-output-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_dsc=
@dsc-with-output-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fbco=
n_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9127">Intel XE#9127</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_fbcon_fbt@fbc.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
8204v4/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9127">Intel XE#9127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fbco=
n_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8680">Intel XE#8680</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_fbcon_fb=
t@psr-suspend.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680"=
>Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_feat=
ure_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6128">Intel XE#6128</a>) -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/i=
gt@kms_feature_discovery@psr2.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_feature_discover=
y@psr2.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1135">Intel XE#1135</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6128">Intel XE#6128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_flip=
@flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/sha=
rd-lnl-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/sh=
ard-lnl-7/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">PASS=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482"=
>Intel XE#2482</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#=
1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9=
144">Intel XE#9144</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4til=
e-to-16bpp-4tile-downscaling.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_flip_scaled_crc@f=
lip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel X=
E#1745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7385">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shar=
d-lnl-6/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shar=
d-lnl-3/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">In=
tel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#=
2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
779">Intel XE#7779</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-pr=
imscrn-cur-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_track=
ing@drrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel X=
E#6312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/651">Intel XE#651</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7779">Intel XE#7779</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Inte=
l XE#7356</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-dr=
aw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-argb16161=
6f-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +=
1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#631=
2</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
8204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-ind=
fb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-prims=
crn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +3 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-rte:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@drrshdr-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/ig=
t@kms_frontbuffer_tracking@drrshdr-1p-rte.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2=
548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
79">Intel XE#7779</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-prim=
scrn-pri-indfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_trackin=
g@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#65=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779=
">Intel XE#7779</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7905">Intel XE#7905</a>) +17 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#25=
48</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/777=
9">Intel XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-sc=
ndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +10 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905"=
>Intel XE#7905</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scn=
dscrn-shrfb-pgflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">I=
ntel XE#7779</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7905">Intel XE#7905</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-b=
lt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw=
-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) =
+3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Int=
el XE#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-d=
raw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#=
7779</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-s=
pr-indfb-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr=
-1p-primscrn-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +7=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7=
779</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-in=
dfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-pr=
imscrn-cur-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +11 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel X=
E#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel X=
E#7779</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-168204v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbchdr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#790=
5</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
8204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-ms=
flip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primsc=
rn-shrfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7779">Intel XE#7779</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +12 other t=
ests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/i=
gt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_fr=
ontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel=
 XE#7779</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-=
pri-shrfb-draw-mmap-wc.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +1 o=
ther test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v=
4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
68204v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-re=
nder.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7356">Intel XE#7356</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +1 other tes=
t ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/sh=
ard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061=
">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4=
/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-ln=
l-7/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779"=
>Intel XE#7779</a>) +11 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Int=
el XE#7779</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scnds=
crn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_frontbuffer_trackin=
g@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Int=
el XE#7905</a>) +22 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#=
7865</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-168204v4/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shr=
fb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-1p-off=
screen-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +1=
 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/=
shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16820=
4v4/shard-lnl-3/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7779">Intel XE#7779</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@hdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/s=
hard-lnl-6/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v=
4/shard-lnl-1/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7779">Intel XE#7779</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_fron=
tbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v=
4/shard-lnl-5/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-7/igt@kms_hdr@br=
ightness-with-hdr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-168204v4/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_hdr=
@invalid-metadata-sizes.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_hdr@invalid-metadata-s=
izes.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1503">Intel XE#1503</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_hdr@static-t=
oggle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-168204v4/shard-lnl-6/igt@kms_hdr@static-toggle.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#15=
03</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/912=
5">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plan=
e@pixel-format-4-tiled-modifier.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7250">Intel XE#7250</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/=
shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-modifier.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-=
7/igt@kms_plane@pixel-format-4-tiled-modifier.html">PASS</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7250">Intel XE#7250</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Inte=
l XE#9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plan=
e@plane-position-hole.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>) -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plan=
e@plane-position-hole.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_plane@plane-position-hol=
e.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/9128">Intel XE#9128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plan=
e_cursor@primary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_plane_cur=
sor@primary.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plane_cursor@primary.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">In=
tel XE#9125</a>) +28 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plan=
e_lowres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_plane_l=
owres@tiling-yf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_plane_lowres@tiling-yf.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/59=
9">Intel XE#599</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel =
XE#9125</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-168204v4/shard-lnl-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v=
4/shard-lnl-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE=
#309</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
343">Intel XE#7343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7687">Intel XE#7687</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plan=
e_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886"=
>Intel XE#6886</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7687">Intel XE#7687</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_plane_sc=
aling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Int=
el XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-pixel-format.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#=
2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
886">Intel XE#6886</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7687">Intel XE#7687</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_pla=
ne_scaling@plane-downscale-factor-0-75-with-pixel-format.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl=
-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6886">Intel XE#6886</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 othe=
r tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe=
-b:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">In=
tel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6886">Intel XE#6886</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_plane_scaling@plane-down=
scale-factor-0-75-with-pixel-format@pipe-b.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_pla=
ne_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">=
Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6886">Intel XE#6886</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_pm_b=
acklight@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/870">Intel XE#870</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_pm_backlight@f=
ade.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-168204v4/shard-lnl-6/igt@kms_pm_backlight@fade.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_pm_d=
c@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8399">Intel XE#8399</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
168204v4/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr2=
_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1682=
04v4/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed=
-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr2=
_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168=
204v4/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exce=
ed-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-168204v4/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-contin=
uous-exceed-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2=
 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304"=
>Intel XE#7304</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-updat=
e-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-168204v4/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1489">Intel XE#1489</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr2=
_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#148=
9</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
8204v4/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-e=
xceed-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-c=
ontinuous-exceed-sf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">In=
tel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr@=
fbc-pr-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl=
-6/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_psr@fb=
c-pr-cursor-plane-move.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</=
a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_psr@=
fbc-pr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_psr@fbc=
-pr-primary-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_psr@fbc-pr-primary-blt.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr@=
fbc-pr-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-=
5/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr@=
fbc-psr2-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/i=
gt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/igt@kms_psr@fbc-psr2-p=
rimary-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_psr@=
psr2-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-7/ig=
t@kms_psr@psr2-sprite-render.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_psr@psr2-sprite-r=
ender.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests ( 1 pass, 1 =
skip )</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_rota=
tion_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-3/igt@kms_rotati=
on_crc@bad-tiling.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7342">Intel XE#7342</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +2 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168=
204v4/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4=
/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">In=
tel XE#1127</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5813">Intel XE#5813</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-9/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/sha=
rd-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-1/ig=
t@kms_tiled_display@basic-test-pattern.html">FAIL</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#24=
26</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584=
8">Intel XE#5848</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-2/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel X=
E#5848</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-168204v4/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chame=
lium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-168204v4/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-cha=
melium.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-6/igt@kms_vrr@=
lobf-dc3co.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-5/igt@kms_vrr@lobf-dc3co.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8397">Intel XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-lnl-3/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-lnl-1/igt@kms_vrr=
@seamless-rr-switch-vrr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-168204v4/shard-lnl-6/igt@kms_vrr@seamless-rr-switch=
-vrr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1499">Intel XE#1499</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-10/igt@xe_evic=
t@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#835=
5</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
8204v4/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMP=
LETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204=
v4/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel=
 XE#6321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7/shard-bmg-7/igt@xe_wedge=
d@basic-wedged.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v4/shard-bmg-7/igt@xe_wedged=
@basic-wedged.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-168204v4/shard-bmg-1/igt@xe_wedged@basic-wedged.html">ABORT<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591">=
Intel XE#8591</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7 -&gt; xe-pw-168=
204v4</li>
</ul>
<p>IGT_9085: 9085<br />
  xe-5702-8968c3fbc95e850342a9316f74df831afc2376b7: 8968c3fbc95e850342a9316=
f74df831afc2376b7<br />
  xe-pw-168204v4: 168204v4</p>

</body>
</html>

--===============8351361853329279079==--
