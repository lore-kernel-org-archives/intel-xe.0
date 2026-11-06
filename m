Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10355606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 08:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B9911281F;
	Fri,  6 Nov 2026 08:32:47 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1854B11281F;
 Fri,  6 Nov 2026 08:32:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3788340975996102687=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Fix_VF_probe_issue_due_to_?=
 =?utf-8?q?missing_LMTT_dir_ptr_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Nov 2026 08:32:46 -0000
Message-ID: <179395396609.130684.16560558658199803880@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261105114923.880265-3-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261105114923.880265-3-satyanarayana.k.v.p@intel.com>
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

--===============3788340975996102687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix VF probe issue due to missing LMTT dir ptr (rev2)
URL   : https://patchwork.freedesktop.org/series/177598/
State : success

== Summary ==

CI Bug Log - changes from xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55_FULL -> xe-pw-177598v2_FULL
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

  Here are the changes found in xe-pw-177598v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-ptl:          [PASS][1] -> [FAIL][2] ([Intel XE#6078]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-ptl-4/igt@kms_async_flips@alternate-sync-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#6078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][6] ([Intel XE#5808]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#7679])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#367])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-ptl:          NOTRUN -> [SKIP][10] ([Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][11] -> [INCOMPLETE][12] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#5822]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#9311])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2252])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#5824])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7358])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#9671])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2390] / [Intel XE#6974])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#7642])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#6707] / [Intel XE#7439])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-6/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2320]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2321] / [Intel XE#7355])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#5962]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_dp_link_training@uhbr-mst-tbtalt-train:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#9531])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#8265])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-ptl:          NOTRUN -> [SKIP][28] ([Intel XE#5907]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#2316])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-ptl:          [PASS][30] -> [FAIL][31] ([Intel XE#3321]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-ptl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#7178])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7178] / [Intel XE#7351])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#5800] / [Intel XE#6312]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2311]) +16 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrshdr-slowdraw:
    - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#6312]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_frontbuffer_tracking@drrshdr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4141]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7061]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2313]) +18 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#7061] / [Intel XE#7356])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
    - shard-ptl:          NOTRUN -> [SKIP][41] ([Intel XE#7865]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#5812]) +11 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7061] / [Intel XE#7356])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-bmg:          NOTRUN -> [FAIL][44] ([Intel XE#9313])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#1503])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-9/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#7173])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7283])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#6886]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#8396]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#1489]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#5858])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2387] / [Intel XE#7429])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#3904] / [Intel XE#7342])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_vrr@flip-basic:
    - shard-ptl:          [PASS][59] -> [FAIL][60] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-ptl-6/igt@kms_vrr@flip-basic.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-3/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#1499] / [Intel XE#9271])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_compute@eu-busy-10s:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#6599])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_compute@eu-busy-10s.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#5878])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#8608])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][65] ([Intel XE#5764]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#8370])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#7482]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-ptl:          NOTRUN -> [SKIP][69] ([Intel XE#5575] / [Intel XE#7484])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-multi-queue-imm:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#8374]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][71] ([Intel XE#8374]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#8364]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr.html

  * igt@xe_exec_multi_queue@two-queues-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#8364]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-priority-smem.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#8378]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic:
    - shard-ptl:          NOTRUN -> [SKIP][75] ([Intel XE#8378])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-ptl:          NOTRUN -> [SKIP][76] ([Intel XE#7954])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_multigpu_svm@mgpu-coherency-basic:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#6964])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_multigpu_svm@mgpu-coherency-basic.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][78] ([Intel XE#6964])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_page_reclaim@pat-index-xd:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#7793])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_page_reclaim@pat-index-xd.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#7793])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-ptl:          NOTRUN -> [FAIL][81] ([Intel XE#7695])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][82] -> [ABORT][83] ([Intel XE#9362])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-lnl-3/igt@xe_pm@s4-exec-after.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-ptl:          [PASS][84] -> [ABORT][85] ([Intel XE#9362])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-ptl-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#4733] / [Intel XE#7417])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#944]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_survivability@runtime-survivability:
    - shard-ptl:          NOTRUN -> [SKIP][88] ([Intel XE#8415] / [Intel XE#8432])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_survivability@runtime-survivability.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          [FAIL][89] ([Intel XE#6078]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][91] ([Intel XE#301]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-ptl:          [FAIL][93] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-ptl-4/igt@kms_vrr@flip-basic-fastset.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-ptl:          [FAIL][95] ([Intel XE#6293] / [Intel XE#7397]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-ptl-4/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
    - shard-bmg:          [ABORT][97] ([Intel XE#9463]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [DMESG-WARN][99] ([Intel XE#7727]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-lnl-4/igt@xe_pm@s4-basic.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-lnl-4/igt@xe_pm@s4-basic.html

  * igt@xe_pm_residency@idle-residency:
    - shard-bmg:          [FAIL][101] ([Intel XE#9254]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-bmg-4/igt@xe_pm_residency@idle-residency.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-3/igt@xe_pm_residency@idle-residency.html

  * igt@xe_pm_residency@idle-residency@gt0:
    - shard-bmg:          [FAIL][103] ([Intel XE#9725]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-bmg-4/igt@xe_pm_residency@idle-residency@gt0.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-3/igt@xe_pm_residency@idle-residency@gt0.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5878]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5878
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7173
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415
  [Intel XE#8432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9311
  [Intel XE#9313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9531
  [Intel XE#9671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671
  [Intel XE#9725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9725


Build changes
-------------

  * Linux: xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55 -> xe-pw-177598v2

  IGT_9177: 9177
  xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55: d076071d544fe6745f6fd7553e532c8a13a0cb55
  xe-pw-177598v2: 177598v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/index.html

--===============3788340975996102687==
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
<tr><td><b>Series:</b></td><td>Fix VF probe issue due to missing LMTT dir ptr (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177598/">https://patchwork.freedesktop.org/series/177598/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55_FULL -&gt; xe-pw-177598v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177598v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-ptl-4/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-8/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_ccs@random-ccs-data-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_cdclk@mode-rejected-max-dotclock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9311">Intel XE#9311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824">Intel XE#5824</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671">Intel XE#9671</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-6/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_dp_link_training@uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9531">Intel XE#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-ptl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-slowdraw:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_frontbuffer_tracking@drrshdr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313">Intel XE#9313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7173">Intel XE#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-ptl-6/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-3/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5878">Intel XE#5878</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_evict@evict-beng-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_multigpu_svm@mgpu-coherency-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pat-index-xd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_page_reclaim@pat-index-xd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_pat@pat-sw-hw-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-lnl-3/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-ptl-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-10/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-2/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415">Intel XE#8415</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432">Intel XE#8432</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-ptl-4/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-8/igt@kms_vrr@flip-basic-fastset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-ptl-4/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-ptl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-lnl-4/igt@xe_pm@s4-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-lnl-4/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-bmg-4/igt@xe_pm_residency@idle-residency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-3/igt@xe_pm_residency@idle-residency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55/shard-bmg-4/igt@xe_pm_residency@idle-residency@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9725">Intel XE#9725</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177598v2/shard-bmg-3/igt@xe_pm_residency@idle-residency@gt0.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55 -&gt; xe-pw-177598v2</li>
</ul>
<p>IGT_9177: 9177<br />
  xe-6069-d076071d544fe6745f6fd7553e532c8a13a0cb55: d076071d544fe6745f6fd7553e532c8a13a0cb55<br />
  xe-pw-177598v2: 177598v2</p>

</body>
</html>

--===============3788340975996102687==--
