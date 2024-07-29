Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5DAC3DA61
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 10:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEC610E38F;
	Mon, 29 Jul 2024 10:31:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAB910E38E;
 Mon, 29 Jul 2024 10:31:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6725299031156317295=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_spi=3A_add_driver_for_Intel_dis?=
 =?utf-8?q?crete_graphics_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Jul 2024 10:31:15 -0000
Message-ID: <172224907511.407318.7634609547450096055@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240729084326.2278014-1-alexander.usyskin@intel.com>
In-Reply-To: <20240729084326.2278014-1-alexander.usyskin@intel.com>
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

--===============6725299031156317295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: spi: add driver for Intel discrete graphics (rev4)
URL   : https://patchwork.freedesktop.org/series/136430/
State : failure

== Summary ==

CI Bug Log - changes from xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee_full -> xe-pw-136430v4_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-136430v4_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136430v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136430v4_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][1] ([Intel XE#1201]) -> [SKIP][2] +35 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-463/igt@kms_psr@psr-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_psr@psr-dpms.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_oa@non-privileged-map-oa-buffer}:
    - shard-dg2-set2:     [SKIP][3] ([Intel XE#1201]) -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html
    - shard-lnl:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@xe_oa@non-privileged-map-oa-buffer.html

  
Known issues
------------

  Here are the changes found in xe-pw-136430v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#1659]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][11] ([Intel XE#1242])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#367])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1399]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#1252])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#787]) +17 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_frames@hdmi-crc-planes-random:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#373])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-planes-random.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#307])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1424]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1413])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#323])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1135] / [Intel XE#1201])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] ([Intel XE#1195] / [Intel XE#2049])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#455]) +8 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1397] / [Intel XE#1745])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1397])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#352]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#651]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#656]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#656]) +9 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][38] -> [SKIP][39] ([Intel XE#1201] / [Intel XE#455])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-466/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][40] -> [DMESG-FAIL][41] ([Intel XE#324])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-8/igt@kms_plane@plane-position-covered.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-4/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#2318]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-edp-1.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          NOTRUN -> [FAIL][43] ([Intel XE#2029])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1122] / [Intel XE#1201])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1406])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@pr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@kms_psr@pr-suspend.html

  * igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][48] ([Intel XE#294]) +1 other test fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][50] -> [FAIL][51] ([Intel XE#771] / [Intel XE#899])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#899]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][54] -> [FAIL][55] ([Intel XE#899]) +1 other test fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][56] ([Intel XE#2028]) +2 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1062] / [Intel XE#1201])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-beng-large-cm:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#261])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@xe_evict@evict-beng-large-cm.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#688]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#1392])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_fault_mode@once-bindexecqueue:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@xe_exec_fault_mode@once-bindexecqueue.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][63] -> [INCOMPLETE][64] ([Intel XE#1195] / [Intel XE#2105])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#979])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s2idle-basic:
    - shard-lnl:          [PASS][66] -> [FAIL][67] ([Intel XE#1924] / [Intel XE#2028])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-6/igt@xe_pm@s2idle-basic.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#584]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][69] -> [ABORT][70] ([Intel XE#1358])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][71] -> [ABORT][72] ([Intel XE#1358] / [Intel XE#1794])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-topology:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#944])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@xe_query@multigpu-query-topology.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
    - shard-adlp:         [DMESG-WARN][74] -> [PASS][75] +1 other test pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-adlp-9/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-9/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [DMESG-WARN][76] -> [PASS][77] +1 other test pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-463/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@ab-hdmi-a6-dp4.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-466/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-lnl:          [FAIL][78] ([Intel XE#2028]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-lnl:          [FAIL][80] ([Intel XE#1901] / [Intel XE#2028]) -> [PASS][81] +2 other tests pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-5/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [ABORT][82] ([Intel XE#1035]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * {igt@kms_plane@plane-position-hole@pipe-a-plane-3}:
    - shard-lnl:          [DMESG-FAIL][84] ([Intel XE#324]) -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html

  * {igt@kms_plane@plane-position-hole@pipe-b-plane-3}:
    - shard-lnl:          [DMESG-WARN][86] ([Intel XE#324]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-3.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-b-plane-3.html

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:
    - shard-adlp:         [DMESG-WARN][88] ([Intel XE#2226]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-adlp-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][90] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][92] ([Intel XE#1600]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][94] ([Intel XE#1473]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][96] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][98] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-2/igt@xe_pm@s4-basic.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][100] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#1201] / [Intel XE#1885]) -> [SKIP][103] ([Intel XE#1885])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-463/igt@core_hotunplug@hotreplug.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#2134]) -> [SKIP][105] ([Intel XE#1201] / [Intel XE#2134])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@fbdev@nullptr.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@fbdev@nullptr.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#316]) -> [SKIP][107] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][109] ([Intel XE#316]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][111] ([Intel XE#1124]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#619]) -> [SKIP][113] ([Intel XE#1201] / [Intel XE#619])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1124]) -> [SKIP][115] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][117] ([Intel XE#367])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][119] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][121] ([Intel XE#787]) +6 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#787]) -> [SKIP][123] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][125] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#314]) -> [SKIP][127] ([Intel XE#1201] / [Intel XE#314])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][129] ([Intel XE#373]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_chamelium_audio@dp-audio-edid.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#373]) -> [SKIP][131] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#1201] / [i915#2575]) -> [SKIP][133] ([i915#2575]) +29 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][135] ([Intel XE#455]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-set2:     [SKIP][136] ([i915#2575]) -> [SKIP][137] ([Intel XE#1201] / [i915#2575]) +22 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#455]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#455])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][141] ([Intel XE#308])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [i915#3804]) -> [SKIP][143] ([i915#3804])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][144] ([Intel XE#1551]) -> [INCOMPLETE][145] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [i915#5274]) -> [SKIP][147] ([i915#5274])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][149] ([Intel XE#651]) +6 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#651]) -> [SKIP][151] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][152] -> [SKIP][153] ([Intel XE#1201]) +28 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][155] ([Intel XE#653]) +7 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#653]) -> [SKIP][157] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-FAIL][158] ([Intel XE#324]) -> [DMESG-WARN][159] ([Intel XE#324])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-5/igt@kms_plane@plane-position-hole.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-6/igt@kms_plane@plane-position-hole.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][161] ([Intel XE#908])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][163] ([Intel XE#1489])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#1489]) -> [SKIP][165] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][167] ([Intel XE#929]) +4 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_psr@fbc-pr-no-drrs.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#929]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#327]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#327])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1091]) -> [SKIP][173] ([Intel XE#1091] / [Intel XE#1201])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1130]) -> [SKIP][175] ([Intel XE#1130] / [Intel XE#1201]) +36 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [INCOMPLETE][176] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402]) -> [INCOMPLETE][177] ([Intel XE#1473] / [Intel XE#402])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][179] ([Intel XE#1130]) +38 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-463/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#288]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][183] ([Intel XE#288]) +4 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr-prefetch.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-prefetch.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][185] ([Intel XE#378])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@xe_module_load@force-load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee -> xe-pw-136430v4

  IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee: 7b8299ef6e80db2d0621a593f5d58f9b6f892bee
  xe-pw-136430v4: 136430v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/index.html

--===============6725299031156317295==
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
<tr><td><b>Series:</b></td><td>spi: add driver for Intel discrete graphics (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136430/">https://patchwork.freedesktop.org/series/136430/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee_full -&gt; xe-pw-136430v4_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-136430v4_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136430v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136430v4_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@psr-dpms:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-463/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_oa@non-privileged-map-oa-buffer}:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136430v4_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-planes-random:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_flip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-466/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-8/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-4/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@xe_evict@evict-beng-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@xe_exec_fault_mode@once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-6/igt@xe_pm@s2idle-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@xe_pm@s2idle-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@xe_pm@s3-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-adlp-9/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-9/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-463/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@ab-hdmi-a6-dp4.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-466/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@ab-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-5/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901">Intel XE#1901</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-5/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-hole@pipe-a-plane-3}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-hole@pipe-b-plane-3}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-b-plane-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-read-sync:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-adlp-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-6/igt@xe_dma_buf_sync@export-dma-buf-once-read-sync.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-1/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-463/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-lnl-5/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-lnl-6/igt@kms_plane@plane-position-hole.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-463/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-433/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v4/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee -&gt; xe-pw-136430v4</li>
</ul>
<p>IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1679-7b8299ef6e80db2d0621a593f5d58f9b6f892bee: 7b8299ef6e80db2d0621a593f5d58f9b6f892bee<br />
  xe-pw-136430v4: 136430v4</p>

</body>
</html>

--===============6725299031156317295==--
