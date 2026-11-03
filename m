Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3EC606D81E
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 14:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB7A10F62B;
	Tue,  3 Nov 2026 14:46:25 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF28410F628;
 Tue,  3 Nov 2026 14:46:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6369018976808179365=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Frontbuffer_tracking_fixes?=
 =?utf-8?q?_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Nov 2026 14:46:24 -0000
Message-ID: <179371718483.110810.15981302671419407387@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102100051.272137-1-jouni.hogander@intel.com>
In-Reply-To: <20261102100051.272137-1-jouni.hogander@intel.com>
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

--===============6369018976808179365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Frontbuffer tracking fixes (rev3)
URL   : https://patchwork.freedesktop.org/series/177219/
State : failure

== Summary ==

CI Bug Log - changes from xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779_FULL -> xe-pw-177219v3_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-177219v3_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-177219v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-177219v3_FULL:

### IGT changes ###

#### Warnings ####

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          [SKIP][1] ([Intel XE#7283]) -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][3] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_pm_rpm@dpms-lpsp.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html

  
Known issues
------------

  Here are the changes found in xe-pw-177219v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#5177] / [Intel XE#8589])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@intel_hwmon@hwmon-read.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#5901])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1407])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][9] ([Intel XE#5808]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#7679])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#8365])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#5822]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#3432])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#2252])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_chamelium_hpd@dp-hpd-fast.html
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#373])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-ptl:          NOTRUN -> [SKIP][18] ([Intel XE#6507])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_chamelium_sharpness_filter@filter-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#6507] / [Intel XE#7358])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][20] ([Intel XE#3304] / [Intel XE#7374])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][21] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-4/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#6707] / [Intel XE#7439])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-ptl:          NOTRUN -> [SKIP][23] ([Intel XE#5900])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_cursor_crc@cursor-random-32x10.html
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1424])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#5907])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_dsc@dsc-basic-ultrajoiner.html
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#8265])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-ptl:          NOTRUN -> [SKIP][27] ([Intel XE#2316])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1421])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#7178])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7178] / [Intel XE#7349])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#5828]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#352])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#656] / [Intel XE#7905]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#5800] / [Intel XE#6312]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][38] ([Intel XE#6312])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-pgflip-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#6312])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#5812]) +10 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt.html
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#7905]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2313])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][43] ([Intel XE#7865])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc.html
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#7865])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#7061])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#7061])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#8348])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-7/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_plane@pixel-format-x-tiled-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][48] ([Intel XE#7283]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_plane@pixel-format-x-tiled-modifier.html

  * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#8303]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#7283])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][51] -> [DMESG-FAIL][52] ([Intel XE#7774]) +1 other test dmesg-fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-x.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#5858])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#4608])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][56] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1.html
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#4608] / [Intel XE#7304])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#7413])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1128] / [Intel XE#7413])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#6144])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#6540] / [Intel XE#688])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#8589]) +117 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr.html
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#7482]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr.html

  * igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][65] ([Intel XE#7482]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#5575] / [Intel XE#7484])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1392])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [PASS][68] -> [FAIL][69] ([Intel XE#8578])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-10/igt@xe_exec_fault_mode@atomic-many.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][70] ([Intel XE#8374]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#8374]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#8364]) +7 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority:
    - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#8364]) +7 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-madvise:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][74] ([Intel XE#2594] / [Intel XE#8159])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-madvise.html

  * igt@xe_module_load@load:
    - shard-ptl:          ([PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99]) -> ([PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [SKIP][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122]) ([Intel XE#9286])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-1/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-8/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-8/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-8/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-5/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-5/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-7/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-7/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-1/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-1/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-1/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-4/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-6/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-4/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-6/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-3/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-4/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-5/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-2/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-2/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-6/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-7/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-2/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-3/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-3/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-7/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-7/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-7/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-5/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-5/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-5/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-2/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-2/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-4/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-4/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-2/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-6/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-6/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-8/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-8/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-8/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-1/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-1/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-1/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-4/igt@xe_module_load@load.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-ptl:          NOTRUN -> [SKIP][123] ([Intel XE#6069])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_oa@oa-tlb-invalidate.html
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][125] -> [DMESG-WARN][126] ([Intel XE#7727])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-lnl-8/igt@xe_pm@s4-mocs.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-7/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][127] -> [ABORT][128] ([Intel XE#9362]) +1 other test abort
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-lnl-3/igt@xe_pm@s4-vm-bind-unbind-all.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-topology:
    - shard-ptl:          NOTRUN -> [SKIP][129] ([Intel XE#6019])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_query@multigpu-query-topology.html
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#944])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#4130] / [Intel XE#7366])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-ptl:          [FAIL][132] ([Intel XE#8628]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][134] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][135] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:
    - shard-ptl:          [DMESG-WARN][136] ([Intel XE#9391]) -> [PASS][137] +1 other test pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          [FAIL][138] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][139] +1 other test pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-4/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][140] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-lnl-5/igt@kms_vrr@flipline.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-4/igt@kms_vrr@flipline.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-ptl:          [ABORT][142] ([Intel XE#9362]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-4/igt@xe_pm@s4-multiple-execs.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_pm@s4-multiple-execs.html
    - shard-lnl:          [ABORT][144] ([Intel XE#9362]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][146] ([Intel XE#2370]) -> [SKIP][147] ([Intel XE#8589])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          [SKIP][148] ([Intel XE#2327]) -> [SKIP][149] ([Intel XE#8589])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          [SKIP][150] ([Intel XE#1124]) -> [SKIP][151] ([Intel XE#8589]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][152] ([Intel XE#7679]) -> [SKIP][153] ([Intel XE#8589])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][154] ([Intel XE#2887]) -> [SKIP][155] ([Intel XE#8589]) +2 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][156] ([Intel XE#3432]) -> [SKIP][157] ([Intel XE#8589])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-bmg:          [SKIP][158] ([Intel XE#2252]) -> [SKIP][159] ([Intel XE#8589])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][160] ([Intel XE#6507] / [Intel XE#7358]) -> [SKIP][161] ([Intel XE#8589])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-bmg:          [SKIP][162] ([Intel XE#2320]) -> [SKIP][163] ([Intel XE#8589])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_cursor_crc@cursor-random-32x10.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_dsc@dsc-basic-ultrajoiner:
    - shard-bmg:          [SKIP][164] ([Intel XE#8265]) -> [SKIP][165] ([Intel XE#8589])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_dsc@dsc-basic-ultrajoiner.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_dsc@dsc-basic-ultrajoiner.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][166] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][167] ([Intel XE#8589])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][168] ([Intel XE#4141]) -> [SKIP][169] ([Intel XE#8589]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-bmg:          [SKIP][170] ([Intel XE#2311]) -> [SKIP][171] ([Intel XE#8589]) +11 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][172] ([Intel XE#2313]) -> [SKIP][173] ([Intel XE#8589]) +10 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][174] ([Intel XE#7061]) -> [SKIP][175] ([Intel XE#8589]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-bmg:          [SKIP][176] ([Intel XE#7283]) -> [SKIP][177] ([Intel XE#8589])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          [SKIP][178] ([Intel XE#1489]) -> [SKIP][179] ([Intel XE#8589])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][180] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][181] ([Intel XE#8589])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][182] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][183] ([Intel XE#8589]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][184] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][185] ([Intel XE#2509] / [Intel XE#7437])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_evict@evict-mixed-threads-small-multi-queue:
    - shard-bmg:          [SKIP][186] ([Intel XE#8370]) -> [SKIP][187] ([Intel XE#8589])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_evict@evict-mixed-threads-small-multi-queue.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@xe_evict@evict-mixed-threads-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][188] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][189] ([Intel XE#8589]) +1 other test skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          [SKIP][190] ([Intel XE#8374]) -> [SKIP][191] ([Intel XE#8589]) +2 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-priority-smem:
    - shard-bmg:          [SKIP][192] ([Intel XE#8364]) -> [SKIP][193] ([Intel XE#8589]) +7 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-priority-smem.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-priority-smem.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][194] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393]) -> [SKIP][195] ([Intel XE#8589])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_oa@oa-tlb-invalidate.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][196] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][197] ([Intel XE#8589])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_pm@d3cold-multiple-execs.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          [SKIP][198] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][199] ([Intel XE#8589])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_pxp@display-pxp-fb.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-topology:
    - shard-bmg:          [SKIP][200] ([Intel XE#944]) -> [SKIP][201] ([Intel XE#8589])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_query@multigpu-query-topology.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@xe_query@multigpu-query-topology.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5828]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6069
  [Intel XE#6144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#8628]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8628
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9286
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9391
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779 -> xe-pw-177219v3

  IGT_9175: 9175
  xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779: 0f5e7199aaceed05aa49dad4c97df2677e32f779
  xe-pw-177219v3: 177219v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/index.html

--===============6369018976808179365==
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
<tr><td><b>Series:</b></td><td>Frontbuffer tracking fixes (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/177219/">https://patchwork.freedesktop.org/series/177219/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-177219v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-177219v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6049-0f5e7199aaceed05aa49dad4c97df2677=
e32f779_FULL -&gt; xe-pw-177219v3_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-177219v3_FULL need to be verifie=
d<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-177219v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1772=
19v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-7/igt@kms_plan=
e@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Int=
el XE#7283</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-177219v3/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc=
-modifier-source-clamping.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_pm_r=
pm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#83=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177=
219v3/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177219v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@intel_hw=
mon@hwmon-read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@intel_hwmon@hwmon-read.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/517=
7">Intel XE#5177</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_big_fb@linear-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5901">Intel XE#5901</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_big_fb@linear-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +2 othe=
r tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_ccs@bad-pixel-format-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_chamelium_hpd@dp-hpd-fast=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2252">Intel XE#2252</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-fast=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_chamelium_sharpness_filte=
r@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_chamelium_sharpness_filte=
r@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6507">Intel XE#6507</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_content_protection@atomic=
-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-bmg-4/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-bmg-7/igt@kms_content_protection@uevent=
@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_cursor_crc@cursor-random-=
32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5900">Intel XE#5900</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_cursor_crc@cursor-random-=
32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_dsc@dsc-basic-ultrajoiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5907">Intel XE#5907</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_dsc@dsc-basic-ultrajoiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_flip@2x-blocking-absolute=
-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2316">Intel XE#2316</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_flip@2x-blocking-absolute=
-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7=
349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5828">Intel XE#5828</a>) +1 other =
test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
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
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE=
#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7385">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_force_connector_basic@for=
ce-connector-state.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 oth=
er test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +10 othe=
r tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_frontbuffer_tracking@hdr-=
1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_frontbuffer_tracking@hdr-=
1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_frontbuffer_tracking@psrh=
dr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_frontbuffer_tracking@psrh=
dr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-bmg-7/igt@kms_mst@mst-suspend-read-crc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_plane@pixel-format-x-tile=
d-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_plane@pixel-format-x-tile=
d-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_plane@pixel-format-y-tile=
d-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_plane_multiple@2x-=
tiling-x.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7774">Intel XE#7774</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-update-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-update-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-update-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 o=
ther test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-update-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7413">Intel XE#7413</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1128">Intel XE#1128</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_evict_ccs@evict-overcommit=
-standalone-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6144">Intel XE#6144</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit=
-standalone-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_exec_=
balancer@many-execqueues-cm-parallel-userptr.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/ig=
t@xe_exec_balancer@many-execqueues-cm-parallel-userptr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8=
589</a>) +117 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_exec_balancer@many-execque=
ues-cm-parallel-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_exec_balancer@once-cm-virt=
ual-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-10/igt@xe_exec=
_fault_mode@atomic-many.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-6/igt@xe_exec_fault_mode@at=
omic-many.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8578">Intel XE#8578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_exec_fault_mode@many-multi=
-queue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_exec_fault_mode@many-multi=
-queue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_exec_multi_queue@many-queu=
es-preempt-mode-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_exec_multi_queue@two-queue=
s-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-madvise:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-bmg-7/igt@xe_exec_system_allocator@many=
-large-execqueues-mmap-remap-madvise.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE=
#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-ptl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-p=
tl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/sha=
rd-ptl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779=
/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32=
f779/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df267=
7e32f779/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97d=
f2677e32f779/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4=
c97df2677e32f779/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49=
dad4c97df2677e32f779/shard-ptl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05=
aa49dad4c97df2677e32f779/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199aace=
ed05aa49dad4c97df2677e32f779/shard-ptl-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e7199=
aaceed05aa49dad4c97df2677e32f779/shard-ptl-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-0f5e=
7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6049-=
0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6=
049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-6/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-=
ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/sh=
ard-ptl-3/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-7/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-177219v3/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1772=
19v3/shard-ptl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-177219v3/shard-ptl-2/igt@xe_module_load@load.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1772=
19v3/shard-ptl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-177219v3/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1772=
19v3/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-177219v3/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1772=
19v3/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-=
4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9286">Intel XE#9286</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
069">Intel XE#6069</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7325">Intel XE#7325</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7393">Intel XE#7393</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-lnl-8/igt@xe_pm@s4=
-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-177219v3/shard-lnl-7/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#=
7727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-lnl-3/igt@xe_pm@s4=
-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-a=
ll.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_query@multigpu-query-topol=
ogy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6019">Intel XE#6019</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_query@multigpu-query-topol=
ogy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-4/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8628">Intel XE#8628=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1772=
19v3/shard-ptl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-=
flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#=
8150</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
177219v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-2/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9391">Intel XE#9=
391</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
77219v3/shard-ptl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-=
edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-1/igt@kms_vrr@=
flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-p=
tl-4/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-lnl-5/igt@kms_vrr@=
flipline.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4227">Intel XE#4227</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-4/igt@kms_vrr@=
flipline.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-ptl-4/igt@xe_pm@s4=
-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-ptl-3/igt@xe_pm@s4-multi=
ple-execs.html">PASS</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-lnl-2/igt@xe_pm@s4=
-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-lnl-8/igt@xe_pm@s4-multi=
ple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel =
XE#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-177219v3/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_big_=
fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_b=
ig_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_big_=
fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@km=
s_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1772=
19v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_ccs@=
bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5=
/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bm=
g-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8=
589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_cham=
elium_hpd@dp-hpd-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_chame=
lium_hpd@dp-hpd-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_cham=
elium_sharpness_filter@filter-basic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1772=
19v3/shard-bmg-5/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">=
Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_curs=
or_crc@cursor-random-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_=
cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-ultrajoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_dsc@=
dsc-basic-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_dsc@d=
sc-basic-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_flip=
_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Int=
el XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7349">Intel XE#7349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp=
-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#414=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177=
219v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8589">Intel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/=
shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8589">Intel XE#8589</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
77219v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8589">Intel XE#8589</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@psrhdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3=
/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_plan=
e@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5=
/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5=
/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_psr2=
_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bm=
g-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@kms_psr@=
fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-=
bmg-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-7/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel X=
E#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-177219v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_evict=
@evict-mixed-threads-small-multi-queue.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bm=
g-5/igt@xe_evict@evict-mixed-threads-small-multi-queue.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8=
589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel X=
E#7372</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-177219v3/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-reb=
ind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_exec_=
fault_mode@once-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1772=
19v3/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate=
-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8589">Intel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_exec_=
multi_queue@max-queues-preempt-mode-fault-priority-smem.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#=
8364</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
177219v3/shard-bmg-5/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-=
priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8589">Intel XE#8589</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_oa@oa=
-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2248">Intel XE#2248</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7325">Intel XE#7325</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7393">Intel XE#7393</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/sha=
rd-bmg-5/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/i=
gt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_pxp@d=
isplay-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@xe_=
pxp@display-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779/shard-bmg-9/igt@xe_query=
@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177219v3/shard-bmg-5/igt@xe_query=
@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779 -&gt; xe-pw-177=
219v3</li>
</ul>
<p>IGT_9175: 9175<br />
  xe-6049-0f5e7199aaceed05aa49dad4c97df2677e32f779: 0f5e7199aaceed05aa49dad=
4c97df2677e32f779<br />
  xe-pw-177219v3: 177219v3</p>

</body>
</html>

--===============6369018976808179365==--
