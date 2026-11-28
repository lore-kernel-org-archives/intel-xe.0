Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF2C606A31E
	for <intel-xe@archiver.kernel.org>; Sat, 28 Nov 2026 05:32:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD1310E0E2;
	Sat, 28 Nov 2026 05:32:25 +0000 (UTC)
Received: from 8b00d9f022d5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACA510E0E2;
 Sat, 28 Nov 2026 05:32:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8568733627634204413=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Interruptible_bb_wait_+_re?=
 =?utf-8?q?lated_bits_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 28 Nov 2026 05:32:24 -0000
Message-ID: <179584394428.3493.2205225648250613122@8b00d9f022d5>
X-Patchwork-Hint: ignore
References: <20261127-migrate-bb-optimise-v2-0-808d0d520ddb@intel.com>
In-Reply-To: <20261127-migrate-bb-optimise-v2-0-808d0d520ddb@intel.com>
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

--===============8568733627634204413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Interruptible bb wait + related bits (rev2)
URL   : https://patchwork.freedesktop.org/series/177249/
State : success

== Summary ==

CI Bug Log - changes from xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d_FULL -> xe-pw-177249v2_FULL
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

  Here are the changes found in xe-pw-177249v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2233])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-ptl:          NOTRUN -> [SKIP][2] ([Intel XE#5765])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#3718] / [Intel XE#6078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#6078])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#5947])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#5901]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][9] ([Intel XE#6925])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2327]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#5808]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +11 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#7679])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7679])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#367]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#5822]) +4 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +16 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2652]) +8 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#3432]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2325] / [Intel XE#7358])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-3/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7358]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html
    - shard-ptl:          NOTRUN -> [SKIP][23] ([Intel XE#8391])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#2252]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2252]) +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#9671])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-ptl:          NOTRUN -> [SKIP][27] ([Intel XE#7642])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][28] ([Intel XE#3304] / [Intel XE#7374])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2390] / [Intel XE#6974])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6974])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][31] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +4 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][32] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2320]) +4 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#5846])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2321] / [Intel XE#7355])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#5900]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-6/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-ptl:          NOTRUN -> [SKIP][37] ([Intel XE#5962])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][38] ([Intel XE#6035])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2286] / [Intel XE#6035])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#9528])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#9527])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst-direct-train.html
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#9527])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-4/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-ptl:          NOTRUN -> [SKIP][43] ([Intel XE#5907]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#8265]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2374] / [Intel XE#6128])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#2316]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-4/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-bmg:          [PASS][47] -> [FAIL][48] ([Intel XE#5408] / [Intel XE#6266]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][49] -> [FAIL][50] ([Intel XE#301])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7178] / [Intel XE#7349]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-ptl:          NOTRUN -> [SKIP][52] ([Intel XE#7178]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7178] / [Intel XE#7351]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7179])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#5800] / [Intel XE#6312]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2311]) +51 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#6312]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-3/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#7061])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4141]) +12 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#7061] / [Intel XE#7356])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-8/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#5812]) +30 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#7865]) +11 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#7061]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2313]) +63 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#7061] / [Intel XE#7356]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#6900])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#6912] / [Intel XE#7375])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#8303]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#7283]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][70] ([Intel XE#7283]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#8076])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2393])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_plane_lowres@tiling-yf.html
    - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#5946])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#5020] / [Intel XE#7348])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-yf-tiled:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#9779])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-yf-tiled.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#6927] / [Intel XE#8854])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-ptl:          NOTRUN -> [SKIP][80] ([Intel XE#7304]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-ptl:          NOTRUN -> [SKIP][81] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][82] ([Intel XE#5858])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#1489]) +7 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#7413])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2387] / [Intel XE#7429])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@pr-no-drrs:
    - shard-ptl:          NOTRUN -> [SKIP][86] ([Intel XE#1406]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2234] / [Intel XE#2850]) +13 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#3904] / [Intel XE#7342]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#1435] / [Intel XE#8695])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sharpness_filter@filter-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#6503]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_sharpness_filter@filter-dpms.html

  * igt@kms_vrr@cmrr-desktop-mode:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#9271])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@kms_vrr@cmrr-desktop-mode.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#1499] / [Intel XE#9271]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-3/igt@kms_vrr@max-min.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-bmg:          NOTRUN -> [ABORT][93] ([Intel XE#8868])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@sriov_basic@pf-unbind-with-vf-probed.html
    - shard-ptl:          NOTRUN -> [ABORT][94] ([Intel XE#8868])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-3/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#6599])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_configfs@engines-allowed:
    - shard-bmg:          [PASS][96] -> [ABORT][97] ([Intel XE#9841]) +1 other test abort
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-9/igt@xe_configfs@engines-allowed.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-7/igt@xe_configfs@engines-allowed.html

  * igt@xe_evict@evict-beng-large-cm:
    - shard-ptl:          NOTRUN -> [SKIP][98] ([Intel XE#5764]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-7/igt@xe_evict@evict-beng-large-cm.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#8370]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_exec_balancer@twice-cm-virtual-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][100] ([Intel XE#7482]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-7/igt@xe_exec_balancer@twice-cm-virtual-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2322] / [Intel XE#7372]) +7 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-ptl:          NOTRUN -> [SKIP][102] ([Intel XE#5575] / [Intel XE#7484]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-4/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@many-multi-queue-imm:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#8374]) +7 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault:
    - shard-ptl:          NOTRUN -> [SKIP][104] ([Intel XE#8374]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-4/igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault.html

  * igt@xe_exec_multi_queue@sanity:
    - shard-ptl:          NOTRUN -> [SKIP][105] ([Intel XE#8364]) +12 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@xe_exec_multi_queue@sanity.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#8364]) +29 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#8369]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@xe_exec_reset@cm-multi-queue-cat-error.html
    - shard-ptl:          NOTRUN -> [SKIP][108] ([Intel XE#8369])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-6/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
    - shard-ptl:          NOTRUN -> [SKIP][109] ([Intel XE#6196])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][110] ([Intel XE#8378]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-4/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#8378]) +8 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-ptl:          NOTRUN -> [SKIP][112] ([Intel XE#7070])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_mempage_offline@inject-duplicate-page:
    - shard-ptl:          NOTRUN -> [SKIP][113] ([Intel XE#9203])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@xe_mempage_offline@inject-duplicate-page.html

  * igt@xe_mempage_offline@inject-single-page:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#9203])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-4/igt@xe_mempage_offline@inject-single-page.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#6964]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-2/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html

  * igt@xe_multigpu_svm@mgpu-coherency-conflict:
    - shard-ptl:          NOTRUN -> [SKIP][116] ([Intel XE#6964])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-8/igt@xe_multigpu_svm@mgpu-coherency-conflict.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-ptl:          NOTRUN -> [SKIP][117] ([Intel XE#7793])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-7/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_page_reclaim@binds-1g-partial:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#7793]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-7/igt@xe_page_reclaim@binds-1g-partial.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#1420] / [Intel XE#7590])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-bmg:          NOTRUN -> [FAIL][120] ([Intel XE#7695])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-1/igt@xe_peer2peer@write.html
    - shard-ptl:          NOTRUN -> [SKIP][122] ([Intel XE#6588])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3hot-i2c:
    - shard-ptl:          NOTRUN -> [SKIP][123] ([Intel XE#5742] / [Intel XE#7400])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-8/igt@xe_pm@d3hot-i2c.html
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-4/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2284] / [Intel XE#7370]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-ptl:          [PASS][126] -> [ABORT][127] ([Intel XE#9362])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-ptl-8/igt@xe_pm@s4-multiple-execs.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-1/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-4/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-ptl:          NOTRUN -> [SKIP][129] ([Intel XE#6019]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#944]) +4 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:
    - shard-ptl:          NOTRUN -> [SKIP][131] ([Intel XE#9597])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][132] ([Intel XE#8963])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-ptl:          NOTRUN -> [DMESG-WARN][133] ([Intel XE#8963])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-lnl:          [FAIL][134] ([Intel XE#3098]) -> [PASS][135] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-lnl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-lnl-4/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][136] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][138] ([Intel XE#301]) -> [PASS][139] +2 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          [DMESG-WARN][140] ([Intel XE#9513]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][142] ([Intel XE#1503]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010:
    - shard-bmg:          [FAIL][144] ([Intel XE#9780]) -> [PASS][145] +15 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][146] ([Intel XE#8618]) -> [PASS][147] +2 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-5/igt@kms_setmode@basic.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_setmode@basic.html

  * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
    - shard-ptl:          [FAIL][148] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][149] +3 other tests pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-ptl-8/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-3/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck:
    - shard-bmg:          [INCOMPLETE][150] ([Intel XE#8159]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset:
    - shard-bmg:          [DMESG-FAIL][152] -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-bmg:          [ABORT][154] ([Intel XE#9841]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [ABORT][156] ([Intel XE#9841] / [Intel XE#9845]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-bmg:          [ABORT][158] ([Intel XE#9399]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-1/igt@xe_pm@s4-vm-bind-unbind-all.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [FAIL][160] ([Intel XE#6569]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][162] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][163] ([Intel XE#301])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][164] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][165] ([Intel XE#2426] / [Intel XE#5848])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
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
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946
  [Intel XE#5947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5947
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6588]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6588
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7070
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#8076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9513]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9513
  [Intel XE#9527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527
  [Intel XE#9528]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9528
  [Intel XE#9597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597
  [Intel XE#9671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671
  [Intel XE#9779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779
  [Intel XE#9780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780
  [Intel XE#9841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841
  [Intel XE#9845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9845


Build changes
-------------

  * IGT: IGT_9206 -> IGT_9208
  * Linux: xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d -> xe-pw-177249v2

  IGT_9206: 9206
  IGT_9208: 9208
  xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d: 2167aae7e27a3c224f220ce01eea87498ff3724d
  xe-pw-177249v2: 177249v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/index.html

--===============8568733627634204413==
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
<tr><td><b>Series:</b></td><td>Interruptible bb wait + related bits (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177249/">https://patchwork.freedesktop.org/series/177249/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d_FULL -&gt; xe-pw-177249v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177249v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5947">Intel XE#5947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925">Intel XE#6925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-3/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-1/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9671">Intel XE#9671</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-1/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846">Intel XE#5846</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-6/igt@kms_cursor_crc@cursor-sliding-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9528">Intel XE#9528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527">Intel XE#9527</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-4/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527">Intel XE#9527</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128">Intel XE#6128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-4/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-3/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-8/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-7/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076">Intel XE#8076</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946">Intel XE#5946</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-yf-tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-1/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927">Intel XE#6927</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854">Intel XE#8854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_sharpness_filter@filter-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-desktop-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@kms_vrr@cmrr-desktop-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-3/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@sriov_basic@pf-unbind-with-vf-probed.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-3/igt@sriov_basic@pf-unbind-with-vf-probed.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@engines-allowed:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-9/igt@xe_configfs@engines-allowed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-7/igt@xe_configfs@engines-allowed.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-7/igt@xe_evict@evict-beng-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-6/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-7/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-4/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-4/igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@sanity:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@xe_exec_multi_queue@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-6/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-4/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7070">Intel XE#7070</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-duplicate-page:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@xe_mempage_offline@inject-duplicate-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203">Intel XE#9203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-single-page:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-4/igt@xe_mempage_offline@inject-single-page.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203">Intel XE#9203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-2/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-conflict:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-8/igt@xe_multigpu_svm@mgpu-coherency-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-7/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-1g-partial:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-7/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@xe_pat@pat-sw-hw-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-1/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-5/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6588">Intel XE#6588</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-8/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-4/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-ptl-8/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-1/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-4/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597">Intel XE#9597</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-2/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-lnl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-lnl-4/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9513">Intel XE#9513</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-2/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780">Intel XE#9780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-4-tiled@pipe-d-dp-2-p010.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-5/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618">Intel XE#8618</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-10/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-ptl-8/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-ptl-3/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-remap-dontunmap-eocheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9841">Intel XE#9841</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9845">Intel XE#9845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-1/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399">Intel XE#9399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177249v2/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9206 -&gt; IGT_9208</li>
<li>Linux: xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d -&gt; xe-pw-177249v2</li>
</ul>
<p>IGT_9206: 9206<br />
  IGT_9208: 9208<br />
  xe-6247-2167aae7e27a3c224f220ce01eea87498ff3724d: 2167aae7e27a3c224f220ce01eea87498ff3724d<br />
  xe-pw-177249v2: 177249v2</p>

</body>
</html>

--===============8568733627634204413==--
