Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9CBCA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 02:57:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AA410E6F8;
	Tue, 13 Oct 2026 02:57:13 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963E810E027;
 Tue, 13 Oct 2026 02:57:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4654228713193686483=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Convert_IO=5FBUS?=
 =?utf-8?q?_errors_to_structured_xe=5Flog_API_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Oct 2026 02:57:12 -0000
Message-ID: <179186023260.15476.15099848639109863065@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261012122522.2307625-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20261012122522.2307625-1-dnyaneshwar.bhadane@intel.com>
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

--===============4654228713193686483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Convert IO_BUS errors to structured xe_log API (rev8)
URL   : https://patchwork.freedesktop.org/series/172475/
State : failure

== Summary ==

CI Bug Log - changes from xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1_FULL -> xe-pw-172475v8_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-172475v8_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-172475v8_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-172475v8_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-5/igt@xe_pxp@pxp-stale-queue-post-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  
New tests
---------

  New tests have been introduced between xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1_FULL and xe-pw-172475v8_FULL:

### New IGT tests (26) ###

  * igt@kms_atomic@atomic-plane-damage:
    - Statuses : 3 pass(s)
    - Exec time: [1.04, 1.30] s

  * igt@kms_vblank@accuracy-idle:
    - Statuses : 3 pass(s)
    - Exec time: [5.79, 9.54] s

  * igt@kms_vblank@query-busy:
    - Statuses : 1 pass(s)
    - Exec time: [10.16] s

  * igt@kms_vblank@query-busy-hang:
    - Statuses : 3 pass(s)
    - Exec time: [6.16, 10.08] s

  * igt@kms_vblank@query-forked:
    - Statuses : 3 pass(s)
    - Exec time: [5.86, 9.58] s

  * igt@kms_vblank@query-forked-busy:
    - Statuses : 3 pass(s)
    - Exec time: [6.15, 10.28] s

  * igt@kms_vblank@query-forked-busy-hang:
    - Statuses : 3 pass(s)
    - Exec time: [6.18, 10.00] s

  * igt@kms_vblank@query-forked-hang:
    - Statuses : 3 pass(s)
    - Exec time: [5.91, 9.48] s

  * igt@kms_vblank@query-idle:
    - Statuses : 1 pass(s)
    - Exec time: [5.71] s

  * igt@kms_vblank@query-idle-hang:
    - Statuses : 2 pass(s)
    - Exec time: [5.76, 5.77] s

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - Statuses : 3 pass(s)
    - Exec time: [4.73, 5.48] s

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - Statuses : 3 pass(s)
    - Exec time: [18.31, 41.03] s

  * igt@kms_vblank@ts-continuation-idle:
    - Statuses : 3 pass(s)
    - Exec time: [1.55, 1.80] s

  * igt@kms_vblank@ts-continuation-idle-hang:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_vblank@ts-continuation-modeset:
    - Statuses : 2 pass(s)
    - Exec time: [4.08, 4.16] s

  * igt@kms_vblank@ts-continuation-modeset-hang:
    - Statuses : 3 pass(s)
    - Exec time: [1.83, 4.13] s

  * igt@kms_vblank@ts-continuation-modeset-rpm:
    - Statuses : 3 pass(s)
    - Exec time: [4.93, 5.05] s

  * igt@kms_vblank@ts-continuation-suspend:
    - Statuses : 3 pass(s)
    - Exec time: [19.80, 42.37] s

  * igt@kms_vblank@wait-busy:
    - Statuses : 2 pass(s)
    - Exec time: [6.20, 10.38] s

  * igt@kms_vblank@wait-busy-hang:
    - Statuses : 3 pass(s)
    - Exec time: [6.18, 10.01] s

  * igt@kms_vblank@wait-forked:
    - Statuses : 3 pass(s)
    - Exec time: [5.91, 9.80] s

  * igt@kms_vblank@wait-forked-busy:
    - Statuses : 2 pass(s)
    - Exec time: [6.16, 10.29] s

  * igt@kms_vblank@wait-forked-busy-hang:
    - Statuses : 2 pass(s)
    - Exec time: [6.16, 6.18] s

  * igt@kms_vblank@wait-forked-hang:
    - Statuses : 1 pass(s)
    - Exec time: [9.79] s

  * igt@kms_vblank@wait-idle:
    - Statuses : 2 pass(s)
    - Exec time: [5.83] s

  * igt@kms_vblank@wait-idle-hang:
    - Statuses : 3 pass(s)
    - Exec time: [5.78, 9.38] s

  

Known issues
------------

  Here are the changes found in xe-pw-172475v8_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:
    - shard-bmg:          [PASS][3] -> [ABORT][4] ([Intel XE#9399]) +2 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:
    - shard-ptl:          NOTRUN -> [ABORT][5] ([Intel XE#9387])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:
    - shard-ptl:          NOTRUN -> [DMESG-WARN][6] ([Intel XE#9407])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#5901])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#6925])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1407]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#5808]) +6 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1124]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#7679])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#7679])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#367]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#8365])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +5 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2652]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#5822]) +8 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#3432])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2724] / [Intel XE#7449])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2252]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2325] / [Intel XE#7358])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-6/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#306] / [Intel XE#7358])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7358])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#2252]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#373])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:
    - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#6969]) +7 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#6969]) +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#6974])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][35] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@type1:
    - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#7642])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7642])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-ptl:          NOTRUN -> [SKIP][38] ([Intel XE#5900]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1424])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#5846])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2320]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-ptl:          NOTRUN -> [SKIP][43] ([Intel XE#5962])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#5962] / [Intel XE#7343])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1508])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-sst-direct-train:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#9534])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_dp_link_training@non-uhbr-sst-direct-train.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#9527])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#8265])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#8265]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-ultrajoiner:
    - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#5907])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@kms_dsc@dsc-with-output-formats-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-ptl:          [PASS][51] -> [ABORT][52] ([Intel XE#9362]) +2 other tests abort
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@vrr:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#8586])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_feature_discovery@vrr.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [PASS][54] -> [FAIL][55] ([Intel XE#5408] / [Intel XE#6266]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1421]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#2316]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][58] -> [FAIL][59] ([Intel XE#3321]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#301] / [Intel XE#3149])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#301])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#7178] / [Intel XE#7349])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#7178]) +6 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#7178] / [Intel XE#7351])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2311]) +31 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7905]) +9 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#7061]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#4141]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][74] ([Intel XE#5812]) +38 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#656] / [Intel XE#7905]) +7 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][76] ([Intel XE#6312]) +7 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#7061] / [Intel XE#7356])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#5800] / [Intel XE#6312]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#6312]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#7865]) +9 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][82] ([Intel XE#7061]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#7061] / [Intel XE#7356])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#7865]) +11 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2313]) +32 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#7061]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1503])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-ptl:          NOTRUN -> [SKIP][88] ([Intel XE#5917] / [Intel XE#6174])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#6900] / [Intel XE#7362])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#6912] / [Intel XE#7375])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#7283]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0:
    - shard-ptl:          [PASS][92] -> [FAIL][93] ([Intel XE#9340]) +1 other test fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-1/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-3/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#8303]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-ptl:          NOTRUN -> [SKIP][95] ([Intel XE#7283]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#4596] / [Intel XE#5854])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#5021] / [Intel XE#7377])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#7794])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2505] / [Intel XE#7447])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-ptl:          NOTRUN -> [SKIP][101] ([Intel XE#5849])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#1489]) +4 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][104] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][105] ([Intel XE#5858])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-ptl:          NOTRUN -> [SKIP][106] ([Intel XE#7304])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1406])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-ptl:          NOTRUN -> [SKIP][109] ([Intel XE#1406]) +4 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-7/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-ptl:          NOTRUN -> [SKIP][112] ([Intel XE#5813])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-ptl:          NOTRUN -> [SKIP][113] ([Intel XE#5821])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_sharpness_filter@filter-suspend:
    - shard-ptl:          [PASS][114] -> [ABORT][115] ([Intel XE#9375]) +1 other test abort
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-2/igt@kms_sharpness_filter@filter-suspend.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_sharpness_filter@filter-suspend.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#6503]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-ptl:          NOTRUN -> [SKIP][117] ([Intel XE#5848])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-lnl:          [PASS][118] -> [ABORT][119] ([Intel XE#9362]) +2 other tests abort
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#1499] / [Intel XE#9271])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#8397])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@kms_vrr@lobf-dc3co.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-ptl:          NOTRUN -> [SKIP][122] ([Intel XE#5948] / [Intel XE#9277])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-3/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1091] / [Intel XE#2849])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [PASS][124] -> [ABORT][125] ([Intel XE#9362] / [Intel XE#9425]) +1 other test abort
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-4/igt@xe_ccs@suspend-resume.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_ccs@suspend-resume.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-ptl:          NOTRUN -> [SKIP][126] ([Intel XE#5764]) +4 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-3/igt@xe_evict@evict-large-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][128] -> [INCOMPLETE][129] ([Intel XE#6321] / [Intel XE#8355])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#8370])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][131] ([Intel XE#7482]) +9 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race.html

  * igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#7482]) +5 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-ptl:          NOTRUN -> [SKIP][134] ([Intel XE#5575] / [Intel XE#7484]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#1392]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#8374]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][137] ([Intel XE#8374]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#8374]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#8364]) +6 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate:
    - shard-ptl:          NOTRUN -> [SKIP][140] ([Intel XE#8364]) +15 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#8364]) +17 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#8369])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#8369]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-6/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-ptl:          NOTRUN -> [SKIP][144] ([Intel XE#8369])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-basic:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#8378]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-basic.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][146] ([Intel XE#8378]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#8378]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [PASS][148] -> [ABORT][149] ([Intel XE#9463]) +2 other tests abort
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#2229])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_mempage_offline@inject-single-page:
    - shard-ptl:          NOTRUN -> [SKIP][151] ([Intel XE#9203])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_mempage_offline@inject-single-page.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-ptl:          NOTRUN -> [SKIP][152] ([Intel XE#5100] / [Intel XE#7408])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_mmap@small-bar:
    - shard-ptl:          NOTRUN -> [SKIP][153] ([Intel XE#5867])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178]) -> ([PASS][179], [PASS][180], [PASS][181], [PASS][182], [SKIP][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204]) ([Intel XE#2457] / [Intel XE#7405])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-6/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-6/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-2/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-5/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-5/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-5/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-8/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-1/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-7/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-4/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-2/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-3/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-4/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-8/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-4/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-8/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-9/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-9/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-1/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-3/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-6/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-7/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-4/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-4/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-6/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-6/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-basic:
    - shard-ptl:          NOTRUN -> [SKIP][205] ([Intel XE#6964]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][206] ([Intel XE#6964]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  * igt@xe_page_reclaim@binds-1g-partial:
    - shard-bmg:          NOTRUN -> [SKIP][207] ([Intel XE#7793])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-4/igt@xe_page_reclaim@binds-1g-partial.html

  * igt@xe_page_reclaim@many-vma-same-bo:
    - shard-lnl:          NOTRUN -> [SKIP][208] ([Intel XE#7793])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@xe_page_reclaim@many-vma-same-bo.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-ptl:          NOTRUN -> [SKIP][209] ([Intel XE#7590])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][210] ([Intel XE#2284] / [Intel XE#7370])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-ptl:          NOTRUN -> [SKIP][211] ([Intel XE#5741])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-ptl:          NOTRUN -> [SKIP][212] ([Intel XE#6867])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-exec-after:
    - shard-ptl:          NOTRUN -> [ABORT][213] ([Intel XE#9362])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@aspm_link_residency:
    - shard-ptl:          NOTRUN -> [SKIP][214] ([Intel XE#7271])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_pm_residency@aspm_link_residency.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-lnl:          NOTRUN -> [SKIP][215] ([Intel XE#944])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-ptl:          NOTRUN -> [SKIP][216] ([Intel XE#6019]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][217] ([Intel XE#944])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-defer:
    - shard-ptl:          NOTRUN -> [SKIP][218] ([Intel XE#7892])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:
    - shard-ptl:          [ABORT][219] ([Intel XE#9394]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1.html

  * igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][221] ([Intel XE#367]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [DMESG-WARN][223] ([Intel XE#9365] / [Intel XE#9482]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:
    - shard-bmg:          [DMESG-WARN][225] ([Intel XE#9365]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-ptl:          [ABORT][227] ([Intel XE#7084]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1:
    - shard-ptl:          [ABORT][229] ([Intel XE#7084] / [Intel XE#9367] / [Intel XE#9375]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-bmg:          [INCOMPLETE][231] ([Intel XE#8155]) -> [PASS][232] +1 other test pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-1/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][233] ([Intel XE#301]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][235] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-bmg:          [FAIL][237] ([Intel XE#9313]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_setmode@basic-no-cpu-idle@pipe-a-hdmi-a-3:
    - shard-bmg:          [FAIL][239] ([Intel XE#8618]) -> [PASS][240] +6 other tests pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-8/igt@kms_setmode@basic-no-cpu-idle@pipe-a-hdmi-a-3.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@kms_setmode@basic-no-cpu-idle@pipe-a-hdmi-a-3.html

  * igt@kms_vrr@flip-basic:
    - shard-ptl:          [FAIL][241] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][242] +1 other test pass
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-4/igt@kms_vrr@flip-basic.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_vrr@flip-basic.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][243] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_module_load@load:
    - shard-ptl:          ([PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [SKIP][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270]) ([Intel XE#9286]) -> ([PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-4/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-3/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-4/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-2/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-6/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-5/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-5/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-4/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-2/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-1/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-1/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-2/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-2/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-6/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-8/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-8/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-6/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-8/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-3/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-1/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-5/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-3/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-3/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-3/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-3/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_module_load@load.html

  * igt@xe_oa@non-zero-reason-all:
    - shard-ptl:          [FAIL][296] ([Intel XE#7334]) -> [PASS][297] +1 other test pass
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_oa@non-zero-reason-all.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_oa@non-zero-reason-all.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][298] ([Intel XE#9362]) -> [PASS][299]
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-6/igt@xe_pm@s4-basic-exec.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-3/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-bmg:          [ABORT][300] ([Intel XE#9399]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@xe_pm@s4-multiple-execs.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-ptl:          [DMESG-WARN][302] ([Intel XE#7727]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_pm@s4-vm-bind-prefetch.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-ptl:          [ABORT][304] ([Intel XE#9362]) -> [PASS][305] +2 other tests pass
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-3/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-ptl:          [ABORT][306] ([Intel XE#9394]) -> [ABORT][307] ([Intel XE#9375] / [Intel XE#9387])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-3/igt@kms_async_flips@async-flip-suspend-resume.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][308] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][309] ([Intel XE#309] / [Intel XE#7343])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][310] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][311] ([Intel XE#301])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][312] ([Intel XE#301]) -> [FAIL][313] ([Intel XE#301] / [Intel XE#3149])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][314] ([Intel XE#3544]) -> [SKIP][315] ([Intel XE#3374] / [Intel XE#3544])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-ptl:          [ABORT][316] ([Intel XE#9362]) -> [FAIL][317] ([Intel XE#7695])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-4/igt@xe_pat@pat-sw-hw-suspend.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_pat@pat-sw-hw-suspend.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5867
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917
  [Intel XE#5948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5948
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7271
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7334]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
  [Intel XE#9286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9286
  [Intel XE#9313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
  [Intel XE#9340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9340
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9367
  [Intel XE#9375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375
  [Intel XE#9387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9387
  [Intel XE#9394]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9394
  [Intel XE#9399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399
  [Intel XE#9407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9407
  [Intel XE#9425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9425
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9482
  [Intel XE#9527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527
  [Intel XE#9534]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9534


Build changes
-------------

  * IGT: IGT_9139 -> IGT_9140
  * Linux: xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1 -> xe-pw-172475v8

  IGT_9139: 3758ada24b618a59d8a5c66e37f0aadc20145d35 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9140: 3b0daa274edb520204660fa1e15424b66ce0aea0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1: 20282d4c78403c9eda071ebdd0c3d6fb287f64a1
  xe-pw-172475v8: 172475v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/index.html

--===============4654228713193686483==
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
<tr><td><b>Series:</b></td><td>drm/xe: Convert IO_BUS errors to structured =
xe_log API (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/172475/">https://patchwork.freedesktop.org/series/172475/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-172475v8/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-172475v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5931-20282d4c78403c9eda071ebdd0c3d6fb2=
87f64a1_FULL -&gt; xe-pw-172475v8_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-172475v8_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-172475v8_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1724=
75v8_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pxp@pxp-stale-queue-post-suspend:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-5/igt@xe_pxp@p=
xp-stale-queue-post-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@xe_pxp@pxp-stale-=
queue-post-suspend.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5931-20282d4c78403c9eda071ebdd=
0c3d6fb287f64a1_FULL and xe-pw-172475v8_FULL:</p>
<h3>New IGT tests (26)</h3>
<ul>
<li>
<p>igt@kms_atomic@atomic-plane-damage:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.04, 1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [5.79, 9.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [10.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [6.16, 10.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [5.86, 9.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [6.15, 10.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy-hang:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [6.18, 10.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [5.91, 9.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.76, 5.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [4.73, 5.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [18.31, 41.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.55, 1.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [4.08, 4.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.83, 4.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [4.93, 5.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [19.80, 42.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.20, 10.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [6.18, 10.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [5.91, 9.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.16, 10.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy-hang:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [6.16, 6.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [9.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [5.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [5.78, 9.38] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-172475v8_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-5/igt@kms_asyn=
c_flips@async-flip-suspend-resume@pipe-c-dp-2.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/ig=
t@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399">Intel XE=
#9399</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_async_flips@async-flip-su=
spend-resume@pipe-c-edp-1.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9387">Intel XE#9387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_async_flips@async-flip-su=
spend-resume@pipe-d-edp-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/9407">Intel XE#9407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@kms_big_fb@4-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5901">Intel XE#5901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-3/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6925">Intel XE#6925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@kms_bw@connected-linear-tilin=
g-3-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-7/igt@kms_bw@connected-linear-tilin=
g-3-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-7/igt@kms_bw@l=
inear-tiling-1-displays-target-1920x1080p.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@kms=
_bw@linear-tiling-1-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@kms_bw@linear-tiling-3-displa=
ys-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_bw@linear-tiling-4-displa=
ys-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-d-dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-3/igt@kms_ccs@missing-ccs-buffer-y-=
tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_cdclk@mode-transition.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@kms_chamelium_audio@dp-audio=
-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-6/igt@kms_chamelium_color@ctm-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_chamelium_color@ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@kms_chamelium_color_pipeline@=
plane-fixed-matrix-yuv-rgb-bt2020.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_chamelium_edid@hdmi-edid-=
read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_chamelium_frames@hdmi-crc=
-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_color_pipeline@plane-lut1=
d-ctm3x4-lut1d@pipe-d-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_color_pipeline@plane-lut1=
d-pre-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@kms_content_protection@dp-mst=
-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +=
3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_content_protection@type1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_content_protection@uevent=
-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_cursor_crc@cursor-offscre=
en-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5900">Intel XE#5900</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_cursor_crc@cursor-onscree=
n-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_cursor_crc@cursor-random-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5846">Intel XE#5846</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-m=
ovement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblock=
ing-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_cursor_legacy@cursora-vs-=
flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5962">Intel XE#5962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@kms_cursor_legacy@cursorb-vs-=
flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5962">Intel XE#5962</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-direct-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_dp_link_training@non-uhbr=
-sst-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9534">Intel XE#9534</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_dp_link_training@uhbr-mst=
-direct-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/9527">Intel XE#9527</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_dsc@dsc-fractional-bpp-wi=
th-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-bigjoine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8265">Intel XE#8265</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-ultrajoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@kms_dsc@dsc-with-output-forma=
ts-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5907">Intel XE#5907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-5/igt@kms_fbco=
n_fbt@fbc-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@kms_fbcon_fbt@fbc-suspend.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/9362">Intel XE#9362</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_feature_discovery@vrr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@kms_fli=
p@2x-flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@kms_flip@2x-=
flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 ot=
her test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_flip@2x-flip-vs-expired-v=
blank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@kms_flip@2x-flip-vs-modeset-v=
s-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 othe=
r test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149=
">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_flip@flip-=
vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32b=
pp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#735=
1</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE=
#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385"=
>Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE=
#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7385">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
hdr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +31 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs=
hdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +9 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs=
hdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +38 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)=
 +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:=
</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +7 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-linear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_frontbuffer_tracking@fbch=
dr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +9 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@kms_frontbuffer_tracking@fbch=
dr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcp=
sr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcp=
srhdr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +11 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@kms_frontbuffer_tracking@psr=
hdr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +32 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@kms_frontbuffer_tracking@psrh=
dr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@kms_hdr@static-toggle-dpms.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@kms_hdr@static-toggle-suspend=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5917">Intel XE#5917</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6174">Intel XE#6174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6900">Intel XE#6900</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8=
888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_plane@pixel-format-4-tile=
d-dg2-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane=
-0:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-1/igt@kms_plan=
e@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v=
8/shard-ptl-3/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@p=
ipe-a-plane-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/9340">Intel XE#9340</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@kms_plane@pixel-format-4-tile=
d-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_plane@pixel-format-yf-til=
ed-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-=
yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@kms_pm_backlight@fade-with-su=
spend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@kms_pm_dc@dc5-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">I=
ntel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505"=
>Intel XE#2505</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7447">Intel XE#7447</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@kms_pm_rpm@dpms-non-lpsp.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5849">Intel XE#5849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stres=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_psr2_sf@pr-cursor-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@kms_psr2_sf@pr-plane-move-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@kms_psr@fbc-pr-suspend.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@kms_psr@pr-sprite-blt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_psr@pr-sprite-plane-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-7/igt@kms_rotation_crc@bad-tiling.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@kms_rotation_crc@sprite-rotat=
ion-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-2/igt@kms_shar=
pness_filter@filter-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_sharpness_fil=
ter@filter-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/9375">Intel XE#9375</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_sharpness_filter@invalid-=
filter-with-plane.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_tiled_display@basic-test-=
pattern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-8/igt@kms_vrr@=
flip-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@kms_vrr@flip-suspen=
d@pipe-a-edp-1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9362">Intel XE#9362</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@kms_vrr@flipline.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">In=
tel XE#1499</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@kms_vrr@lobf-dc3co.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">=
Intel XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-3/igt@kms_vrr@seamless-rr-switch-vr=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5948">Intel XE#5948</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9277">Intel XE#9277</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-5/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-4/igt@xe_ccs@s=
uspend-resume.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_ccs@suspend-resume.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362=
">Intel XE#9362</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/9425">Intel XE#9425</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_evict@evict-beng-mixed-man=
y-threads-small.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5764">Intel XE#5764</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-3/igt@xe_evict@evict-large-cm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-5/igt@xe_evict=
@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_evict@evic=
t-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@xe_evict@evict-small-external=
-multi-queue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@xe_exec_balancer@many-execque=
ues-virtual-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@xe_exec_balancer@twice-cm-par=
allel-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@xe_exec_basic@multigpu-no-exe=
c-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exe=
c-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@xe_exec_fault_mode@once-multi=
-queue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-2/igt@xe_exec_fault_mode@once-multi=
-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@xe_exec_multi_queue@many-exec=
s-preempt-mode-fault-priority-smem.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_exec_multi_queue@two-queue=
s-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +15 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@xe_exec_multi_queue@two-queue=
s-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8364">Intel XE#8364</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@xe_exec_reset@cm-multi-queue-=
cat-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-6/igt@xe_exec_reset@cm-multi-queue-=
close-execqueues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_exec_reset@multi-queue-cat=
-error-on-secondary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-1/igt@xe_exec_threads@threads-multi=
-queue-cm-shared-vm-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@xe_exec_threads@threads-multi=
-queue-fd-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@xe_exec_threads@threads-multi=
-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-2/igt@xe_fault=
_injection@exec-queue-create-fail-xe_exec_queue_create_bind.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/s=
hard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_crea=
te_bind.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/9463">Intel XE#9463</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evi=
ct_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-single-page:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_mempage_offline@inject-sin=
gle-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/9203">Intel XE#9203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_mmap@pci-membarrier-bad-ob=
ject.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5100">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5867">I=
ntel XE#5867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/sha=
rd-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f=
64a1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb=
287f64a1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3=
d6fb287f64a1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebd=
d0c3d6fb287f64a1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda0=
71ebdd0c3d6fb287f64a1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c=
9eda071ebdd0c3d6fb287f64a1/shard-bmg-2/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78=
403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d=
4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20=
282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-59=
31-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-8/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-4/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-9/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-9/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/sha=
rd-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-172475v8/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-b=
mg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-10/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-172475v8/shard-bmg-5/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-172475v8/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard=
-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-172475v8/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard=
-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-3/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-172475v8/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-172475v8/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard=
-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-172475v8/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard=
-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-172475v8/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_multigpu_svm@mgpu-concurre=
nt-access-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@xe_multigpu_svm@mgpu-pagefaul=
t-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-1g-partial:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-4/igt@xe_page_reclaim@binds-1g-part=
ial.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@many-vma-same-bo:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@xe_page_reclaim@many-vma-same=
-bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_pat@xa-app-transient-media=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@xe_pm@d3cold-mmap-system.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5741">Intel XE#5741</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_pm@s3-vm-bind-unbind-all.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6867">Intel XE#6867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_pm@s4-exec-after.html">ABO=
RT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362=
">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@aspm_link_residency:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_pm_residency@aspm_link_res=
idency.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7271">Intel XE#7271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@xe_query@multigpu-query-cs-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_query@multigpu-query-gt-li=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6019">Intel XE#6019</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-bmg-9/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-defer:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_vm@overcommit-nonfault-vra=
m-lr-defer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-3/igt@kms_asyn=
c_flips@async-flip-suspend-resume@pipe-b-edp-1.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9394">Intel XE#9394</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8=
/shard-ptl-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-b-edp-1.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-2/igt@kms_bw@l=
inear-tiling-1-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-b=
mg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9482">Intel XE#=
9482</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
172475v8/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#93=
65</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
2475v8/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-d=
p-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-8/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-=
2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-8/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-edp-1.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9367"=
>Intel XE#9367</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9375">Intel XE#9375</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@kms_ccs@crc-primary-suspen=
d-4-tiled-lnl-ccs@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-1/igt@kms_flip=
@2x-dpms-vs-vblank-race.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@k=
ms_flip@2x-dpms-vs-vblank-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shar=
d-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@kms_hdm=
i_audio_bw@audio-bw-hblank80.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9313">Intel XE#9313</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-5/igt@km=
s_hdmi_audio_bw@audio-bw-hblank80.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-no-cpu-idle@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-8/igt@kms_setm=
ode@basic-no-cpu-idle@pipe-a-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8618">Intel XE#8618</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg=
-3/igt@kms_setmode@basic-no-cpu-idle@pipe-a-hdmi-a-3.html">PASS</a> +6 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-4/igt@kms_vrr@=
flip-basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4227">Intel XE#4227</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@kms_vr=
r@flip-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@xe_evic=
t@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel X=
E#8355</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-172475v8/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-ptl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-p=
tl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/sha=
rd-ptl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1=
/shard-ptl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f=
64a1/shard-ptl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb=
287f64a1/shard-ptl-2/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3=
d6fb287f64a1/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebd=
d0c3d6fb287f64a1/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda07=
1ebdd0c3d6fb287f64a1/shard-ptl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9e=
da071ebdd0c3d6fb287f64a1/shard-ptl-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c7840=
3c9eda071ebdd0c3d6fb287f64a1/shard-ptl-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c=
78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-2028=
2d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5931-=
20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-6/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-=
ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/sh=
ard-ptl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a=
1/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9286">Intel XE#9286</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-p=
tl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
72475v8/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-172475v8/shard-ptl-5/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-p=
tl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
72475v8/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-172475v8/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-p=
tl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
72475v8/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-p=
tl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
72475v8/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-172475v8/shard-ptl-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-p=
tl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
72475v8/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-172475v8/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason-all:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_oa@no=
n-zero-reason-all.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7334">Intel XE#7334</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_oa@non-zer=
o-reason-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-6/igt@xe_pm@s4=
-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-3/igt@xe_pm@s4-basic-exe=
c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-10/igt@xe_pm@s=
4-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9399">Intel XE#9399</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-7/igt@xe_pm@s4-mult=
iple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_pm@s4=
-vm-bind-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/igt@xe_pm@s=
4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-7/igt@xe_pxp@p=
xp-termination-key-update-post-suspend.html">ABORT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-p=
tl-3/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">PASS</a> +2 o=
ther tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-3/igt@kms_asyn=
c_flips@async-flip-suspend-resume.html">ABORT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9394">Intel XE#9394</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-6/=
igt@kms_async_flips@async-flip-suspend-resume.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9375">Intel XE#9375</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9387">Inte=
l XE#9387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-8/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel X=
E#7343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7935">Intel XE#7935</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-172475v8/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb=
-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-8=
/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-lnl-4=
/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">I=
ntel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-bmg-3/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-bmg-8/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1/shard-ptl-4/igt@xe_pat@p=
at-sw-hw-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v8/shard-ptl-7/igt@xe_pat@pat-sw=
-hw-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9139 -&gt; IGT_9140</li>
<li>Linux: xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1 -&gt; xe-pw-172=
475v8</li>
</ul>
<p>IGT_9139: 3758ada24b618a59d8a5c66e37f0aadc20145d35 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_9140: 3b0daa274edb520204660fa1e15424b66ce0aea0 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5931-20282d4c78403c9eda071ebdd0c3d6fb287f64a1: 20282d4c78403c9eda071eb=
dd0c3d6fb287f64a1<br />
  xe-pw-172475v8: 172475v8</p>

</body>
</html>

--===============4654228713193686483==--
