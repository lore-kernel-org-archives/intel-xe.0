Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46059606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 16:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ABB10F19F;
	Thu,  5 Nov 2026 16:55:11 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A545A10F19F;
 Thu,  5 Nov 2026 16:55:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2367760503789529833=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Flush_L2_asynchr?=
 =?utf-8?q?onously_in_xe=5Fbo=5Ftrigger=5Frebind=28=29_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Nov 2026 16:55:09 -0000
Message-ID: <179389770966.127781.5948259549060742630@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261104221459.1534188-1-matthew.brost@intel.com>
In-Reply-To: <20261104221459.1534188-1-matthew.brost@intel.com>
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

--===============2367760503789529833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Flush L2 asynchronously in xe_bo_trigger_rebind() (rev5)
URL   : https://patchwork.freedesktop.org/series/170046/
State : success

== Summary ==

CI Bug Log - changes from xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d_FULL -> xe-pw-170046v5_FULL
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

  New tests have been introduced between xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d_FULL and xe-pw-170046v5_FULL:

### New IGT tests (5) ###

  * igt@fbdev@pan:
    - Statuses : 3 pass(s)
    - Exec time: [0.08, 0.09] s

  * igt@kms_pm_lpsp@kms-lpsp@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.26] s

  * igt@xe_exec_store@cachelines:
    - Statuses : 3 pass(s)
    - Exec time: [0.11, 0.28] s

  * igt@xe_exec_store@page-sized:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@xe_vm@partial-unbinds:
    - Statuses : 3 pass(s)
    - Exec time: [0.02, 0.05] s

  

Known issues
------------

  Here are the changes found in xe-pw-170046v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-ptl:          [PASS][1] -> [FAIL][2] ([Intel XE#6078]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-ptl-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +6 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-ptl:          NOTRUN -> [SKIP][5] ([Intel XE#5808]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2328] / [Intel XE#7367])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#367]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +8 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-ptl:          NOTRUN -> [SKIP][9] ([Intel XE#5822]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#3432])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#2252])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#7358]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2252]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#6969]) +7 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#7642])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2320]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-ptl:          NOTRUN -> [SKIP][20] ([Intel XE#5900]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2286] / [Intel XE#6035])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#9531])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst-direct-train:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#9529])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_dp_link_training@uhbr-sst-direct-train.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#8265]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#4422] / [Intel XE#7442])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#4156] / [Intel XE#7425])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#1138] / [Intel XE#7344])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-ptl:          NOTRUN -> [SKIP][28] ([Intel XE#2316])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-ptl:          [PASS][29] -> [FAIL][30] ([Intel XE#3098]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-ptl-7/igt@kms_flip@dpms-vs-vblank-race.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-1/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-ptl:          [PASS][31] -> [FAIL][32] ([Intel XE#3321]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-ptl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
    - shard-lnl:          [PASS][33] -> [FAIL][34] ([Intel XE#301]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#7179])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2311]) +36 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#4141]) +6 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#6312]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#5812]) +13 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7061]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#7061]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2313]) +23 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#7865]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2486])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#8303]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#7283])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7283]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2393])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#5020] / [Intel XE#7348]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#8396]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#8396]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2505] / [Intel XE#7447])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#1489]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_psr@psr-basic.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#5821])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_sharpness_filter@filter-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#6503]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_sharpness_filter@filter-dpms.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1499] / [Intel XE#9271])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#8608])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#7482]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#5575] / [Intel XE#7484]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#8374]) +6 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-imm:
    - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#8374]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@xe_exec_fault_mode@twice-multi-queue-imm.html

  * igt@xe_exec_multi_queue@max-queues-basic:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#8364]) +15 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@xe_exec_multi_queue@max-queues-basic.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-dyn-priority:
    - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#8364]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-dyn-priority.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-basic:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#8378]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][70] ([Intel XE#8378]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@xe_mmap@small-bar.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#6964]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@xe_peer2peer@read.html

  * igt@xe_pm@s4-mocs:
    - shard-ptl:          [PASS][74] -> [ABORT][75] ([Intel XE#9362])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-ptl-4/igt@xe_pm@s4-mocs.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-4/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [PASS][76] -> [FAIL][77] ([Intel XE#9254]) +1 other test fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#4733] / [Intel XE#7417])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#6019]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#944]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> [FAIL][81] ([Intel XE#6569])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][82] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][84] ([Intel XE#301]) -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][86] ([Intel XE#1503]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          [FAIL][88] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][89] +1 other test pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-ptl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_exec_reset@gt-stress-reset-concurrent-submit-sync:
    - shard-lnl:          [DMESG-WARN][90] ([Intel XE#8652]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-lnl-4/igt@xe_exec_reset@gt-stress-reset-concurrent-submit-sync.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-lnl-5/igt@xe_exec_reset@gt-stress-reset-concurrent-submit-sync.html

  * igt@xe_pm@s2idle-mocs:
    - shard-ptl:          [ABORT][92] ([Intel XE#9362]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-ptl-6/igt@xe_pm@s2idle-mocs.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm_residency@idle-residency:
    - shard-bmg:          [FAIL][94] ([Intel XE#9254]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-bmg-2/igt@xe_pm_residency@idle-residency.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@xe_pm_residency@idle-residency.html

  * igt@xe_pm_residency@idle-residency@gt0:
    - shard-bmg:          [FAIL][96] ([Intel XE#9725]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-bmg-2/igt@xe_pm_residency@idle-residency@gt0.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@xe_pm_residency@idle-residency@gt0.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][98] ([Intel XE#9365]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-bmg-9/igt@xe_survivability@runtime-survivability.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-2/igt@xe_survivability@runtime-survivability.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][100] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][101] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][102] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][103] ([Intel XE#1729] / [Intel XE#7424])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][104] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][105] ([Intel XE#2509] / [Intel XE#7437])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9529]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9529
  [Intel XE#9531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9531
  [Intel XE#9725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9725


Build changes
-------------

  * Linux: xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d -> xe-pw-170046v5

  IGT_9177: 9177
  xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d: 3379b0f74f31bfc3746b692822a7700aeeebe15d
  xe-pw-170046v5: 170046v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/index.html

--===============2367760503789529833==
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
<tr><td><b>Series:</b></td><td>drm/xe: Flush L2 asynchronously in xe_bo_trigger_rebind() (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170046/">https://patchwork.freedesktop.org/series/170046/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d_FULL -&gt; xe-pw-170046v5_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d_FULL and xe-pw-170046v5_FULL:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.08, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@cachelines:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.11, 0.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@page-sized:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_vm@partial-unbinds:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-170046v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-ptl-5/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-7/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9531">Intel XE#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst-direct-train:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_dp_link_training@uhbr-sst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9529">Intel XE#9529</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-ptl-7/igt@kms_flip@dpms-vs-vblank-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-1/igt@kms_flip@dpms-vs-vblank-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-ptl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-yuv420.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447">Intel XE#7447</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_sharpness_filter@filter-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@xe_exec_basic@multigpu-once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-imm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@xe_exec_fault_mode@twice-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@xe_exec_multi_queue@max-queues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-dyn-priority:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-ptl-4/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-4/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@xe_pm_residency@gt-c6-freeze@gt1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-9/igt@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-ptl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-concurrent-submit-sync:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-lnl-4/igt@xe_exec_reset@gt-stress-reset-concurrent-submit-sync.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-lnl-5/igt@xe_exec_reset@gt-stress-reset-concurrent-submit-sync.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-ptl-6/igt@xe_pm@s2idle-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-ptl-8/igt@xe_pm@s2idle-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-bmg-2/igt@xe_pm_residency@idle-residency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@xe_pm_residency@idle-residency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-bmg-2/igt@xe_pm_residency@idle-residency@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9725">Intel XE#9725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@xe_pm_residency@idle-residency@gt0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-bmg-9/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-2/igt@xe_survivability@runtime-survivability.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v5/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d -&gt; xe-pw-170046v5</li>
</ul>
<p>IGT_9177: 9177<br />
  xe-6064-3379b0f74f31bfc3746b692822a7700aeeebe15d: 3379b0f74f31bfc3746b692822a7700aeeebe15d<br />
  xe-pw-170046v5: 170046v5</p>

</body>
</html>

--===============2367760503789529833==--
