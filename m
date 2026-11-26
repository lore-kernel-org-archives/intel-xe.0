Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6294C606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 17:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292FB112665;
	Thu, 26 Nov 2026 17:50:16 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AD0112665;
 Thu, 26 Nov 2026 17:50:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6332054706116283250=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/ras=3A_Add_SIGID_lo?=
 =?utf-8?q?gging_for_fabric_errors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Nov 2026 17:50:14 -0000
Message-ID: <179571541455.94780.16128773962287630761@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261126095356.2153941-2-riana.tauro@intel.com>
In-Reply-To: <20261126095356.2153941-2-riana.tauro@intel.com>
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

--===============6332054706116283250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ras: Add SIGID logging for fabric errors
URL   : https://patchwork.freedesktop.org/series/179733/
State : success

== Summary ==

CI Bug Log - changes from xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e_FULL -> xe-pw-179733v1_FULL
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

  New tests have been introduced between xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e_FULL and xe-pw-179733v1_FULL:

### New IGT tests (1) ###

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - Statuses : 1 fail(s)
    - Exec time: [111.88] s

  

Known issues
------------

  Here are the changes found in xe-pw-179733v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2327]) +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#1124]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#607] / [Intel XE#7361])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-ptl:          NOTRUN -> [SKIP][4] ([Intel XE#5808]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][5] ([Intel XE#7679])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
    - shard-bmg:          [PASS][6] -> [SKIP][7] ([Intel XE#367])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][9] ([Intel XE#5822]) +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#3432])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:
    - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#8391])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#7358]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#2252]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2252])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#9671])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +2 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#3304])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-7/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][19] ([Intel XE#6707] / [Intel XE#7439])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-5/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2320])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#5962])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#9530])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-ptl:          NOTRUN -> [SKIP][23] ([Intel XE#5907])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#4422] / [Intel XE#7442])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#2316]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#3098])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#5828]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#7178])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#5800] / [Intel XE#6312]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-slowdraw:
    - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#6312]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_frontbuffer_tracking@drrshdr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#4141])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2311]) +12 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#7061])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][37] ([Intel XE#7865]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2313]) +8 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-plflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#5812]) +19 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#1503])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#6900])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-ptl:          NOTRUN -> [SKIP][43] ([Intel XE#7283]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-yf-tiled:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#9779])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-yf-tiled.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#6814] / [Intel XE#7428])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#7304])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#1489]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][48] ([Intel XE#5858])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#1406]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-ptl:          NOTRUN -> [SKIP][52] ([Intel XE#5821])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#5813])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#6503])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
    - shard-ptl:          [PASS][55] -> [FAIL][56] ([Intel XE#4227] / [Intel XE#7397]) +3 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-ptl-5/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-2/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html

  * igt@xe_err_injection@inject_core_compute_corr_error_once:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#9769])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_err_injection@inject_core_compute_corr_error_once.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#5764]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_evict@evict-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#8370])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_evict@evict-small-multi-queue.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#7482]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#5575] / [Intel XE#7484]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault:
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#8374]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-multi-queue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#8374]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_exec_fault_mode@twice-multi-queue-rebind.html

  * igt@xe_exec_multi_queue@many-execs-close-fd:
    - shard-ptl:          NOTRUN -> [SKIP][65] ([Intel XE#8364]) +6 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_exec_multi_queue@many-execs-close-fd.html

  * igt@xe_exec_multi_queue@many-queues-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#8364]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_exec_multi_queue@many-queues-close-fd.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-many-groups-priority:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#8780])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_exec_threads@threads-multi-queue-mixed-many-groups-priority.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#8378])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#8378])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][70] -> [ABORT][71] ([Intel XE#9841]) +3 other tests abort
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-2/igt@xe_module_load@reload-no-display.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-5/igt@xe_module_load@reload-no-display.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-basic:
    - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#6964])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#6964]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-ptl:          NOTRUN -> [SKIP][74] ([Intel XE#7793])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-ptl:          NOTRUN -> [FAIL][75] ([Intel XE#7695])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pm@s4-basic:
    - shard-ptl:          [PASS][76] -> [DMESG-WARN][77] ([Intel XE#7727])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-ptl-5/igt@xe_pm@s4-basic.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-1/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][78] -> [ABORT][79] ([Intel XE#9362])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-ptl:          [PASS][80] -> [ABORT][81] ([Intel XE#9362]) +2 other tests abort
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-ptl-6/igt@xe_pm@s4-vm-bind-unbind-all.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-6/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_prefetch_fault@l2-prefetch-fault-svm:
    - shard-ptl:          NOTRUN -> [SKIP][82] ([Intel XE#8815])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#944])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_ras@gpu-health:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#9588])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_ras@gpu-health.html

  * igt@xe_wedged@cold-reset-wedged:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#9747])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_wedged@cold-reset-wedged.html

  
#### Possible fixes ####

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][86] ([Intel XE#367]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][88] ([Intel XE#7809]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][90] ([Intel XE#301]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][92] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][93] +1 other test pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@xe_exec_reset@gt-stress-reset-bo-invalidation:
    - shard-bmg:          [DMESG-WARN][94] ([Intel XE#8652]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-2/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-5/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html

  * igt@xe_pm@s4-exec-after:
    - shard-ptl:          [ABORT][96] ([Intel XE#9362]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-ptl-2/igt@xe_pm@s4-exec-after.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [FAIL][98] ([Intel XE#9254]) -> [PASS][99] +1 other test pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][100] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][101] ([Intel XE#309] / [Intel XE#7343])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][102] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][103] ([Intel XE#1729] / [Intel XE#7424])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [ABORT][104] ([Intel XE#9841]) -> [SKIP][105] ([Intel XE#6281] / [Intel XE#7426])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5828]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#8780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8780
  [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9530
  [Intel XE#9588]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9588
  [Intel XE#9671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671
  [Intel XE#9747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9747
  [Intel XE#9769]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9769
  [Intel XE#9779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779
  [Intel XE#9841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841


Build changes
-------------

  * Linux: xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e -> xe-pw-179733v1

  IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e: 3895433515d2f602b53c660afbcd2179f0326e1e
  xe-pw-179733v1: 179733v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/index.html

--===============6332054706116283250==
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
<tr><td><b>Series:</b></td><td>drm/xe/ras: Add SIGID logging for fabric errors</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179733/">https://patchwork.freedesktop.org/series/179733/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e_FULL -&gt; xe-pw-179733v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e_FULL and xe-pw-179733v1_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [111.88] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-179733v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671">Intel XE#9671</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_content_protection@atomic-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-7/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-5/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9530">Intel XE#9530</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828">Intel XE#5828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-slowdraw:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_frontbuffer_tracking@drrshdr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-yf-tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_psr@fbc-pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-ptl-5/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-2/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_err_injection@inject_core_compute_corr_error_once:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_err_injection@inject_core_compute_corr_error_once.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9769">Intel XE#9769</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_evict@evict-beng-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_evict@evict-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_exec_fault_mode@twice-multi-queue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-close-fd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_exec_multi_queue@many-execs-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_exec_multi_queue@many-queues-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-many-groups-priority:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_exec_threads@threads-multi-queue-mixed-many-groups-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8780">Intel XE#8780</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-2/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-5/igt@xe_module_load@reload-no-display.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_pat@pat-sw-hw-reset-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-ptl-5/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-1/igt@xe_pm@s4-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-ptl-6/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-6/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@l2-prefetch-fault-svm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815">Intel XE#8815</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ras@gpu-health:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_ras@gpu-health.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9588">Intel XE#9588</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@cold-reset-wedged:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_wedged@cold-reset-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9747">Intel XE#9747</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-bo-invalidation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-2/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-5/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-ptl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-ptl-8/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-7/igt@xe_pm_residency@gt-c6-freeze@gt1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_pm_residency@gt-c6-freeze@gt1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179733v1/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e -&gt; xe-pw-179733v1</li>
</ul>
<p>IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-6240-3895433515d2f602b53c660afbcd2179f0326e1e: 3895433515d2f602b53c660afbcd2179f0326e1e<br />
  xe-pw-179733v1: 179733v1</p>

</body>
</html>

--===============6332054706116283250==--
