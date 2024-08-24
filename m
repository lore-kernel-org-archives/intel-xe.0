Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D76C5321E
	for <intel-xe@archiver.kernel.org>; Sat, 24 Aug 2024 00:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB2910E182;
	Sat, 24 Aug 2024 00:48:31 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD06010E182;
 Sat, 24 Aug 2024 00:48:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1243389918112847906=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Use_separate_rpm_lock?=
 =?utf-8?q?dep_map_for_non-d3cold-capable_devices?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 24 Aug 2024 00:48:29 -0000
Message-ID: <172446050989.748004.12294310426871703135@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823165817.96481-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240823165817.96481-1-thomas.hellstrom@linux.intel.com>
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

--===============1243389918112847906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use separate rpm lockdep map for non-d3cold-capable devices
URL   : https://patchwork.freedesktop.org/series/137730/
State : failure

== Summary ==

CI Bug Log - changes from xe-1821-96041621daaf71059d790a2ddbaa60114371eada_full -> xe-pw-137730v1_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-137730v1_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137730v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137730v1_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][1] ([Intel XE#1201]) -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - {shard-bmg}:        [SKIP][3] ([Intel XE#367]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - {shard-bmg}:        [SKIP][5] ([Intel XE#2311]) -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - {shard-bmg}:        [PASS][7] -> [SKIP][8] +7 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
    - {shard-bmg}:        [SKIP][9] ([Intel XE#1489]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-7/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-5/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - {shard-bmg}:        [SKIP][11] ([Intel XE#2234]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-7/igt@kms_psr@pr-cursor-plane-onoff.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-5/igt@kms_psr@pr-cursor-plane-onoff.html

  
Known issues
------------

  Here are the changes found in xe-pw-137730v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#1426]) +3 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#1659])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1407])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2191])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#367])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1512]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1399]) +7 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#306])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#373]) +6 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1424])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1413])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#2577]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-5/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-6/igt@kms_cursor_edge_walk@128x128-top-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#309]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1137])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1421]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1401]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1397] / [Intel XE#1745])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1397])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#352])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#656]) +21 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1469])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#651]) +9 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1503] / [Intel XE#599])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_hdr@static-swap.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][41] -> [DMESG-WARN][42] ([Intel XE#2019])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:
    - shard-lnl:          [PASS][43] -> [DMESG-WARN][44] ([Intel XE#324]) +2 other tests dmesg-warn
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#599]) +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#498]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2318]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_psr@pr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1406]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_psr@pr-basic.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1437]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#374] / [Intel XE#599])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#374]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1435])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][53] -> [FAIL][54] ([Intel XE#771] / [Intel XE#899])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][55] -> [FAIL][56] ([Intel XE#899])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#688]) +6 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [PASS][58] -> [TIMEOUT][59] ([Intel XE#1473])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1392]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][61] -> [TIMEOUT][62] ([Intel XE#2105])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#2229])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][64] -> [TIMEOUT][65] ([Intel XE#1961] / [Intel XE#2026])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-4/igt@xe_module_load@many-reload.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-1/igt@xe_module_load@many-reload.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1420])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#584])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][68] -> [ABORT][69] ([Intel XE#1358] / [Intel XE#1607])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-7/igt@xe_pm@s4-basic.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][70] -> [FAIL][71] ([Intel XE#958])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#944])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][73] ([Intel XE#324]) -> [PASS][74] +2 other tests pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [FAIL][75] ([Intel XE#1659]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - {shard-bmg}:        [FAIL][77] ([Intel XE#2436]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2:
    - {shard-bmg}:        [FAIL][79] -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][81] ([Intel XE#771] / [Intel XE#899]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][83] ([Intel XE#899]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - {shard-bmg}:        [TIMEOUT][85] ([Intel XE#1473]) -> [PASS][86] +1 other test pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-threads-large.html
    - shard-dg2-set2:     [TIMEOUT][87] ([Intel XE#1473]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr:
    - shard-lnl:          [FAIL][89] -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-7/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-2/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [ABORT][91] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][93] ([Intel XE#1794]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][95] ([Intel XE#958]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_vm@large-split-misaligned-binds-67108864:
    - {shard-bmg}:        [DMESG-WARN][97] ([Intel XE#877]) -> [PASS][98] +4 other tests pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-2/igt@xe_vm@large-split-misaligned-binds-67108864.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-1/igt@xe_vm@large-split-misaligned-binds-67108864.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [SKIP][99] ([Intel XE#1201] / [Intel XE#801]) -> [SKIP][100] ([Intel XE#801]) +23 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][101] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][102] ([Intel XE#316])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-WARN][103] ([Intel XE#324]) -> [FAIL][104] ([Intel XE#1231])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#607]) -> [SKIP][106] ([Intel XE#1201] / [Intel XE#607])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][107] ([Intel XE#1231]) -> [DMESG-FAIL][108] ([Intel XE#324])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][109] ([Intel XE#324]) -> [FAIL][110] ([Intel XE#1231])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][112] ([Intel XE#619])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#1124]) -> [SKIP][114] ([Intel XE#1124] / [Intel XE#1201])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][116] ([Intel XE#1124]) +6 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_joiner@basic:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][118] ([Intel XE#346])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_big_joiner@basic.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_big_joiner@basic.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][120] ([Intel XE#2191])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#367]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#367])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][124] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#787]) -> [SKIP][126] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][128] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][130] ([Intel XE#787]) +48 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#373]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][134] ([Intel XE#373]) +6 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][136] ([Intel XE#307]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][138] ([Intel XE#308])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][140] ([Intel XE#701])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][142] ([Intel XE#1135])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_feature_discovery@psr1.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#455]) -> [SKIP][144] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [i915#5274]) -> [SKIP][146] ([i915#5274])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][148] ([Intel XE#651]) +21 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#651]) -> [SKIP][150] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][152] ([Intel XE#658])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][154] ([Intel XE#653]) +20 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#653]) -> [SKIP][156] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][158] ([Intel XE#605])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][160] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#2318]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][164] ([Intel XE#2318]) +5 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][166] ([Intel XE#2318] / [Intel XE#455]) +3 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#908]) -> [SKIP][168] ([Intel XE#1201] / [Intel XE#908])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1489]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#1489])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][172] ([Intel XE#1489]) +4 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1122]) -> [SKIP][174] ([Intel XE#1122] / [Intel XE#1201])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][176] ([Intel XE#929]) +9 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#929]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][180] ([Intel XE#1149])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#327]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#327])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][183] ([Intel XE#1729]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#362])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#330]) -> [SKIP][186] ([Intel XE#330])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#2168]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#2168])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_vrr@cmrr.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][190] ([Intel XE#455]) +10 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_vrr@flipline.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][192] ([Intel XE#756]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][193] ([Intel XE#1195] / [Intel XE#1473]) -> [INCOMPLETE][194] ([Intel XE#1473])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][195] ([Intel XE#1473]) -> [FAIL][196] ([Intel XE#1000])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@xe_evict@evict-threads-large.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race:
    - shard-adlp:         [DMESG-FAIL][197] -> [FAIL][198] ([Intel XE#1069])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-9/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-4/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-userptr:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#288]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][202] ([Intel XE#288]) +17 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][204] ([Intel XE#2360])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#2360]) -> [SKIP][206] ([Intel XE#1201] / [Intel XE#2360])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:
    - shard-adlp:         [DMESG-FAIL][207] ([Intel XE#1638]) -> [INCOMPLETE][208] ([Intel XE#1169] / [Intel XE#1195])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-9/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-4/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][210] ([Intel XE#560])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@xe_media_fill@media-fill.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][212] ([Intel XE#378])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@xe_module_load@load.html

  * igt@xe_oa@oa-formats:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#2541]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#2541])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@xe_oa@oa-formats.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@xe_oa@oa-formats.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][216] ([Intel XE#2541]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][218] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#944]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#944])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][224] ([Intel XE#944]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [DMESG-WARN][225] ([Intel XE#1760]) -> [DMESG-FAIL][226] ([Intel XE#1760])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1821-96041621daaf71059d790a2ddbaa60114371eada -> xe-pw-137730v1

  IGT_7988: 436018b50dfd35d75618a690f0dba6143d911aed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1821-96041621daaf71059d790a2ddbaa60114371eada: 96041621daaf71059d790a2ddbaa60114371eada
  xe-pw-137730v1: 137730v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/index.html

--===============1243389918112847906==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use separate rpm lockdep map for non-d3cold-capable devices</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137730/">https://patchwork.freedesktop.org/series/137730/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1821-96041621daaf71059d790a2ddbaa60114371eada_full -&gt; xe-pw-137730v1_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-137730v1_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137730v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137730v1_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-7/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-5/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-7/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-5/igt@kms_psr@pr-cursor-plane-onoff.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137730v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-5/igt@kms_cursor_edge_walk@128x128-top-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-6/igt@kms_cursor_edge_walk@128x128-top-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_scaling_modes@scaling-mode-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374">Intel XE#374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/374">Intel XE#374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@xe_evict@evict-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-4/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-1/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961">Intel XE#1961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026">Intel XE#2026</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-4/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-7/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> +1 other test pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-7/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-2/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@xe_pm@s4-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-67108864:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-bmg-2/igt@xe_vm@large-split-misaligned-binds-67108864.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-bmg-1/igt@xe_vm@large-split-misaligned-binds-67108864.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-9/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-4/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-adlp-9/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-adlp-4/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@xe_oa@oa-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@xe_oa@oa-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1821-96041621daaf71059d790a2ddbaa60114371eada/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137730v1/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1821-96041621daaf71059d790a2ddbaa60114371eada -&gt; xe-pw-137730v1</li>
</ul>
<p>IGT_7988: 436018b50dfd35d75618a690f0dba6143d911aed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1821-96041621daaf71059d790a2ddbaa60114371eada: 96041621daaf71059d790a2ddbaa60114371eada<br />
  xe-pw-137730v1: 137730v1</p>

</body>
</html>

--===============1243389918112847906==--
