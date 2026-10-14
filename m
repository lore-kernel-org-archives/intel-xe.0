Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6165ECC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 16:51:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E96D10E04F;
	Wed, 14 Oct 2026 16:51:57 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3782A10E04F;
 Wed, 14 Oct 2026 16:51:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7320949661151382055=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Crescent_Island_PMT_suppor?=
 =?utf-8?q?t_=28rev14=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Oct 2026 16:51:55 -0000
Message-ID: <179199671521.24785.16538778375856395623@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
In-Reply-To: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
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

--===============7320949661151382055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Crescent Island PMT support (rev14)
URL   : https://patchwork.freedesktop.org/series/160717/
State : failure

== Summary ==

CI Bug Log - changes from xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d_FULL -> xe-pw-160717v14_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160717v14_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160717v14_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160717v14_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotrebind-lateclose-with-load:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose-with-load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@core_hotunplug@hotrebind-lateclose-with-load.html

  
New tests
---------

  New tests have been introduced between xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d_FULL and xe-pw-160717v14_FULL:

### New IGT tests (5) ###

  * igt@kms_sequence@queue-idle@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.57] s

  * igt@kms_sequence@queue-idle@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@kms_vblank@query-forked-busy-hang@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.76] s

  * igt@kms_vblank@query-idle@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.50] s

  * igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.65] s

  

Known issues
------------

  Here are the changes found in xe-pw-160717v14_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#5947])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][4] ([Intel XE#6925]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][5] ([Intel XE#5901]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2327]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1407])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +7 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#610] / [Intel XE#7387])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-ptl:          NOTRUN -> [SKIP][10] ([Intel XE#5855])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#5850])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#5851])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#5808]) +19 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#7679])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#7679]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#367]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +9 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][20] ([Intel XE#5822]) +21 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][21] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#3432])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:
    - shard-ptl:          [PASS][23] -> [ABORT][24] ([Intel XE#7084] / [Intel XE#9362]) +1 other test abort
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2652]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][27] ([Intel XE#5823] / [Intel XE#6918]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2724] / [Intel XE#7449])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#5824])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-2/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7358]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#7358])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#8391]) +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#373]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2252]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#2252]) +8 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-ptl:          NOTRUN -> [SKIP][37] ([Intel XE#6507])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:
    - shard-ptl:          NOTRUN -> [SKIP][38] ([Intel XE#6969]) +15 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#6969]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#6969]) +7 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2390] / [Intel XE#6974])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#6974])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@lic-type-1:
    - shard-ptl:          NOTRUN -> [SKIP][43] ([Intel XE#7642]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][44] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][45] ([Intel XE#6707] / [Intel XE#7439]) +3 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#5900]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#5846])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2320]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#2321] / [Intel XE#7355])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#5962]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-ptl:          NOTRUN -> [SKIP][52] ([Intel XE#5962] / [Intel XE#7343])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2286] / [Intel XE#6035])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#6035])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#9536])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-6/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#9536])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#9528])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#4331] / [Intel XE#7227])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-ptl:          NOTRUN -> [SKIP][59] ([Intel XE#7227])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#8265]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#5907]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#8680])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2372] / [Intel XE#7359])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#703] / [Intel XE#7448])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-8/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1138] / [Intel XE#7344])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@kms_feature_discovery@display-4x.html
    - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#7344]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@hdr:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#9287])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@kms_feature_discovery@hdr.html

  * igt@kms_feature_discovery@vrr:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#8586])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1421]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-1/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-ptl:          NOTRUN -> [SKIP][70] ([Intel XE#2316]) +8 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][71] -> [FAIL][72] ([Intel XE#301]) +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][73] -> [FAIL][74] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#7178] / [Intel XE#7349])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][76] ([Intel XE#7178]) +6 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#7178] / [Intel XE#7351])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#7179])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#7061] / [Intel XE#7356]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2311]) +37 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#6312]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-5/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#6312]) +12 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#4141]) +6 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][85] ([Intel XE#7061] / [Intel XE#7356]) +9 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2352] / [Intel XE#7399])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#656] / [Intel XE#7905]) +11 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-ptl:          NOTRUN -> [SKIP][89] ([Intel XE#5800] / [Intel XE#6312]) +14 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#7399])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html
    - shard-ptl:          NOTRUN -> [SKIP][91] ([Intel XE#7399]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#7061]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][93] ([Intel XE#5812]) +103 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#7905]) +11 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#7865]) +7 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][96] ([Intel XE#7865]) +38 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-2/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2313]) +41 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-4/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][98] ([Intel XE#7061]) +10 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#7061])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-5/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html

  * igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:
    - shard-bmg:          [PASS][100] -> [DMESG-WARN][101] ([Intel XE#9365])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-5/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-ptl:          [PASS][102] -> [SKIP][103] ([Intel XE#7308])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-2/igt@kms_hdmi_inject@inject-audio.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-ptl:          NOTRUN -> [SKIP][104] ([Intel XE#5917] / [Intel XE#6174]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][105] -> [SKIP][106] ([Intel XE#1503])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#6911] / [Intel XE#7466])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#7283]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#7283])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][110] ([Intel XE#7283]) +4 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@kms_plane@pixel-format-x-tiled-modifier.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-ptl:          NOTRUN -> [SKIP][111] ([Intel XE#5946]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_plane_lowres@tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2393])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-ptl:          NOTRUN -> [SKIP][113] ([Intel XE#5020])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
    - shard-ptl:          NOTRUN -> [SKIP][114] ([Intel XE#6886]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#8396]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html

  * igt@kms_pm_dc@dc3co-vpb-framegap@pr-xrgb8888:
    - shard-ptl:          NOTRUN -> [SKIP][119] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_pm_dc@dc3co-vpb-framegap@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:
    - shard-ptl:          NOTRUN -> [SKIP][120] ([Intel XE#8396]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-bmg:          [PASS][121] -> [ABORT][122] ([Intel XE#9362])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-3/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-7/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
    - shard-ptl:          NOTRUN -> [ABORT][123] ([Intel XE#9362])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#7794])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-ptl:          NOTRUN -> [SKIP][125] ([Intel XE#5810])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-ptl:          NOTRUN -> [SKIP][126] ([Intel XE#5849])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [PASS][127] -> [FAIL][128] ([Intel XE#9472])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-8/igt@kms_pm_rpm@i2c.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][130] ([Intel XE#5858]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#4608]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][134] ([Intel XE#5858] / [Intel XE#7304]) +5 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#1489]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][136] ([Intel XE#7304]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2387] / [Intel XE#7429])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-ptl:          NOTRUN -> [SKIP][138] ([Intel XE#7413])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-suspend@edp-1:
    - shard-ptl:          [PASS][139] -> [ABORT][140] ([Intel XE#9362]) +1 other test abort
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-3/igt@kms_psr@fbc-psr-suspend@edp-1.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_psr@fbc-psr-suspend@edp-1.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-ptl:          NOTRUN -> [SKIP][141] ([Intel XE#1406] / [Intel XE#5835]) +9 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@pr-basic:
    - shard-ptl:          NOTRUN -> [SKIP][142] ([Intel XE#1406]) +4 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@kms_psr@pr-basic.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#1406]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-6/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-ptl:          [PASS][145] -> [SKIP][146] ([Intel XE#9341])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-lnl:          [PASS][147] -> [SKIP][148] ([Intel XE#9341])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][149] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-ptl:          NOTRUN -> [SKIP][150] ([Intel XE#5821])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-ptl:          NOTRUN -> [SKIP][151] ([Intel XE#5813])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#2330] / [Intel XE#5813])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-4/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#1435] / [Intel XE#9142])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-7/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_sharpness_filter@filter-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#6503])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-4/igt@kms_sharpness_filter@filter-suspend.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-ptl:          NOTRUN -> [SKIP][156] ([Intel XE#5848]) +1 other test skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@cmrr-video-mode:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#9271])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_vrr@cmrr-video-mode.html

  * igt@kms_vrr@negative-basic:
    - shard-ptl:          NOTRUN -> [SKIP][158] ([Intel XE#5949] / [Intel XE#9277])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-ptl:          NOTRUN -> [SKIP][159] ([Intel XE#5948] / [Intel XE#9277])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
    - shard-ptl:          NOTRUN -> [ABORT][160] ([Intel XE#8868])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#6599])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_create@create-big-vram:
    - shard-ptl:          NOTRUN -> [SKIP][162] ([Intel XE#5853] / [Intel XE#7457])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][163] ([Intel XE#5764]) +12 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-6/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#8370]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-ptl:          NOTRUN -> [SKIP][166] ([Intel XE#6144]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#7482]) +4 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-7/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html

  * igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][168] ([Intel XE#7482]) +21 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-ptl:          NOTRUN -> [SKIP][169] ([Intel XE#5575] / [Intel XE#7484]) +6 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#1392]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-imm:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#8374]) +4 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#8374]) +9 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-4/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][174] ([Intel XE#8374]) +17 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem:
    - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#8364]) +5 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority:
    - shard-ptl:          NOTRUN -> [SKIP][176] ([Intel XE#8364]) +42 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#8364]) +22 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#8369]) +2 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-3/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_reset@gt-stress-reset-memory-pressure:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][179] ([Intel XE#8652])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-2/igt@xe_exec_reset@gt-stress-reset-memory-pressure.html

  * igt@xe_exec_reset@multi-queue-close-fd:
    - shard-ptl:          NOTRUN -> [SKIP][180] ([Intel XE#8369]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-6/igt@xe_exec_reset@multi-queue-close-fd.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-ptl:          [PASS][181] -> [FAIL][182] ([Intel XE#9096])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#8378]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#8378]) +6 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][185] ([Intel XE#8378]) +9 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-ptl:          NOTRUN -> [SKIP][186] ([Intel XE#7070])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_mempage_offline@inject-duplicate-page:
    - shard-ptl:          NOTRUN -> [SKIP][187] ([Intel XE#9203])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@xe_mempage_offline@inject-duplicate-page.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-ptl:          NOTRUN -> [SKIP][188] ([Intel XE#5100] / [Intel XE#7408])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_mmap@small-bar:
    - shard-ptl:          NOTRUN -> [SKIP][189] ([Intel XE#5867])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@xe_mmap@small-bar.html

  * igt@xe_multigpu_svm@mgpu-latency-basic:
    - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#6964]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-5/igt@xe_multigpu_svm@mgpu-latency-basic.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - shard-ptl:          NOTRUN -> [SKIP][191] ([Intel XE#6964]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  * igt@xe_page_reclaim@binds-null-vma:
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#7793]) +2 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-6/igt@xe_page_reclaim@binds-null-vma.html

  * igt@xe_page_reclaim@pde-vs-pd:
    - shard-lnl:          NOTRUN -> [SKIP][193] ([Intel XE#7793])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-2/igt@xe_page_reclaim@pde-vs-pd.html

  * igt@xe_page_reclaim@prl-invalidate-full:
    - shard-ptl:          NOTRUN -> [SKIP][194] ([Intel XE#7793]) +3 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@xe_page_reclaim@prl-invalidate-full.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-ptl:          NOTRUN -> [FAIL][195] ([Intel XE#7695]) +1 other test fail
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          NOTRUN -> [FAIL][196] ([Intel XE#7695])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-6/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][197] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-5/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][198] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-5/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][199] ([Intel XE#2284] / [Intel XE#7370])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@xe_pm@d3cold-mmap-system.html
    - shard-ptl:          NOTRUN -> [SKIP][200] ([Intel XE#5741]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-basic-exec:
    - shard-ptl:          NOTRUN -> [SKIP][201] ([Intel XE#6867]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][202] -> [ABORT][203] ([Intel XE#9362]) +1 other test abort
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-7/igt@xe_pm@s4-basic.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-1/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][204] -> [DMESG-WARN][205] ([Intel XE#7727])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-1/igt@xe_pm@s4-basic-exec.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-6/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm_residency@aspm_link_residency:
    - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#7271])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-4/igt@xe_pm_residency@aspm_link_residency.html

  * igt@xe_prefetch_fault@l2-prefetch-fault-svm:
    - shard-ptl:          NOTRUN -> [SKIP][207] ([Intel XE#8815])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][208] ([Intel XE#4733] / [Intel XE#7417])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][209] ([Intel XE#944])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-4/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-ptl:          NOTRUN -> [SKIP][210] ([Intel XE#6019]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-lnl:          NOTRUN -> [SKIP][211] ([Intel XE#944])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-7/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_admin@sched-priority-write-readback-vfs-disabled:
    - shard-lnl:          NOTRUN -> [SKIP][212] ([Intel XE#7174])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-1/igt@xe_sriov_admin@sched-priority-write-readback-vfs-disabled.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-2/igt@xe_sriov_vram@vf-access-provisioned.html

  * igt@xe_vm@bind-array-enobufs:
    - shard-ptl:          NOTRUN -> [FAIL][214] ([Intel XE#9424])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@xe_vm@bind-array-enobufs.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-lateclose-with-load:
    - shard-bmg:          [ABORT][215] ([Intel XE#9463]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-2/igt@core_hotunplug@hotreplug-lateclose-with-load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose-with-load.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][217] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [FAIL][219] ([Intel XE#6078]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-bmg:          [FAIL][221] ([Intel XE#8098] / [Intel XE#9561]) -> [PASS][222] +1 other test pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-10/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-ptl:          [ABORT][223] ([Intel XE#9362]) -> [PASS][224] +9 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][225] ([Intel XE#7809]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-ptl:          [ABORT][227] ([Intel XE#9363]) -> [PASS][228] +1 other test pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [ABORT][229] ([Intel XE#9375]) -> [PASS][230] +1 other test pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-7/igt@kms_vblank@ts-continuation-suspend.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [ABORT][231] ([Intel XE#9362] / [Intel XE#9581]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-2/igt@xe_ccs@suspend-resume.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-7/igt@xe_ccs@suspend-resume.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
    - shard-bmg:          [ABORT][233] ([Intel XE#9362]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-2/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-7/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-ptl:          [FAIL][235] ([Intel XE#9096]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-6/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-lnl:          [FAIL][237] ([Intel XE#9096]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-4/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [SKIP][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-1/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-1/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-5/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-5/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-6/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-3/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-5/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-7/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-4/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-2/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-4/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-7/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-8/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-8/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-8/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-3/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-4/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-6/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-1/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-4/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-2/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-5/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-7/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-3/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-3/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-2/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-7/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-7/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-2/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-4/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-5/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-1/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-4/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-4/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-8/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-1/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-8/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-8/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-1/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-2/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-1/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-6/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-6/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-5/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-5/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-6/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-7/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-2/igt@xe_module_load@load.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][290] ([Intel XE#9362]) -> [PASS][291]
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [FAIL][292] ([Intel XE#6569]) -> [PASS][293]
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][294] ([Intel XE#2311]) -> [INCOMPLETE][295] ([Intel XE#6819] / [Intel XE#9259])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-onoff.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-bmg:          [FAIL][296] ([Intel XE#9346]) -> [FAIL][297] ([Intel XE#9319] / [Intel XE#9346])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-3/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-4/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][298] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][299] ([Intel XE#2426] / [Intel XE#5848])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][300] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][301] ([Intel XE#2426] / [Intel XE#5848])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-ptl:          [ABORT][302] ([Intel XE#9362]) -> [DMESG-WARN][303] ([Intel XE#7727])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-3/igt@xe_pm@s4-multiple-execs.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@xe_pm@s4-multiple-execs.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5810]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5810
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849
  [Intel XE#5850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5850
  [Intel XE#5851]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851
  [Intel XE#5853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5853
  [Intel XE#5855]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5855
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5867
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917
  [Intel XE#5946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946
  [Intel XE#5947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5947
  [Intel XE#5948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5948
  [Intel XE#5949]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5949
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
  [Intel XE#6174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7070
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7271
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9259
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
  [Intel XE#9287]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9287
  [Intel XE#9319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9319
  [Intel XE#9341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9341
  [Intel XE#9346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9363]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9363
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375
  [Intel XE#9424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9424
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9472
  [Intel XE#9528]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9528
  [Intel XE#9536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9536
  [Intel XE#9561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9561
  [Intel XE#9581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9581


Build changes
-------------

  * IGT: IGT_9143 -> IGT_9144
  * Linux: xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d -> xe-pw-160717v14

  IGT_9143: 992e2bc5d5fcaef292ea89e3db5cb7a50b6edfc2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9144: aada5ae74aa135d2b448e25ec417f4f0dee9439c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d: 83b6bc1390606facc1c0426727905f9fcd75836d
  xe-pw-160717v14: 160717v14

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/index.html

--===============7320949661151382055==
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
<tr><td><b>Series:</b></td><td>Crescent Island PMT support (rev14)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/160717/">https://patchwork.freedesktop.org/series/160717/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-160717v14/index.html">https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-160717v14/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5942-83b6bc1390606facc1c0426727905f9fc=
d75836d_FULL -&gt; xe-pw-160717v14_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160717v14_FULL absolutely need=
 to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-160717v14_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1607=
17v14_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@hotrebind-lateclose-with-load:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-4/igt@core_hot=
unplug@hotrebind-lateclose-with-load.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@core_h=
otunplug@hotrebind-lateclose-with-load.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5942-83b6bc1390606facc1c042672=
7905f9fcd75836d_FULL and xe-pw-160717v14_FULL:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_sequence@queue-idle@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.65] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160717v14_FULL that come from known =
issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@kms_atomic_transition@plane-=
all-modeset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5947">Intel XE#5947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6925">Intel XE#6925</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@kms_big_fb@linear-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5901">Intel XE#5901</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_big_fb@linear-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-1/igt@kms_big_fb@x-tiled-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@kms_big_fb@y-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5855">Intel XE#5855</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_big_fb@yf-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5850">Intel XE#5850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_big_fb@yf-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5851">Intel XE#5851</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +19 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-6/igt@kms_bw@connected-linear-tili=
ng-3-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@kms_bw@connected-linear-tili=
ng-4-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_bw@linear-tiling-2-displ=
ays-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@kms_ccs@bad-rotation-90-y-ti=
led-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-7/igt@kms_ccs@crc-primary-basic-y-=
tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +21 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-=
4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other t=
est incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-=
4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-3/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-6=
/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">In=
tel XE#7084</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-5/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_ccs@random-ccs-data-4-ti=
led-bmg-ccs@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5823">Intel XE#5823</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6918">Intel XE#6918</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_cdclk@mode-transition-al=
l-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@kms_chamelium_color@ctm-0-50=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-2/igt@kms_chamelium_color@ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5824">Intel XE#5824</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-l=
ut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_chamelium_color_pipeline=
@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-4/igt@kms_chamelium_color_pipeline=
@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@kms_chamelium_color_pipeline=
@plane-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-1/igt@kms_chamelium_frames@hdmi-cr=
c-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-2/igt@kms_chamelium_hpd@hdmi-hpd-w=
ith-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_chamelium_sharpness_filt=
er@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@kms_color_pipeline@plane-lut=
1d-ctm3x4-lut1d@pipe-d-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +15 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-8/igt@kms_color_pipeline@plane-lut=
1d-post-ctm3x4@pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_color_pipeline@plane-lut=
1d-pre-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_content_protection@dp-ms=
t-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@kms_content_protection@dp-ms=
t-type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_content_protection@lic-t=
ype-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_content_protection@susp=
end-resume@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-3/igt@kms_content_protection@ueven=
t-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_cursor_crc@cursor-offscr=
een-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5900">Intel XE#5900</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-2/igt@kms_cursor_crc@cursor-onscre=
en-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5846">Intel XE#5846</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_cursor_crc@cursor-onscre=
en-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_cursor_crc@cursor-rando=
m-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@kms_cursor_crc@cursor-slidin=
g-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_cursor_legacy@cursorb-vs=
-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_cursor_legacy@cursorb-vs=
-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5962">Intel XE#5962</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-6/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035"=
>Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-6/igt@kms_dp_link_training@non-uhb=
r-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9536">Intel XE#9536</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_dp_link_training@non-uhb=
r-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9536">Intel XE#9536</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_dp_link_training@non-uh=
br-mst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/9528">Intel XE#9528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-5/igt@kms_dp_linktrain_fallback@ds=
c-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4331">Intel XE#4331</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@kms_dp_linktrain_fallback@ds=
c-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-b=
igjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@kms_dsc@dsc-with-formats-big=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5907">Intel XE#5907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-6/igt@kms_feature_discovery@chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2372">Intel XE#2372</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-8/igt@kms_feature_discovery@displa=
y-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/703">Intel XE#703</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@kms_feature_discovery@displa=
y-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1138">Intel XE#1138</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_feature_discovery@displa=
y-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7344">Intel XE#7344</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@hdr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@kms_feature_discovery@hdr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/9287">Intel XE#9287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_feature_discovery@vrr.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-1/igt@kms_flip@2x-flip-vs-modeset.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_flip@2x-plain-flip-fb-re=
create.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2316">Intel XE#2316</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-4/i=
gt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#3=
01</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-7/igt@kms_flip@flip=
-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other=
 test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32b=
pp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel X=
E#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_flip_scaled_crc@flip-32b=
pp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32b=
pp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#735=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32b=
pp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel X=
E#7351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflec=
t-x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32b=
pp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-5/igt@kms_frontbuffer_tracking@drr=
s-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +5 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-3/igt@kms_frontbuffer_tracking@drr=
s-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-5/igt@kms_frontbuffer_tracking@drr=
shdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-rgb565-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@kms_frontbuffer_tracking@drr=
shdr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +12 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc=
-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_frontbuffer_tracking@fbc=
-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +9 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc=
-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2352">Intel XE#2352</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc=
drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905=
</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_frontbuffer_tracking@fbc=
drrs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +14 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_frontbuffer_tracking@fb=
cdrrshdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_frontbuffer_tracking@fbc=
drrshdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7399">Intel XE#7399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc=
hdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-2/igt@kms_frontbuffer_tracking@fbc=
psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +103 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-indfb-draw-render=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc=
psrhdr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +11 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@kms_frontbuffer_tracking@hdr=
-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +7 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-2/igt@kms_frontbuffer_tracking@hdr=
-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7865">Intel XE#7865</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-4/igt@kms_frontbuffer_tracking@psr=
hdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +41 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@kms_frontbuffer_tracking@psr=
hdr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +10 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-5/igt@kms_frontbuffer_tracking@psr=
hdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-mem-audio-recovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-5/igt@kms_hdmi=
_audio_bw@suspend-mem-audio-recovery.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_hdm=
i_audio_bw@suspend-mem-audio-recovery.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-2/igt@kms_hdmi=
_inject@inject-audio.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_hdmi_inject@inject-=
audio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-2/igt@kms_hdr@brightness-with-hdr.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5917">Intel XE#5917</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6174">Intel XE#6174</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-6/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_hdr@invalid-hdr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">I=
ntel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@kms_joiner@basic-force-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-6/igt@kms_plane@pixel-format-4-til=
ed-dg2-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-2/igt@kms_plane@pixel-format-4-til=
ed-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@kms_plane@pixel-format-x-til=
ed-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7283">Intel XE#7283</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_plane_lowres@tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5946">Intel XE#5946</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@kms_plane_lowres@tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@kms_plane_multiple@tiling-y.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_plane_scaling@planes-uni=
ty-scaling-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-6/igt@kms_plane_scaling@planes-ups=
cale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@kms_pm_backlight@bad-brightn=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_pm_dc@dc3co-framedrop-ch=
eck@pr-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_pm_dc@dc3co-framedrop-ch=
eck@psr2-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap@pr-xrgb8888:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_pm_dc@dc3co-vpb-framegap=
@pr-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@kms_pm_dc@dc3co-vpb-framegap=
@psr2-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-3/igt@kms_pm_d=
c@dc5-dpms-suspend-resume.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-7/igt@kms_pm_dc@dc5-dpms=
-suspend-resume.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_pm_dc@dc5-dpms-suspend-r=
esume.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">=
Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@kms_pm_rpm@dpms-mode-unset-n=
on-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5810">Intel XE#5810</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@kms_pm_rpm@dpms-non-lpsp.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5849">Intel XE#5849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-8/igt@kms_pm_r=
pm@i2c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-160717v14/shard-bmg-9/igt@kms_pm_rpm@i2c.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9472">Intel XE#947=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-=
stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</=
p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@kms_psr2_sf@fbc-psr2-cursor-=
plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-overlay=
-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-plane-m=
ove-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-plane-m=
ove-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@kms_psr2_sf@fbc-psr2-primary=
-plane-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#730=
4</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@kms_psr2_sf@pr-overlay-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@kms_psr2_sf@pr-overlay-prima=
ry-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@kms_psr2_su@page_flip-xrgb88=
88.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-2/igt@kms_psr2_su@page_flip-xrgb88=
88.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend@edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-3/igt@kms_psr@=
fbc-psr-suspend@edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_psr@fbc-psr-suspen=
d@edp-1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@kms_psr@fbc-psr2-no-drrs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5835">Intel XE#5835</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@kms_psr@pr-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">I=
ntel XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-6/igt@kms_psr@pr-no-drrs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_psr@pr-sprite-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-4/igt@kms_psr_=
stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@=
kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9341">Intel XE#9341=
</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-4/igt@kms_psr_=
stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@=
kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9341">Intel XE#9341=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-7/igt@kms_rotation_crc@primary-rot=
ation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@kms_rotation_crc@primary-rot=
ation-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@kms_rotation_crc@primary-y-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-4/igt@kms_rotation_crc@sprite-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-7/igt@kms_setmode@invalid-clone-si=
ngle-crtc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-4/igt@kms_sharpness_filter@filter-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_tiled_display@basic-test=
-pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5848">Intel XE#5848</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-video-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-10/igt@kms_vrr@cmrr-video-mode.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@kms_vrr@negative-basic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
949">Intel XE#5949</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/9277">Intel XE#9277</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@kms_vrr@seamless-rr-switch-v=
rr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5948">Intel XE#5948</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/9277">Intel XE#9277</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@sriov_basic@pf-unbind-with-v=
fs-enabled-numvfs-all.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@xe_compute@ccs-mode-compute-=
kernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@xe_create@create-big-vram.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5853">Intel XE#5853</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7457">Intel XE#7457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@xe_evict@evict-beng-cm-threa=
ds-large-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +12 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-6/igt@xe_evict@evict-beng-cm-threa=
ds-large-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@xe_evict@evict-small-multi-q=
ueue-priority-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8370">Intel XE#8370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@xe_evict_ccs@evict-overcommi=
t-standalone-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6144">Intel XE#6144</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-7/igt@xe_exec_balancer@many-parall=
el-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@xe_exec_balancer@no-exec-par=
allel-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7=
372</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-5/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-imm:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-8/igt@xe_exec_fault_mode@many-exec=
queues-multi-queue-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-4/igt@xe_exec_fault_mode@many-mult=
i-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +9 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@xe_exec_fault_mode@many-mult=
i-queue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +17 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-5/igt@xe_exec_multi_queue@many-que=
ues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@xe_exec_multi_queue@many-que=
ues-preempt-mode-fault-priority.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +42 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-5/igt@xe_exec_multi_queue@one-queu=
e-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +22 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-3/igt@xe_exec_reset@cm-multi-queue=
-cat-error-on-secondary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-memory-pressure:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-2/igt@xe_exec_reset@gt-stress-rese=
t-memory-pressure.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-fd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-6/igt@xe_exec_reset@multi-queue-cl=
ose-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-8/igt@xe_exec_=
threads@threads-hang-userptr-invalidate-race.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/i=
gt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#=
9096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@xe_exec_threads@threads-mult=
i-queue-fd-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@xe_exec_threads@threads-mult=
i-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-2/igt@xe_exec_threads@threads-mult=
i-queue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +9 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@xe_gt_freq@freq_suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7070">Intel XE#7070</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-duplicate-page:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@xe_mempage_offline@inject-du=
plicate-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/9203">Intel XE#9203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@xe_mmap@pci-membarrier-paral=
lel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5100">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@xe_mmap@small-bar.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5867">=
Intel XE#5867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-5/igt@xe_multigpu_svm@mgpu-latency=
-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@xe_multigpu_svm@mgpu-xgpu-ac=
cess-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-null-vma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-6/igt@xe_page_reclaim@binds-null-v=
ma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7793">Intel XE#7793</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pde-vs-pd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-2/igt@xe_page_reclaim@pde-vs-pd.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-invalidate-full:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-5/igt@xe_page_reclaim@prl-invalida=
te-full.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7793">Intel XE#7793</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-3/igt@xe_pat@pat-sw-hw-reset-compa=
re.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7695">Intel XE#7695</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-6/igt@xe_pat@pat-sw-hw-suspend.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-5/igt@xe_peer2peer@write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427"=
>Intel XE#2427</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6953">Intel XE#6953</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-5/igt@xe_pm@d3cold-basic-exec.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-9/igt@xe_pm@d3cold-mmap-system.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7370">Intel XE#7370</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-7/igt@xe_pm@d3cold-mmap-system.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/5741">Intel XE#5741</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-1/igt@xe_pm@s3-basic-exec.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867=
">Intel XE#6867</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-7/igt@xe_pm@s4=
-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-160717v14/shard-lnl-1/igt@xe_pm@s4-basic.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#93=
62</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-1/igt@xe_pm@s4=
-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-160717v14/shard-lnl-6/igt@xe_pm@s4-basic-exec.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/77=
27">Intel XE#7727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@aspm_link_residency:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-4/igt@xe_pm_residency@aspm_link_re=
sidency.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7271">Intel XE#7271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@l2-prefetch-fault-svm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@xe_prefetch_fault@l2-prefetc=
h-fault-svm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8815">Intel XE#8815</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-pos=
t-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-bmg-4/igt@xe_query@multigpu-query-cs-c=
ycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@xe_query@multigpu-query-inva=
lid-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6019">Intel XE#6019</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-7/igt@xe_query@multigpu-query-mem-=
usage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@sched-priority-write-readback-vfs-disabled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-1/igt@xe_sriov_admin@sched-priorit=
y-write-readback-vfs-disabled.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-lnl-2/igt@xe_sriov_vram@vf-access-prov=
isioned.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6376">Intel XE#6376</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-enobufs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v14/shard-ptl-4/igt@xe_vm@bind-array-enobufs.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/9424">Intel XE#9424</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose-with-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-2/igt@core_hot=
unplug@hotreplug-lateclose-with-load.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bm=
g-5/igt@core_hotunplug@hotreplug-lateclose-with-load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-5/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6=
078</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
60717v14/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-5/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#607=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160=
717v14/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pi=
pe-b-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-10/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8098">Intel XE#8098</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9561">Inte=
l XE#9561</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-160717v14/shard-bmg-2/igt@kms_atomic_transition@plane-toggle-modeset-t=
ransition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-5/igt@kms_curs=
or_crc@cursor-suspend@pipe-a-edp-1.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-=
6/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> +9 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/sh=
ard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-8/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9363">Intel XE#9363</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-pt=
l-3/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-7/igt@kms_vbla=
nk@ts-continuation-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9375">Intel XE#9375</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-8/igt@km=
s_vblank@ts-continuation-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-2/igt@xe_ccs@s=
uspend-resume.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9362">Intel XE#9362</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9581">Intel XE#9581</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-7/igt@x=
e_ccs@suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-2/igt@xe_ccs@s=
uspend-resume@linear-compressed-compfmt0-system-vram01.html">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#=
9362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
160717v14/shard-bmg-7/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-=
system-vram01.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-6/igt@xe_exec_=
threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1=
4/shard-ptl-7/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-5/igt@xe_exec_=
threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/s=
hard-lnl-4/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-l=
nl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/sha=
rd-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d=
/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75=
836d/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9f=
cd75836d/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c042672790=
5f9fcd75836d/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c04267=
27905f9fcd75836d/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0=
426727905f9fcd75836d/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606fac=
c1c0426727905f9fcd75836d/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc139060=
6facc1c0426727905f9fcd75836d/shard-lnl-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc13=
90606facc1c0426727905f9fcd75836d/shard-lnl-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-83b6=
bc1390606facc1c0426727905f9fcd75836d/shard-lnl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5942-=
83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-6/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-5/ig=
t@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-=
lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/sh=
ard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836=
d/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160=
717v14/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-160717v14/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard=
-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-160717v14/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-160717v14/shard-lnl-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/=
shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-160717v14/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-160717v14/shard-lnl-1/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16071=
7v14/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-160717v14/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-l=
nl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-1/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
160717v14/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-160717v14/shard-lnl-5/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/sh=
ard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-6/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-160717v14/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-2/i=
gt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-lnl-7/igt@xe_pm@s4=
-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-lnl-6/igt@xe_pm@s4-mult=
iple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-5/igt@xe_sriov=
_flr@flr-vf1-clear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bmg-1/igt@xe_sriov_fl=
r@flr-vf1-clear.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-160717v14/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-=
spr-indfb-onoff.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6819">Intel XE#6819</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/9259">Intel XE#9259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-3/igt@kms_hdmi=
_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9346">Intel XE#9346</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-bm=
g-4/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9319">Intel XE#93=
19</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/934=
6">Intel XE#9346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-3/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/sha=
rd-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848"=
>Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel X=
E#7437</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-160717v14/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d/shard-ptl-3/igt@xe_pm@s4=
-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v14/shard-ptl-8/igt@xe_pm@s4-mult=
iple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7727">Intel XE#7727</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9143 -&gt; IGT_9144</li>
<li>Linux: xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d -&gt; xe-pw-160=
717v14</li>
</ul>
<p>IGT_9143: 992e2bc5d5fcaef292ea89e3db5cb7a50b6edfc2 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_9144: aada5ae74aa135d2b448e25ec417f4f0dee9439c @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5942-83b6bc1390606facc1c0426727905f9fcd75836d: 83b6bc1390606facc1c0426=
727905f9fcd75836d<br />
  xe-pw-160717v14: 160717v14</p>

</body>
</html>

--===============7320949661151382055==--
