Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA70C88E40
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 01:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222C810E24F;
	Fri, 11 Sep 2026 01:45:43 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C550210E24F;
 Fri, 11 Sep 2026 01:45:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3030202042761344283=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/debugfs=3A_Expose_p?=
 =?utf-8?q?er-engine_idle_status_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sk Anirban" <sk.anirban@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Sep 2026 01:45:41 -0000
Message-ID: <178909114179.147924.17797398735215807849@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910165855.1124574-2-sk.anirban@intel.com>
In-Reply-To: <20260910165855.1124574-2-sk.anirban@intel.com>
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

--===============3030202042761344283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/debugfs: Expose per-engine idle status (rev5)
URL   : https://patchwork.freedesktop.org/series/168204/
State : failure

== Summary ==

CI Bug Log - changes from xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6_FULL -> xe-pw-168204v5_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168204v5_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168204v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168204v5_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-10/igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-8/igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault.html

  
Known issues
------------

  Here are the changes found in xe-pw-168204v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1407]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#7679])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#367])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#8365])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +8 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#3432])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652]) +7 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#306] / [Intel XE#7358]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#373]) +5 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#6974])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#2321] / [Intel XE#7355])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1424]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#309] / [Intel XE#7343]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#4354] / [Intel XE#7450])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#8265]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1421]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a3:
    - shard-bmg:          [PASS][21] -> [FAIL][22] ([Intel XE#5408] / [Intel XE#6266]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a3.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][23] -> [FAIL][24] ([Intel XE#301]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [PASS][25] -> [FAIL][26] ([Intel XE#3321]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#7178] / [Intel XE#7349])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#6312] / [Intel XE#651]) +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#7905]) +24 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#656] / [Intel XE#7905]) +21 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#6312]) +6 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7061])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7865]) +10 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#1503])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-9/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1503])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#7086] / [Intel XE#7390])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#8303]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7283]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#4596] / [Intel XE#5854])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#4608]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-no-drrs@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_psr@fbc-psr2-no-drrs@edp-1.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1406] / [Intel XE#7345]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1406])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_psr@pr-dpms.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1435] / [Intel XE#9142])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_ccs@vm-bind-fault-mode-decompress:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#7644])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_ccs@vm-bind-fault-mode-decompress.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1062] / [Intel XE#7318] / [Intel XE#7457])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-7/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#6540] / [Intel XE#688]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_exec_balancer@many-parallel-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#7482]) +9 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_exec_balancer@many-parallel-userptr.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1392]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#8374]) +6 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html

  * igt@xe_exec_multi_queue@many-queues-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#8364]) +15 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#8369]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_system_allocator@once-mmap-new-huge:
    - shard-bmg:          [PASS][62] -> [INCOMPLETE][63] ([Intel XE#8159])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-9/igt@xe_exec_system_allocator@once-mmap-new-huge.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-3/igt@xe_exec_system_allocator@once-mmap-new-huge.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-bmg:          [PASS][64] -> [FAIL][65] ([Intel XE#9096])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-10/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#8378]) +6 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-userptr.html

  * igt@xe_multigpu_svm@mgpu-coherency-conflict:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#6964])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_multigpu_svm@mgpu-coherency-conflict.html

  * igt@xe_page_reclaim@basic-mixed:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#7793]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-1/igt@xe_page_reclaim@basic-mixed.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#7590] / [Intel XE#7772])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-1/igt@xe_pm@d3cold-basic.html

  * igt@xe_prefetch_fault@prefetch-fault-svm:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7599])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_prefetch_fault@prefetch-fault-svm.html

  * igt@xe_query@multigpu-query-config:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#944]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-7/igt@xe_query@multigpu-query-config.html

  * igt@xe_sriov_admin@sched-priority-vf-write-denied:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#7174])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@xe_sriov_admin@sched-priority-vf-write-denied.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#4130] / [Intel XE#7366])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_scheduling@equal-throughput-low-priority:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#8339])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@xe_sriov_scheduling@equal-throughput-low-priority.html

  * igt@xe_sriov_vfio@open-basic:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#7724])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_sriov_vfio@open-basic.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          NOTRUN -> [ABORT][77] ([Intel XE#8963])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-7/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@fbdev@eof:
    - shard-bmg:          [FAIL][78] -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@fbdev@eof.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@fbdev@eof.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-bmg:          [DMESG-FAIL][80] ([Intel XE#7774]) -> [PASS][81] +1 other test pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [ABORT][82] -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][84] ([Intel XE#301]) -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][86] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [SKIP][88] ([Intel XE#8589]) -> [PASS][89] +121 other tests pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][90] ([Intel XE#8589]) -> [SKIP][91] ([Intel XE#2327])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][92] ([Intel XE#8589]) -> [SKIP][93] ([Intel XE#1124]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][94] ([Intel XE#8589]) -> [SKIP][95] ([Intel XE#367])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][96] ([Intel XE#8589]) -> [SKIP][97] ([Intel XE#2887]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][98] ([Intel XE#8589]) -> [SKIP][99] ([Intel XE#2652])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][100] ([Intel XE#8589]) -> [SKIP][101] ([Intel XE#2325] / [Intel XE#7358])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][102] ([Intel XE#8589]) -> [SKIP][103] ([Intel XE#2390] / [Intel XE#6974])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          [SKIP][104] ([Intel XE#8589]) -> [SKIP][105] ([Intel XE#2320])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][106] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][107] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-bmg:          [SKIP][108] ([Intel XE#8589]) -> [SKIP][109] ([Intel XE#8265])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][110] ([Intel XE#8589]) -> [SKIP][111] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][112] ([Intel XE#8589]) -> [SKIP][113] ([Intel XE#4141]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][114] ([Intel XE#8589]) -> [SKIP][115] ([Intel XE#7061] / [Intel XE#7356])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          [SKIP][116] ([Intel XE#8589]) -> [SKIP][117] ([Intel XE#2311]) +8 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][118] ([Intel XE#8589]) -> [SKIP][119] ([Intel XE#2313]) +9 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][120] ([Intel XE#8589]) -> [SKIP][121] ([Intel XE#1489]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-bmg:          [SKIP][122] ([Intel XE#8589]) -> [SKIP][123] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_psr@psr-cursor-plane-onoff.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][124] ([Intel XE#8589]) -> [SKIP][125] ([Intel XE#2330] / [Intel XE#5813])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][126] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][127] ([Intel XE#1729] / [Intel XE#7424])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          [SKIP][128] ([Intel XE#8589]) -> [SKIP][129] ([Intel XE#8370])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_evict@evict-small-external-multi-queue-cm.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - shard-bmg:          [SKIP][130] ([Intel XE#8589]) -> [SKIP][131] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_exec_basic@multigpu-once-userptr-rebind.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_exec_basic@multigpu-once-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue:
    - shard-bmg:          [SKIP][132] ([Intel XE#8589]) -> [SKIP][133] ([Intel XE#8374])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_exec_fault_mode@twice-multi-queue.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-queue.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate:
    - shard-bmg:          [SKIP][134] ([Intel XE#8589]) -> [SKIP][135] ([Intel XE#8364]) +6 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [DMESG-WARN][136] ([Intel XE#9130]) -> [ABORT][137] ([Intel XE#9131] / [Intel XE#9145])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-7/igt@xe_exec_reset@gt-reset-fault-injection.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-8/igt@xe_exec_reset@gt-reset-fault-injection.html
    - shard-lnl:          [ABORT][138] ([Intel XE#9145]) -> [DMESG-WARN][139] ([Intel XE#9130])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-lnl-2/igt@xe_exec_reset@gt-reset-fault-injection.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@xe_exec_reset@gt-reset-fault-injection.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          [SKIP][140] ([Intel XE#8589]) -> [INCOMPLETE][141] ([Intel XE#7098] / [Intel XE#8159])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic:
    - shard-bmg:          [SKIP][142] ([Intel XE#8589]) -> [SKIP][143] ([Intel XE#8378])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          [SKIP][144] ([Intel XE#8589]) -> [SKIP][145] ([Intel XE#7954])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_gpgpu_fill@offset-4x4.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_page_reclaim@many-vma-same-bo:
    - shard-bmg:          [SKIP][146] ([Intel XE#8589]) -> [SKIP][147] ([Intel XE#7793])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_page_reclaim@many-vma-same-bo.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_page_reclaim@many-vma-same-bo.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          [SKIP][148] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][149] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_peer2peer@write.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_peer2peer@write.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          [SKIP][150] ([Intel XE#8589]) -> [SKIP][151] ([Intel XE#4733] / [Intel XE#7417])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [SKIP][152] ([Intel XE#8589]) -> [DMESG-WARN][153] ([Intel XE#8963])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html

  
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7318
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7390
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7450
  [Intel XE#7457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7724
  [Intel XE#7772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9131
  [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6 -> xe-pw-168204v5

  IGT_9090: 9090
  xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6: de0b423cd4c2178272a2057ee6c7b05fbd4015a6
  xe-pw-168204v5: 168204v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/index.html

--===============3030202042761344283==
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
<tr><td><b>Series:</b></td><td>drm/xe/debugfs: Expose per-engine idle status (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168204/">https://patchwork.freedesktop.org/series/168204/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6_FULL -&gt; xe-pw-168204v5_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168204v5_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-168204v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-168204v5_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-10/igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-8/igt@xe_exec_system_allocator@partial-atomic-middle-remap-no-cpu-fault.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168204v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-1/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7450">Intel XE#7450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-9/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-7/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086">Intel XE#7086</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7390">Intel XE#7390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_psr@fbc-psr2-no-drrs@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-fault-mode-decompress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_ccs@vm-bind-fault-mode-decompress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-7/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7318">Intel XE#7318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457">Intel XE#7457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_exec_balancer@many-parallel-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_exec_reset@multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-9/igt@xe_exec_system_allocator@once-mmap-new-huge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-3/igt@xe_exec_system_allocator@once-mmap-new-huge.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-10/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-conflict:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_multigpu_svm@mgpu-coherency-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@basic-mixed:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-1/igt@xe_page_reclaim@basic-mixed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772">Intel XE#7772</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-1/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault-svm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_prefetch_fault@prefetch-fault-svm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-7/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@sched-priority-vf-write-denied:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@xe_sriov_admin@sched-priority-vf-write-denied.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-low-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@xe_sriov_scheduling@equal-throughput-low-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@open-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-3/igt@xe_sriov_vfio@open-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7724">Intel XE#7724</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-7/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@fbdev@eof.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> +121 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_evict@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_evict@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_exec_basic@multigpu-once-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_exec_basic@multigpu-once-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_exec_fault_mode@twice-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-7/igt@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-8/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9131">Intel XE#9131</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-lnl-2/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-lnl-2/igt@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@many-vma-same-bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_page_reclaim@many-vma-same-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_page_reclaim@many-vma-same-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168204v5/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6 -&gt; xe-pw-168204v5</li>
</ul>
<p>IGT_9090: 9090<br />
  xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6: de0b423cd4c2178272a2057ee6c7b05fbd4015a6<br />
  xe-pw-168204v5: 168204v5</p>

</body>
</html>

--===============3030202042761344283==--
