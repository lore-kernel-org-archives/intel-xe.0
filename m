Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0829CCF2C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 19:23:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2FC10E2FD;
	Fri, 16 Oct 2026 19:23:15 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3967110E2FD;
 Fri, 16 Oct 2026 19:23:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4109496832578787294=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/dsc=3A_Fix_QP=2C_?=
 =?utf-8?q?RC_parameters_issues?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Oct 2026 19:23:14 -0000
Message-ID: <179217859420.36079.8992524047200767509@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261016101713.230013-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20261016101713.230013-1-ankit.k.nautiyal@intel.com>
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

--===============4109496832578787294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dsc: Fix QP, RC parameters issues
URL   : https://patchwork.freedesktop.org/series/176294/
State : success

== Summary ==

CI Bug Log - changes from xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d_FULL -> xe-pw-176294v1_FULL
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

  New tests have been introduced between xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d_FULL and xe-pw-176294v1_FULL:

### New IGT tests (1) ###

  * igt@xe_oa@tail-address-wrap@oag-0-8m:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  

Known issues
------------

  Here are the changes found in xe-pw-176294v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#1407]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-ptl:          NOTRUN -> [SKIP][2] ([Intel XE#5901]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#5808]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#8365])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:
    - shard-ptl:          NOTRUN -> [SKIP][6] ([Intel XE#367])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2652]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][9] ([Intel XE#5822]) +5 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][10] ([Intel XE#7084] / [Intel XE#8150])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:
    - shard-ptl:          [PASS][11] -> [ABORT][12] ([Intel XE#7084] / [Intel XE#9378])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#3432])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#306] / [Intel XE#7358])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-ptl:          NOTRUN -> [SKIP][15] ([Intel XE#8391]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#373])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#2252]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#3304]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-7/igt@kms_content_protection@atomic@pipe-a-dp-1.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#6974])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][20] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-6/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#5900])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-ptl:          [PASS][22] -> [ABORT][23] ([Intel XE#9362]) +6 other tests abort
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#5962])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#5962] / [Intel XE#7343])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#9528])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#9535])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-ptl:          NOTRUN -> [SKIP][28] ([Intel XE#5907])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#8265])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#2316]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1421])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][32] -> [FAIL][33] ([Intel XE#301]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#5828]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][37] ([Intel XE#7178]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][38] ([Intel XE#5800] / [Intel XE#6312]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#7061] / [Intel XE#7356])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#6312]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#6312])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7061]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][43] ([Intel XE#5812]) +30 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#656] / [Intel XE#7905]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#7865]) +12 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#7061])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#7865]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#7905]) +7 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#6901])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#6912])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#8303]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#7283]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#5844]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#4596] / [Intel XE#5854])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#6886]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#5849])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#2893] / [Intel XE#7304])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#4608])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#4608] / [Intel XE#7304])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][64] ([Intel XE#5858])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][65] ([Intel XE#7304])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#7413])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1406] / [Intel XE#7345])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-dpms@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms@edp-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-ptl:          [PASS][69] -> [FAIL][70] ([Intel XE#4227] / [Intel XE#7397])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-6/igt@kms_vrr@flip-basic-fastset.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-ptl:          [PASS][71] -> [FAIL][72] ([Intel XE#6293] / [Intel XE#7397])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-6/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-2/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system:
    - shard-ptl:          NOTRUN -> [ABORT][73] ([Intel XE#9362])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-7/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system.html

  * igt@xe_ccs@vm-bind-fault-mode-decompress:
    - shard-ptl:          NOTRUN -> [SKIP][74] ([Intel XE#7644])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@xe_ccs@vm-bind-fault-mode-decompress.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][75] -> [INCOMPLETE][76] ([Intel XE#6321] / [Intel XE#8355])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-ptl:          NOTRUN -> [SKIP][78] ([Intel XE#5764]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_balancer@many-cm-parallel-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#7482]) +6 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@xe_exec_balancer@many-cm-parallel-userptr-rebind.html

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#7482])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1392])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][82] ([Intel XE#5575] / [Intel XE#7484]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#8374]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-imm:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#8374]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-imm.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem:
    - shard-ptl:          NOTRUN -> [SKIP][85] ([Intel XE#8364]) +10 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem.html

  * igt@xe_exec_multi_queue@one-queue-basic-smem:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#8364]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@xe_exec_multi_queue@one-queue-basic-smem.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#8378]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-mixed-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate:
    - shard-ptl:          NOTRUN -> [SKIP][88] ([Intel XE#8378]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate.html

  * igt@xe_mempage_offline@inject-single-page:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#9203])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_mempage_offline@inject-single-page.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-ptl:          NOTRUN -> [SKIP][90] ([Intel XE#5100] / [Intel XE#7408])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#6964])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][92] ([Intel XE#6964])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html

  * igt@xe_pm@d3cold-i2c:
    - shard-ptl:          NOTRUN -> [SKIP][93] ([Intel XE#5741])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][95] ([Intel XE#6867])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic-exec:
    - shard-ptl:          [PASS][96] -> [DMESG-WARN][97] ([Intel XE#7727])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-5/igt@xe_pm@s4-basic-exec.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-8/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][98] -> [ABORT][99] ([Intel XE#9362]) +2 other tests abort
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@aspm_link_residency:
    - shard-ptl:          NOTRUN -> [SKIP][100] ([Intel XE#7271])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_pm_residency@aspm_link_residency.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#8339])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority.html

  * igt@xe_vm@overcommit-nonfault-vram-no-lr:
    - shard-ptl:          NOTRUN -> [SKIP][102] ([Intel XE#9597])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_vm@overcommit-nonfault-vram-no-lr.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][103] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [FAIL][105] ([Intel XE#6078]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          [ABORT][107] ([Intel XE#9362] / [Intel XE#9406]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:
    - shard-ptl:          [ABORT][109] ([Intel XE#7084] / [Intel XE#9362]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][111] ([Intel XE#3321]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][113] ([Intel XE#301]) -> [PASS][114] +2 other tests pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3:
    - shard-bmg:          [FAIL][115] ([Intel XE#3098]) -> [PASS][116] +1 other test pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-1/igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-9/igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-bmg:          [DMESG-WARN][117] ([Intel XE#9365]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-ptl:          [ABORT][119] ([Intel XE#9362]) -> [PASS][120] +4 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-6/igt@kms_vblank@ts-continuation-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic:
    - shard-ptl:          [FAIL][121] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][122] +1 other test pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-2/igt@kms_vrr@flip-basic.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-3/igt@kms_vrr@flip-basic.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-lnl:          [FAIL][123] ([Intel XE#9096] / [Intel XE#9297]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-8/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [SKIP][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-1/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-4/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-4/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-7/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-2/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-2/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-8/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-5/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-5/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-5/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-1/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-4/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-7/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-6/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-3/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-3/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-1/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-7/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-6/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-6/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-6/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-7/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-8/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-8/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-8/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-7/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-4/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-1/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-1/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-3/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-5/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-3/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-3/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-8/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-8/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-7/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-7/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-4/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-5/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-5/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-4/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-1/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-1/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-8/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-7/igt@xe_module_load@load.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][176] ([Intel XE#9362]) -> [PASS][177] +1 other test pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-2/igt@xe_pm@s4-basic.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [ABORT][178] ([Intel XE#9362] / [Intel XE#9406]) -> [INCOMPLETE][179] ([Intel XE#7084] / [Intel XE#8150])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-ptl:          [ABORT][180] ([Intel XE#7084] / [Intel XE#9362]) -> [ABORT][181] ([Intel XE#7084] / [Intel XE#9378])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][182] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][183] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][184] ([Intel XE#3544]) -> [SKIP][185] ([Intel XE#3374] / [Intel XE#3544])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][186] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][187] ([Intel XE#2426] / [Intel XE#5848])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][188] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][189] ([Intel XE#2509] / [Intel XE#7437])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5828]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828
  [Intel XE#5844]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5844
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7271
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9297
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9378
  [Intel XE#9406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9406
  [Intel XE#9528]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9528
  [Intel XE#9535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9535
  [Intel XE#9597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597


Build changes
-------------

  * Linux: xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d -> xe-pw-176294v1

  IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d: 82ab1be49df113aeb03406f683b9b978c56ac87d
  xe-pw-176294v1: 176294v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/index.html

--===============4109496832578787294==
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
<tr><td><b>Series:</b></td><td>drm/i915/dsc: Fix QP, RC parameters issues</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/176294/">https://patchwork.freedesktop.org/series/176294/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-176294v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-176294v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5959-82ab1be49df113aeb03406f683b9b978c=
56ac87d_FULL -&gt; xe-pw-176294v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5959-82ab1be49df113aeb03406f68=
3b9b978c56ac87d_FULL and xe-pw-176294v1_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_oa@tail-address-wrap@oag-0-8m:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-176294v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_big_fb@linear-16bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_big_fb@linear-16bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5901">Intel XE#5901</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_big_fb@x-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_bw@linear-tiling-4-displa=
ys-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_ccs@ccs-on-another-bo-y-t=
iled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-t=
iled-lnl-ccs@pipe-c-dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-4/=
igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Int=
el XE#7084</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9378">Intel XE#9378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_chamelium_color_pipeline@=
plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_chamelium_frames@hdmi-fra=
me-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_chamelium_hpd@hdmi-hpd-st=
orm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-bmg-7/igt@kms_content_protection@atomic=
@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_content_protection@dp-mst=
-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-bmg-6/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_cursor_crc@cursor-rapid-m=
ovement-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5900">Intel XE#5900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-4/igt@kms_curs=
or_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-3/igt@kms_cursor=
_crc@cursor-suspend@pipe-a-edp-1.html">ABORT</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +6 other tes=
ts abort</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5962">Intel XE#5962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_cursor_legacy@cursorb-vs-=
flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5962">Intel XE#5962</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_dp_link_training@non-uhbr=
-mst-tbtalt-train.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9528">Intel XE#9528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9535">Intel XE#9535</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_dsc@dsc-with-bpc-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5907">Intel XE#5907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_flip@2x-flip-vs-blocking-=
wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_flip@2x-flip-vs-dpms-on-n=
op-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-8/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">In=
tel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
85">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5828">Intel XE#5828</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a=
>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_frontbuffer_tracking@drrs=
-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs=
hdr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs=
hdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs=
hdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +30 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbch=
dr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7865">Intel XE#7865</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcp=
srhdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_frontbuffer_tracking@hdr-=
1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_frontbuffer_tracking@psrh=
dr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6912">Intel XE#6912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_plane@pixel-format-4-tile=
d-lnl-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_plane@pixel-format-y-tile=
d-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_plane_lowres@tiling-none@=
pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5844">Intel XE#5844</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_plane_multiple@2x-tiling-=
4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel X=
E#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_pm_rpm@modeset-non-lpsp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5849">Intel XE#5849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#730=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-=
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
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_psr2_sf@pr-overlay-primar=
y-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@kms_psr2_su@page_flip-p010.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@kms_psr@fbc-psr2-dpms@edp-1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-6/igt@kms_vrr@=
flip-basic-fastset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-176294v1/shard-ptl-2/igt@kms_vrr@flip-basic-fastset=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4227">Intel XE#4227</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7397">Intel XE#7397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-6/igt@kms_vrr@=
flip-basic-fastset@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-2/igt@kms_vrr@flip-=
basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-7/igt@xe_ccs@suspend-resume@xmajor-=
compressed-compfmt0-system-system.html">ABORT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-fault-mode-decompress:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@xe_ccs@vm-bind-fault-mode-dec=
ompress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-9/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-1/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE=
#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_evict@evict-mixed-many-thr=
eads-small.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@xe_evict@evict-small-multi-qu=
eue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5764">Intel XE#5764</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@xe_exec_balancer@many-cm-para=
llel-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@xe_exec_balancer@twice-virtua=
l-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-imm:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-6/igt@xe_exec_multi_queue@many-exec=
s-preempt-mode-fault-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +10 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-basic-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@xe_exec_multi_queue@one-queue=
-basic-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8364">Intel XE#8364</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_exec_threads@threads-multi=
-queue-mixed-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_exec_threads@threads-multi=
-queue-shared-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-single-page:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_mempage_offline@inject-sin=
gle-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/9203">Intel XE#9203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_mmap@pci-membarrier-parall=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5100">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_multigpu_svm@mgpu-atomic-o=
p-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_multigpu_svm@mgpu-coherenc=
y-fail-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_pm@d3cold-i2c.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741">In=
tel XE#5741</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/366">Intel XE#366</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_pm@s3-vm-bind-userptr.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6867">Intel XE#6867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-5/igt@xe_pm@s4=
-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-176294v1/shard-ptl-8/igt@xe_pm@s4-basic-exec.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/772=
7">Intel XE#7727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-7/igt@xe_pm@s4=
-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-a=
ll.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/9362">Intel XE#9362</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@aspm_link_residency:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_pm_residency@aspm_link_res=
idency.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7271">Intel XE#7271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_sriov_scheduling@nonpreemp=
t-engine-resets-low-priority.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-no-lr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@xe_vm@overcommit-nonfault-vra=
m-no-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9597">Intel XE#9597</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-9/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6=
078</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
76294v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-9/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#607=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176=
294v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pip=
e-b-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#936=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9406=
">Intel XE#9406</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-176294v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg=
-ccs@pipe-a-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362"=
>Intel XE#9362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-176294v1/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-=
ccs@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-7/igt@kms_flip=
@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-3/igt@kms_fli=
p@flip-vs-expired-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shar=
d-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-1/igt@kms_flip=
@modeset-vs-vblank-race@c-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-9/i=
gt@kms_flip@modeset-vs-vblank-race@c-hdmi-a3.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbchdr-suspend.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg=
-5/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-6/igt@kms_vbla=
nk@ts-continuation-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-1/igt@kms=
_vblank@ts-continuation-suspend.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-2/igt@kms_vrr@=
flip-basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4227">Intel XE#4227</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-ptl-3/igt@kms_vr=
r@flip-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-8/igt@xe_exec_=
threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9297">Int=
el XE#9297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-176294v1/shard-lnl-1/igt@xe_exec_threads@threads-hang-fd-userptr-inva=
lidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-l=
nl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/sha=
rd-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56a=
c87d/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978=
c56ac87d/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9=
b978c56ac87d/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f6=
83b9b978c56ac87d/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb034=
06f683b9b978c56ac87d/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113ae=
b03406f683b9b978c56ac87d/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df1=
13aeb03406f683b9b978c56ac87d/shard-lnl-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be4=
9df113aeb03406f683b9b978c56ac87d/shard-lnl-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-82ab=
1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5959-=
82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-7/igt@xe_module_load=
@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-=
lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/sh=
ard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87=
d/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176=
294v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-176294v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176=
294v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-176294v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl=
-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176=
294v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-176294v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176=
294v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176=
294v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-176294v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-2/igt@xe_pm@s4=
-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-176294v1/shard-lnl-2/igt@xe_pm@s4-basic.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9406">Intel XE#9406=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1762=
94v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7084">Intel XE#7084</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-ptl-4/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1762=
94v1/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084"=
>Intel XE#7084</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9378">Intel XE#9378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-lnl-1/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel X=
E#7343</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-176294v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transi=
tions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-10/igt@kms_hdr=
@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/shard-bmg-7/igt@kms_hdr@br=
ightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-10/igt@kms_til=
ed_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176294v1/sha=
rd-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848"=
>Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d/shard-bmg-9/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel X=
E#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-176294v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d -&gt; xe-pw-176=
294v1</li>
</ul>
<p>IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5959-82ab1be49df113aeb03406f683b9b978c56ac87d: 82ab1be49df113aeb03406f=
683b9b978c56ac87d<br />
  xe-pw-176294v1: 176294v1</p>

</body>
</html>

--===============4109496832578787294==--
