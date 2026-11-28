Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E04F606A321
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 11:30:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F6E10E511;
	Sat, 28 Nov 2026 11:30:50 +0000 (UTC)
Received: from 8b00d9f022d5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F4610E4A3;
 Sat, 28 Nov 2026 11:30:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1831912484481579770=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/multi=5Fqueue=3A_Ex?=
 =?utf-8?q?pose_CGP_address_via_PPHWSP?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 28 Nov 2026 11:30:49 -0000
Message-ID: <179586544952.4028.655536702670932606@8b00d9f022d5>
X-Patchwork-Hint: ignore
References: <20261127130818.1382215-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20261127130818.1382215-1-tilak.tirumalesh.tangudu@intel.com>
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

--===============1831912484481579770==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/multi_queue: Expose CGP address via PPHWSP
URL   : https://patchwork.freedesktop.org/series/179874/
State : success

== Summary ==

CI Bug Log - changes from xe-6248-c365fe77cc4964431963813514be95adc0cfb56f_FULL -> xe-pw-179874v1_FULL
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

  Here are the changes found in xe-pw-179874v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][1] -> [ABORT][2] ([Intel XE#9841]) +3 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-10/igt@core_hotunplug@hotreplug.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@core_hotunplug@hotreplug.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:
    - shard-ptl:          [PASS][3] -> [FAIL][4] ([Intel XE#6078]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-ptl-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][6] ([Intel XE#5901])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#7085])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#7059] / [Intel XE#7085])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][9] ([Intel XE#5808]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#610] / [Intel XE#7387])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +7 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7679])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#7679])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#367]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2887]) +14 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#5822]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#3432])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2652]) +8 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7358]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
    - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#8391]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252]) +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#2252]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2390] / [Intel XE#6974])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-ptl:          NOTRUN -> [SKIP][27] ([Intel XE#7642])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2320]) +4 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2321] / [Intel XE#7355])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#5900]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#5962])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#9536])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#9528])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#8265]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#5907])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#4156] / [Intel XE#7425]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#8680])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-ptl:          NOTRUN -> [SKIP][38] ([Intel XE#2316])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3:
    - shard-bmg:          [PASS][39] -> [FAIL][40] ([Intel XE#3098])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#301]) +3 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7178] / [Intel XE#7351]) +4 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#7178]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2311]) +53 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#6312]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#4141]) +9 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][48] ([Intel XE#5812]) +20 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#5800] / [Intel XE#6312]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#7061])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#7399])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#7061]) +6 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2313]) +50 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#7865]) +6 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2350] / [Intel XE#7503])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#6911] / [Intel XE#7378])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4090] / [Intel XE#7443])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#7283])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#7283]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-y-tiled:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#9779]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_plane_scaling@plane-upscale-max-crc-y-tiled.html

  * igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#8396]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#8854])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#7794])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-ptl:          NOTRUN -> [FAIL][67] ([Intel XE#7395])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#1489]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][69] ([Intel XE#7304]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2387] / [Intel XE#7429])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#1406])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2330] / [Intel XE#5813])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2413])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#6503])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2426] / [Intel XE#5848])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@cmrr-video-mode:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#9271]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_vrr@cmrr-video-mode.html

  * igt@kms_vrr@flipline@pipe-a-edp-1:
    - shard-ptl:          [PASS][79] -> [FAIL][80] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-ptl-7/igt@kms_vrr@flipline@pipe-a-edp-1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-6/igt@kms_vrr@flipline@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-ptl:          NOTRUN -> [SKIP][81] ([Intel XE#5949] / [Intel XE#9277])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#1499] / [Intel XE#9271]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#8370])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#5764]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_exec_balancer@virtual-all-active:
    - shard-ptl:          NOTRUN -> [SKIP][85] ([Intel XE#7482]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_exec_balancer@virtual-all-active.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2322] / [Intel XE#7372]) +8 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][87] ([Intel XE#5575] / [Intel XE#7484]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][88] ([Intel XE#8374]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#8374]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority:
    - shard-ptl:          NOTRUN -> [SKIP][90] ([Intel XE#8364]) +6 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#8364]) +27 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#8369]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#8378]) +8 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-basic:
    - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#8378]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-mixed-basic.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#6281] / [Intel XE#7426])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-bmg:          NOTRUN -> [ABORT][96] ([Intel XE#9841])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          [PASS][97] -> [ABORT][98] ([Intel XE#9841] / [Intel XE#9845]) +1 other test abort
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-ptl:          NOTRUN -> [SKIP][99] ([Intel XE#5100] / [Intel XE#7408])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_multigpu_svm@mgpu-coherency-conflict:
    - shard-ptl:          NOTRUN -> [SKIP][100] ([Intel XE#6964])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_multigpu_svm@mgpu-coherency-conflict.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#6964]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_page_reclaim@prl-invalidate-full:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#7793]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@xe_page_reclaim@prl-invalidate-full.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-ptl:          NOTRUN -> [SKIP][103] ([Intel XE#5780] / [Intel XE#7590])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-ptl:          NOTRUN -> [SKIP][105] ([Intel XE#5741])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2284] / [Intel XE#7370]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s4-exec-after:
    - shard-ptl:          [PASS][107] -> [ABORT][108] ([Intel XE#9476])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-ptl-2/igt@xe_pm@s4-exec-after.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#944]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-ptl:          NOTRUN -> [SKIP][112] ([Intel XE#6019])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [SKIP][113] ([Intel XE#8749]) -> [PASS][114] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][115] ([Intel XE#7774]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a3.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a3.html

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][117] ([Intel XE#7774]) -> [PASS][118] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a3.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a3.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp2:
    - shard-bmg:          [FAIL][119] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp2.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp2.html

  * igt@xe_ccs@vm-bind-decompress:
    - shard-bmg:          [SKIP][121] ([Intel XE#8589]) -> [PASS][122] +30 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@xe_ccs@vm-bind-decompress.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@xe_ccs@vm-bind-decompress.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [ABORT][123] ([Intel XE#9841]) -> [PASS][124] +2 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [FAIL][125] ([Intel XE#9254]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-6/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-bmg:          [SKIP][127] ([Intel XE#8589]) -> [SKIP][128] ([Intel XE#1124])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][129] ([Intel XE#8589]) -> [SKIP][130] ([Intel XE#2887])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][131] ([Intel XE#8589]) -> [SKIP][132] ([Intel XE#2325] / [Intel XE#7358])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          [SKIP][133] ([Intel XE#8589]) -> [SKIP][134] ([Intel XE#2252]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          [SKIP][135] ([Intel XE#8589]) -> [SKIP][136] ([Intel XE#2321] / [Intel XE#7355])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][137] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][138] ([Intel XE#309] / [Intel XE#7343])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-bmg:          [FAIL][139] ([Intel XE#5408] / [Intel XE#6266]) -> [FAIL][140] ([Intel XE#3098])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][141] ([Intel XE#8589]) -> [SKIP][142] ([Intel XE#2311])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][143] ([Intel XE#8589]) -> [SKIP][144] ([Intel XE#2313]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][145] ([Intel XE#8589]) -> [SKIP][146] ([Intel XE#2393])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][147] ([Intel XE#8589]) -> [SKIP][148] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-bmg:          [SKIP][149] ([Intel XE#8589]) -> [SKIP][150] ([Intel XE#2234] / [Intel XE#2850])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_psr@fbc-psr-cursor-plane-move.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_sharpness_filter@filter-dpms:
    - shard-bmg:          [SKIP][151] ([Intel XE#8589]) -> [SKIP][152] ([Intel XE#6503])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_sharpness_filter@filter-dpms.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_sharpness_filter@filter-dpms.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd:
    - shard-bmg:          [SKIP][153] ([Intel XE#8589]) -> [SKIP][154] ([Intel XE#8364]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5949]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5949
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749
  [Intel XE#8854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9476]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9476
  [Intel XE#9528]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9528
  [Intel XE#9536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9536
  [Intel XE#9779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779
  [Intel XE#9841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841
  [Intel XE#9845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9845


Build changes
-------------

  * Linux: xe-6248-c365fe77cc4964431963813514be95adc0cfb56f -> xe-pw-179874v1

  IGT_9208: 9208
  xe-6248-c365fe77cc4964431963813514be95adc0cfb56f: c365fe77cc4964431963813514be95adc0cfb56f
  xe-pw-179874v1: 179874v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/index.html

--===============1831912484481579770==
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
<tr><td><b>Series:</b></td><td>drm/xe/multi_queue: Expose CGP address via PPHWSP</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179874/">https://patchwork.freedesktop.org/series/179874/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6248-c365fe77cc4964431963813514be95adc0cfb56f_FULL -&gt; xe-pw-179874v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-179874v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-10/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-ptl-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9536">Intel XE#9536</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9528">Intel XE#9528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_dsc@dsc-basic-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443">Intel XE#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-y-tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_plane_scaling@plane-upscale-max-crc-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854">Intel XE#8854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_psr@pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_sharpness_filter@invalid-filter-with-scaler.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-video-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@kms_vrr@cmrr-video-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-ptl-7/igt@kms_vrr@flipline@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-6/igt@kms_vrr@flipline@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5949">Intel XE#5949</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277">Intel XE#9277</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_evict@evict-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@virtual-all-active:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_exec_balancer@virtual-all-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@xe_exec_reset@multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-mixed-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9845">Intel XE#9845</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_mmap@pci-membarrier-bad-pagesize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-conflict:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_multigpu_svm@mgpu-coherency-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-invalidate-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@xe_page_reclaim@prl-invalidate-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-7/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741">Intel XE#5741</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-ptl-2/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9476">Intel XE#9476</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517">Intel XE#7517</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-10/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-ptl-2/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749">Intel XE#8749</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-decompress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@xe_ccs@vm-bind-decompress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@xe_ccs@vm-bind-decompress.html">PASS</a> +30 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-6/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_psr@fbc-psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@kms_sharpness_filter@filter-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@kms_sharpness_filter@filter-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6248-c365fe77cc4964431963813514be95adc0cfb56f/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179874v1/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6248-c365fe77cc4964431963813514be95adc0cfb56f -&gt; xe-pw-179874v1</li>
</ul>
<p>IGT_9208: 9208<br />
  xe-6248-c365fe77cc4964431963813514be95adc0cfb56f: c365fe77cc4964431963813514be95adc0cfb56f<br />
  xe-pw-179874v1: 179874v1</p>

</body>
</html>

--===============1831912484481579770==--
