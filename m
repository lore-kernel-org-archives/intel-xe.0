Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF4C606A33E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 05:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E1C10E869;
	Fri, 27 Nov 2026 05:25:09 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B1610E2AB;
 Fri, 27 Nov 2026 05:25:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3884292239410333489=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Support_xe=5Flog?=
 =?utf-8?q?=5F*_helpers_in_atomic_context?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Nov 2026 05:25:08 -0000
Message-ID: <179575710835.96750.4854019093873851302@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
In-Reply-To: <20261126135732.2169939-8-mallesh.koujalagi@intel.com>
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
X-Spam-Status: No, score=0.1 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MPART_ALT_DIFF_COUNT,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3884292239410333489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Support xe_log_* helpers in atomic context
URL   : https://patchwork.freedesktop.org/series/179761/
State : success

== Summary ==

CI Bug Log - changes from xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5_FULL -> xe-pw-179761v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-179761v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-ptl:          NOTRUN -> [SKIP][1] ([Intel XE#3157])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - shard-bmg:          [PASS][2] -> [FAIL][3] ([Intel XE#3718] / [Intel XE#6078]) +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-edp-1:
    - shard-ptl:          [PASS][4] -> [FAIL][5] ([Intel XE#6078]) +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-ptl-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-edp-1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-edp-1.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-ptl:          NOTRUN -> [SKIP][6] ([Intel XE#5901]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327]) +6 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1407]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][9] ([Intel XE#5808]) +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#607] / [Intel XE#7361])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +9 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#7679])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7679])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +9 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#5822]) +6 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2652]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#3432]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2724] / [Intel XE#7449])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2325] / [Intel XE#7358])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-ptl:          NOTRUN -> [SKIP][23] ([Intel XE#5824])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#306] / [Intel XE#7358])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#7358])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7358]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#373]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-ptl:          NOTRUN -> [SKIP][28] ([Intel XE#2252]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2252]) +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#9671])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#9671])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][32] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +4 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7642])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7642])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2321] / [Intel XE#7355])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2320]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-ptl:          NOTRUN -> [SKIP][37] ([Intel XE#5900])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1424]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#5962]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#6035])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1508])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4210] / [Intel XE#7467])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#9528])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#9530])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#9527])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#4331] / [Intel XE#7227])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#8265])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#8265])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:
    - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#5907]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4422] / [Intel XE#7442])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1421])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#301])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7178] / [Intel XE#7349])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#7178] / [Intel XE#7351])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#7179])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#7178]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#7178] / [Intel XE#7351]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][59] ([Intel XE#5800] / [Intel XE#6312]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#656] / [Intel XE#7905]) +11 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#6312]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#4141]) +13 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][64] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][65] ([Intel XE#6312]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2311]) +53 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#7905]) +11 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#5812]) +28 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#7061]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2313]) +65 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7865]) +8 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#7865]) +8 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#9312])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#3374] / [Intel XE#3544])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#6911] / [Intel XE#7466]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][77] ([Intel XE#6900])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-ptl:          NOTRUN -> [SKIP][78] ([Intel XE#7283]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#8303]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#8303]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#7283])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#7283]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#8076])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#4596] / [Intel XE#5854])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#4596] / [Intel XE#5854])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#5020] / [Intel XE#7348])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#9779]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#9779])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010:
    - shard-bmg:          NOTRUN -> [FAIL][89] ([Intel XE#9780]) +3 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-8/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#7794])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2505] / [Intel XE#7447])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#6814] / [Intel XE#7428])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#7304])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#4608])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#4608] / [Intel XE#7304])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][98] ([Intel XE#5858])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][99] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#2893] / [Intel XE#7304])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#1489]) +7 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-ptl:          NOTRUN -> [SKIP][102] ([Intel XE#1406]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1406] / [Intel XE#7345])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-basic@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_psr@fbc-psr2-basic@edp-1.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-ptl:          NOTRUN -> [SKIP][105] ([Intel XE#1406] / [Intel XE#5835]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2234])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr@psr2-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2234] / [Intel XE#2850]) +12 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-2/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#3904] / [Intel XE#7342])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-ptl:          NOTRUN -> [SKIP][109] ([Intel XE#5821])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-ptl:          NOTRUN -> [SKIP][110] ([Intel XE#5813])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#1435] / [Intel XE#8695])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#6503]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#362] / [Intel XE#5848])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2450] / [Intel XE#5857])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic:
    - shard-ptl:          [PASS][115] -> [FAIL][116] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-ptl-8/igt@kms_vrr@flip-basic.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-5/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#1499] / [Intel XE#9271])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_vrr@lobf.html

  * igt@kms_vrr@lobf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#7638] / [Intel XE#9271])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_vrr@lobf@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#1499] / [Intel XE#9271])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:
    - shard-bmg:          NOTRUN -> [ABORT][120] ([Intel XE#8868])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html

  * igt@xe_ccs@vm-bind-fault-mode-decompress:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#7644])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_ccs@vm-bind-fault-mode-decompress.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#6599])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@xe_compute@eu-busy-10s.html

  * igt@xe_configfs@survivability-mode:
    - shard-ptl:          NOTRUN -> [SKIP][123] ([Intel XE#8428])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@xe_configfs@survivability-mode.html

  * igt@xe_err_injection@inject_core_compute_corr_error_once:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#9769])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_err_injection@inject_core_compute_corr_error_once.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][125] ([Intel XE#5764]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#8370]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-1/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][128] ([Intel XE#7482]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html

  * igt@xe_exec_balancer@twice-parallel-basic:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#7482]) +4 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_exec_balancer@twice-parallel-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-ptl:          NOTRUN -> [SKIP][130] ([Intel XE#5575] / [Intel XE#7484]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2322] / [Intel XE#7372]) +9 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#1392]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#8374]) +12 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#8374]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race.html

  * igt@xe_exec_multi_queue@few-execs-basic:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#8364]) +7 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_exec_multi_queue@few-execs-basic.html

  * igt@xe_exec_multi_queue@many-execs-close-fd:
    - shard-ptl:          NOTRUN -> [SKIP][136] ([Intel XE#8364]) +8 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@xe_exec_multi_queue@many-execs-close-fd.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#8364]) +26 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html

  * igt@xe_exec_reset@cm-multi-queue-gt-reset:
    - shard-ptl:          NOTRUN -> [SKIP][138] ([Intel XE#8369])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@xe_exec_reset@cm-multi-queue-gt-reset.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#8369]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-basic:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#8378]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-basic.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-many-groups-priority:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#8780]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-many-groups-priority.html
    - shard-ptl:          NOTRUN -> [SKIP][142] ([Intel XE#8780])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@xe_exec_threads@threads-multi-queue-mixed-many-groups-priority.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#8378]) +5 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][144] ([Intel XE#8378]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-ptl:          NOTRUN -> [SKIP][145] ([Intel XE#5100] / [Intel XE#7408])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][146] -> [ABORT][147] ([Intel XE#9841]) +4 other tests abort
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-bmg-8/igt@xe_module_load@reload-no-display.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-7/igt@xe_module_load@reload-no-display.html

  * igt@xe_multigpu_svm@mgpu-latency-basic:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#6964]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@xe_multigpu_svm@mgpu-latency-basic.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#6964]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#7793]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          NOTRUN -> [FAIL][151] ([Intel XE#7695])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-ptl:          NOTRUN -> [SKIP][152] ([Intel XE#5741])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2284] / [Intel XE#7370])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-ptl:          [PASS][154] -> [ABORT][155] ([Intel XE#9362])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-ptl-3/igt@xe_pm@s4-vm-bind-prefetch.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-ptl:          NOTRUN -> [SKIP][156] ([Intel XE#5611] / [Intel XE#7456])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_prefetch_fault@l2-prefetch-fault-svm:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#8815])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html
    - shard-ptl:          NOTRUN -> [SKIP][158] ([Intel XE#8815])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#944]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_ras@gpu-health:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#9588])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_ras@gpu-health.html

  * igt@xe_sriov_flr@flr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#7569])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_sriov_flr@flr-basic.html

  * igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:
    - shard-ptl:          NOTRUN -> [SKIP][163] ([Intel XE#9597])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html

  * igt@xe_wedged@cold-reset-wedged:
    - shard-bmg:          NOTRUN -> [SKIP][164] ([Intel XE#9747])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_wedged@cold-reset-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][165] ([Intel XE#8963])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][166] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][168] ([Intel XE#301]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [ABORT][170] ([Intel XE#9841]) -> [PASS][171] +3 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][172] ([Intel XE#9362]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-lnl-5/igt@xe_pm@s4-basic.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-bmg:          [ABORT][174] ([Intel XE#9362]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-bmg-2/igt@xe_pm@s4-multiple-execs.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-ptl:          [ABORT][176] ([Intel XE#9362]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-ptl-3/igt@xe_pm@s4-vm-bind-userptr.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][178] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][179] ([Intel XE#1729] / [Intel XE#7424])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [ABORT][180] ([Intel XE#9841]) -> [SKIP][181] ([Intel XE#6281] / [Intel XE#7426])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5611]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5611
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7569
  [Intel XE#7638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7638
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8428
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#8780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8780
  [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527
  [Intel XE#9528]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9528
  [Intel XE#9530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9530
  [Intel XE#9588]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9588
  [Intel XE#9597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597
  [Intel XE#9671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671
  [Intel XE#9747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9747
  [Intel XE#9769]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9769
  [Intel XE#9779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779
  [Intel XE#9780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780
  [Intel XE#9841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841


Build changes
-------------

  * Linux: xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5 -> xe-pw-179761v1

  IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5: 91d4e6d273671ae6821e97e2bebabaa0a553dde5
  xe-pw-179761v1: 179761v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/index.html

--===============3884292239410333489==
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
<tr><td><b>Series:</b></td><td>drm/xe: Support xe_log_* helpers in atomic context</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179761/">https://patchwork.freedesktop.org/series/179761/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5_FULL -&gt; xe-pw-179761v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-179761v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-ptl-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824">Intel XE#5824</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671">Intel XE#9671</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671">Intel XE#9671</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_content_protection@atomic-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9528">Intel XE#9528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9530">Intel XE#9530</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527">Intel XE#9527</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312">Intel XE#9312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076">Intel XE#8076</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-max-crc-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-8/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780">Intel XE#9780</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447">Intel XE#7447</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_psr@fbc-pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_psr@fbc-psr2-basic@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-2/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-ptl-8/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-5/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@kms_vrr@lobf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7638">Intel XE#7638</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@sriov_basic@pf-unbind-with-vfs-enabled-numvfs-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-fault-mode-decompress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_ccs@vm-bind-fault-mode-decompress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@xe_configfs@survivability-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8428">Intel XE#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_err_injection@inject_core_compute_corr_error_once:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_err_injection@inject_core_compute_corr_error_once.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9769">Intel XE#9769</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@xe_evict@evict-beng-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-1/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_exec_balancer@twice-parallel-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_exec_multi_queue@few-execs-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-close-fd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@xe_exec_multi_queue@many-execs-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-gt-reset:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@xe_exec_reset@cm-multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_exec_reset@multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-many-groups-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-many-groups-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8780">Intel XE#8780</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@xe_exec_threads@threads-multi-queue-mixed-many-groups-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8780">Intel XE#8780</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@xe_mmap@pci-membarrier-bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-bmg-8/igt@xe_module_load@reload-no-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-7/igt@xe_module_load@reload-no-display.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>) +4 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@xe_multigpu_svm@mgpu-latency-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_multigpu_svm@mgpu-pagefault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@xe_page_reclaim@boundary-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_pat@pat-sw-hw-reset-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741">Intel XE#5741</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-ptl-3/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5611">Intel XE#5611</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456">Intel XE#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@l2-prefetch-fault-svm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815">Intel XE#8815</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-8/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815">Intel XE#8815</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-1/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_ras@gpu-health:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_ras@gpu-health.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9588">Intel XE#9588</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_sriov_flr@flr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7569">Intel XE#7569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597">Intel XE#9597</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@cold-reset-wedged:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_wedged@cold-reset-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9747">Intel XE#9747</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-lnl-5/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-lnl-2/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-bmg-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-3/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-ptl-3/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-ptl-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179761v1/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5 -&gt; xe-pw-179761v1</li>
</ul>
<p>IGT_9204: 52e9317c945f97f29fbec75be29280fc7b00cf32 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-6242-91d4e6d273671ae6821e97e2bebabaa0a553dde5: 91d4e6d273671ae6821e97e2bebabaa0a553dde5<br />
  xe-pw-179761v1: 179761v1</p>

</body>
</html>

--===============3884292239410333489==--
