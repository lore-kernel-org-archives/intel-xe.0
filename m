Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FF1606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 19:04:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC4210E3F1;
	Wed, 11 Nov 2026 19:04:30 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF83B10E3D5;
 Wed, 11 Nov 2026 19:04:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3668188141229235446=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/ltphy=3A_Fix_the_?=
 =?utf-8?q?HDMI_PLL_setup_for_a_DCO_below_11=2E85_GHz?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xiao Lu" <xiaolu.xie@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Nov 2026 19:04:28 -0000
Message-ID: <179442386871.11778.314071250758900845@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261111111218.23625-1-xiaolu.xie@intel.com>
In-Reply-To: <20261111111218.23625-1-xiaolu.xie@intel.com>
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

--===============3668188141229235446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/ltphy: Fix the HDMI PLL setup for a DCO below 11.85 GHz
URL   : https://patchwork.freedesktop.org/series/178308/
State : success

== Summary ==

CI Bug Log - changes from xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce_FULL -> xe-pw-178308v1_FULL
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

  Here are the changes found in xe-pw-178308v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][1] ([Intel XE#5808]) +5 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#1124]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#367])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#367])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-ptl:          NOTRUN -> [SKIP][6] ([Intel XE#367])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#5822]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2325] / [Intel XE#7358])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-ptl:          NOTRUN -> [SKIP][10] ([Intel XE#8391]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#7358])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#2252])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2252]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#6969]) +7 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#6969]) +7 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#7642])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#3304] / [Intel XE#7374])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-7/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7642])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#5900]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#8265])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#5907])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#8680])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2374] / [Intel XE#6128])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#2316]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
    - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#3098]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#301]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#7178])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#5800] / [Intel XE#6312]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2311]) +15 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#4141]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#6312]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#7061] / [Intel XE#7356])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#5812]) +22 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#7061])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-modesetfrombusy:
    - shard-ptl:          NOTRUN -> [SKIP][37] ([Intel XE#7865]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2313]) +10 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#1503])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-9/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#4298] / [Intel XE#5873])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#7173])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#8303]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#7283]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#5858])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#1489])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_psr@pr-dpms:
    - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#1406]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_psr@pr-dpms.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#7795])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#5821])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2509] / [Intel XE#7437])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2450] / [Intel XE#5857])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#8608])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-beng-threads-small-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#5764]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_evict@evict-beng-threads-small-multi-vm.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][56] ([Intel XE#7482]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2322] / [Intel XE#7372])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#5575] / [Intel XE#7484]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][59] ([Intel XE#8374])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#8364]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr-invalidate:
    - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#8364]) +6 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#8369])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#8378]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#8378])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#6964])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#6964])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_multigpu_svm@mgpu-migration-basic.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#7793])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_page_reclaim@pde-vs-pd:
    - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#7793])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_page_reclaim@pde-vs-pd.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#7590])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_peer2peer@write:
    - shard-ptl:          NOTRUN -> [SKIP][70] ([Intel XE#6588])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_peer2peer@write.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][71] -> [DMESG-WARN][72] ([Intel XE#7727])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-lnl-4/igt@xe_pm@s4-basic.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-ptl:          [PASS][73] -> [ABORT][74] ([Intel XE#9362]) +1 other test abort
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-ptl-7/igt@xe_pm@s4-basic-exec.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-8/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-ptl:          [PASS][75] -> [DMESG-WARN][76] ([Intel XE#7727])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-ptl-8/igt@xe_pm@s4-exec-after.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-8/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [PASS][77] -> [FAIL][78] ([Intel XE#9254])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#7599])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> [FAIL][80] ([Intel XE#6569])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_vm@bind-array-enobufs:
    - shard-bmg:          NOTRUN -> [FAIL][81] ([Intel XE#9424])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_vm@bind-array-enobufs.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-ptl:          NOTRUN -> [DMESG-WARN][82] ([Intel XE#8963])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:
    - shard-bmg:          [FAIL][83] -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html

  * igt@xe_pm@s4-basic:
    - shard-ptl:          [ABORT][85] ([Intel XE#9362]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-ptl-7/igt@xe_pm@s4-basic.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_pm@s4-basic.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [FAIL][87] ([Intel XE#9254]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][89] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][90] ([Intel XE#2426] / [Intel XE#5848])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_pm@s4-mocs:
    - shard-ptl:          [DMESG-WARN][91] ([Intel XE#7727]) -> [ABORT][92] ([Intel XE#9362])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-ptl-8/igt@xe_pm@s4-mocs.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-4/igt@xe_pm@s4-mocs.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6588]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6588
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7173
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9424


Build changes
-------------

  * Linux: xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce -> xe-pw-178308v1

  IGT_9186: 9186
  xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce: d3101922ce7dc9cf968e18e24e936c8383f0f5ce
  xe-pw-178308v1: 178308v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/index.html

--===============3668188141229235446==
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
<tr><td><b>Series:</b></td><td>drm/i915/ltphy: Fix the HDMI PLL setup for a DCO below 11.85 GHz</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178308/">https://patchwork.freedesktop.org/series/178308/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce_FULL -&gt; xe-pw-178308v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-178308v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-7/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128">Intel XE#6128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-modesetfrombusy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_frontbuffer_tracking@hdr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7173">Intel XE#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_evict@evict-beng-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr-invalidate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_exec_reset@multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_multigpu_svm@mgpu-migration-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pde-vs-pd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_page_reclaim@pde-vs-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6588">Intel XE#6588</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-lnl-4/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-lnl-2/igt@xe_pm@s4-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-ptl-7/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-8/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-ptl-8/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-8/igt@xe_pm@s4-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_prefetch_fault@prefetch-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-enobufs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-4/igt@xe_vm@bind-array-enobufs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9424">Intel XE#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-ptl-7/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-6/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce/shard-ptl-8/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178308v1/shard-ptl-4/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce -&gt; xe-pw-178308v1</li>
</ul>
<p>IGT_9186: 9186<br />
  xe-6109-d3101922ce7dc9cf968e18e24e936c8383f0f5ce: d3101922ce7dc9cf968e18e24e936c8383f0f5ce<br />
  xe-pw-178308v1: 178308v1</p>

</body>
</html>

--===============3668188141229235446==--
