Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CF9C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 22:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C51F10E537;
	Tue, 16 Apr 2024 22:12:41 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC63810E537;
 Tue, 16 Apr 2024 22:12:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6715567153708977944=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Per_client_usage?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 16 Apr 2024 22:12:37 -0000
Message-ID: <171330555769.1445680.4633060195720260244@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
In-Reply-To: <20240416030454.3739862-1-lucas.demarchi@intel.com>
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

--===============6715567153708977944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Per client usage
URL   : https://patchwork.freedesktop.org/series/132477/
State : failure

== Summary ==

CI Bug Log - changes from xe-1095-5f7597e990bea547bd1261170497e7476fb781bb_full -> xe-pw-132477v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132477v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132477v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132477v1_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-2} (NEW):
    - {shard-lnl}:        NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-2.html

  * igt@xe_vm@large-split-binds-2097152:
    - shard-adlp:         [PASS][2] -> [DMESG-FAIL][3] +1 other test dmesg-fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@xe_vm@large-split-binds-2097152.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@xe_vm@large-split-binds-2097152.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - {shard-lnl}:        [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - {shard-lnl}:        [SKIP][6] ([Intel XE#373]) -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@kms_chamelium_frames@hdmi-crc-single.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-8/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - {shard-lnl}:        [SKIP][8] ([Intel XE#309]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_fbcon_fbt@fbc:
    - {shard-lnl}:        NOTRUN -> [DMESG-WARN][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@psr2:
    - {shard-lnl}:        [PASS][11] -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@kms_feature_discovery@psr2.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - {shard-lnl}:        [SKIP][13] ([Intel XE#1401]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - {shard-lnl}:        [SKIP][15] ([Intel XE#656]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - {shard-lnl}:        [PASS][17] -> [INCOMPLETE][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_plane_alpha_blend@alpha-basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-7/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-edp-1:
    - {shard-lnl}:        [TIMEOUT][19] ([Intel XE#1558]) -> [INCOMPLETE][20] +1 other test incomplete
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-edp-1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-edp-1.html

  
New tests
---------

  New tests have been introduced between xe-1095-5f7597e990bea547bd1261170497e7476fb781bb_full and xe-pw-132477v1_full:

### New IGT tests (6) ###

  * igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-edp-2:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [50.27] s

  * igt@kms_cursor_edge_walk@64x64-top-edge@pipe-c-edp-2:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [49.33] s

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-edp-2:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [28.28] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c-edp-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  

Known issues
------------

  Here are the changes found in xe-pw-132477v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][21] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#358])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][22] ([Intel XE#1033] / [Intel XE#1214]) +3 other tests dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#801]) +15 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [FAIL][24] ([Intel XE#650]) +12 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#316])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1124] / [Intel XE#1201]) +10 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][28] -> [FAIL][29] ([Intel XE#1231])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#787]) +57 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#787]) +44 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#307])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#455])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#308])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#308])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][43] ([Intel XE#1195] / [Intel XE#927]) +1 other test incomplete
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][44] ([Intel XE#1195])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][45] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6.html

  * {igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-edp-2} (NEW):
    - {shard-lnl}:        NOTRUN -> [DMESG-WARN][46] ([Intel XE#1537]) +2 other tests dmesg-warn
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-7/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-edp-2.html

  * igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-hdmi-a-2:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][47] ([Intel XE#1214]) +1 other test dmesg-warn
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][48] -> [DMESG-WARN][49] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#309]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#323])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1137] / [Intel XE#1201])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#310]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][54] ([Intel XE#1214] / [Intel XE#1608]) +2 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-adlp:         [PASS][55] -> [SKIP][56] ([Intel XE#1201])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1201])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][58] ([Intel XE#324]) +3 other tests dmesg-fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#656]) +30 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#1341])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][65] ([Intel XE#616])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-434/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_panel_fitting@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#455]) +21 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format@pipe-b:
    - shard-adlp:         NOTRUN -> [FAIL][67] ([Intel XE#1331]) +2 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_plane@pixel-format@pipe-b.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-adlp:         [PASS][68] -> [INCOMPLETE][69] ([Intel XE#1150] / [Intel XE#1195])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_plane_alpha_blend@alpha-basic.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][70] ([Intel XE#324])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-464/igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-7.html

  * igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][71] ([Intel XE#1214] / [Intel XE#324])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-433/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html

  * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][72] ([Intel XE#616]) +6 other tests fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][73] -> [FAIL][74] ([Intel XE#361]) +2 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][75] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-2 (NEW):
    - {shard-lnl}:        NOTRUN -> [SKIP][78] ([Intel XE#305]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-2.html

  * igt@kms_pm_backlight@fade:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#870])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1129] / [Intel XE#1201])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [PASS][81] -> [SKIP][82] ([Intel XE#1201] / [Intel XE#1211]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1122] / [Intel XE#1201])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_psr@psr-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1149] / [Intel XE#1201])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][88] ([Intel XE#294]) +1 other test fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#327])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [PASS][90] -> [DMESG-WARN][91] ([Intel XE#1162] / [Intel XE#1214])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#756])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-464/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_ccs@ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     NOTRUN -> [FAIL][94] ([Intel XE#1050])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-434/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][95] -> [FAIL][96] ([Intel XE#1259])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [PASS][97] -> [TIMEOUT][98] ([Intel XE#1473] / [Intel XE#392])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [PASS][99] -> [INCOMPLETE][100] ([Intel XE#1195] / [Intel XE#1473])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@xe_evict@evict-cm-threads-large-multi-vm.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@xe_evict@evict-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#261]) +6 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#688])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_balancer@once-virtual-basic:
    - shard-adlp:         [PASS][104] -> [DMESG-WARN][105] ([Intel XE#1214]) +1 other test dmesg-warn
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_exec_balancer@once-virtual-basic.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@xe_exec_balancer@once-virtual-basic.html

  * igt@xe_exec_compute_mode@once-userptr:
    - shard-adlp:         [PASS][106] -> [FAIL][107] ([Intel XE#1069])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_exec_compute_mode@once-userptr.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@xe_exec_compute_mode@once-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#288]) +15 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_reset@cm-gt-reset:
    - shard-adlp:         NOTRUN -> [FAIL][110] ([Intel XE#1068])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@xe_exec_reset@cm-gt-reset.html

  * igt@xe_exec_threads@threads-fd-userptr:
    - shard-dg2-set2:     [PASS][111] -> [INCOMPLETE][112] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_exec_threads@threads-fd-userptr.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@xe_exec_threads@threads-fd-userptr.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][113] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][114] -> [SKIP][115] ([Intel XE#1192] / [Intel XE#1201])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_live_ktest@xe_bo.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][116] -> [DMESG-WARN][117] ([Intel XE#1214]) +3 other tests dmesg-warn
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_module_load@reload.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-436/igt@xe_module_load@reload.html

  * igt@xe_noexec_ping_pong:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1201] / [Intel XE#379])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@xe_noexec_ping_pong.html

  * igt@xe_peer2peer@read:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#1061] / [Intel XE#1201])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3-mmap-system:
    - shard-adlp:         NOTRUN -> [FAIL][120] ([Intel XE#1221])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@xe_pm@d3-mmap-system.html

  * igt@xe_pm@d3hot-basic:
    - shard-dg2-set2:     [PASS][121] -> [FAIL][122] ([Intel XE#355])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_pm@d3hot-basic.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@xe_pm@d3hot-basic.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-adlp:         [PASS][123] -> [FAIL][124] ([Intel XE#355])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_pm@d3hot-multiple-execs.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][125] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#1201] / [Intel XE#366])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         NOTRUN -> [FAIL][127] ([Intel XE#1043] / [Intel XE#845])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@xe_pm@s4-basic-exec.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#1201] / [Intel XE#944])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@xe_query@multigpu-query-mem-usage.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-63:
    - shard-adlp:         [SKIP][129] ([Intel XE#1177] / [Intel XE#1201]) -> [PASS][130] +4 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_addfb_basic@bad-pitch-63.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_addfb_basic@bad-pitch-63.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][131] ([Intel XE#1231]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][133] ([Intel XE#1204]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * {igt@kms_big_joiner@basic-force-joiner}:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_big_joiner@basic-force-joiner.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_big_joiner@basic-force-joiner.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][137] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][139] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][140] +2 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_flip@basic-plain-flip:
    - {shard-lnl}:        [DMESG-WARN][141] ([Intel XE#1330] / [Intel XE#1537]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_flip@basic-plain-flip.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-3/igt@kms_flip@basic-plain-flip.html
    - shard-adlp:         [INCOMPLETE][143] ([Intel XE#1150] / [Intel XE#1195] / [Intel XE#1330]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_flip@basic-plain-flip.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_flip@basic-plain-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - {shard-lnl}:        [FAIL][145] ([Intel XE#480]) -> [PASS][146] +3 other tests pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-adlp:         [DMESG-WARN][147] ([Intel XE#1214]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [SKIP][149] ([Intel XE#1201]) -> [PASS][150] +44 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         [INCOMPLETE][151] ([Intel XE#1195]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - {shard-lnl}:        [INCOMPLETE][153] ([Intel XE#1602]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - {shard-lnl}:        [DMESG-WARN][155] ([Intel XE#1330]) -> [PASS][156] +4 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - {shard-lnl}:        [DMESG-FAIL][157] ([Intel XE#1537] / [Intel XE#1602]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_pm_dc@dc5-psr:
    - {shard-lnl}:        [FAIL][159] ([Intel XE#718]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-dg2-set2:     [FAIL][161] ([Intel XE#1204]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_pm_dc@dc9-dpms.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-434/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_pm_rpm@modeset-lpsp.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][165] ([Intel XE#771] / [Intel XE#899]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][167] ([Intel XE#899]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html

  * igt@kms_vblank@wait-forked:
    - {shard-lnl}:        [DMESG-WARN][169] ([Intel XE#1602]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_vblank@wait-forked.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-1/igt@kms_vblank@wait-forked.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate:
    - {shard-lnl}:        [DMESG-FAIL][171] ([Intel XE#1537] / [Intel XE#1619]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr:
    - {shard-lnl}:        [INCOMPLETE][173] ([Intel XE#1617]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html

  * igt@xe_exec_queue_property@invalid-property:
    - {shard-lnl}:        [DMESG-WARN][175] ([Intel XE#1537]) -> [PASS][176] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@xe_exec_queue_property@invalid-property.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-4/igt@xe_exec_queue_property@invalid-property.html

  * igt@xe_exec_reset@gt-reset-stress:
    - {shard-lnl}:        [DMESG-WARN][177] ([Intel XE#1329]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@xe_exec_reset@gt-reset-stress.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-7/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - {shard-lnl}:        [FAIL][179] ([Intel XE#1081]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - {shard-lnl}:        [FAIL][181] -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [DMESG-FAIL][183] ([Intel XE#1554]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_module_load@many-reload.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload:
    - shard-adlp:         [FAIL][185] -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_module_load@reload.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@xe_module_load@reload.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-dg2-set2:     [FAIL][187] ([Intel XE#355]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@xe_pm@d3hot-basic-exec.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [INCOMPLETE][189] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_pm@s2idle-basic.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         [DMESG-WARN][191] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_pm@s3-basic.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@xe_pm@s3-basic.html

  * igt@xe_vm@large-userptr-binds-16777216:
    - {shard-lnl}:        [DMESG-FAIL][193] ([Intel XE#1619]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@xe_vm@large-userptr-binds-16777216.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-1/igt@xe_vm@large-userptr-binds-16777216.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [DMESG-WARN][195] ([Intel XE#1214]) -> [ABORT][196] ([Intel XE#1538])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@core_hotunplug@hotreplug.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         [INCOMPLETE][197] ([Intel XE#1195] / [Intel XE#1538]) -> [ABORT][198] ([Intel XE#1538])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-adlp:         [SKIP][199] ([Intel XE#1201]) -> [SKIP][200] ([Intel XE#1124] / [Intel XE#1201])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [SKIP][201] ([Intel XE#1177] / [Intel XE#1201]) -> [DMESG-FAIL][202] ([Intel XE#324])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][203] ([Intel XE#1619]) -> [FAIL][204] ([Intel XE#1231])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-adlp:         [DMESG-FAIL][205] ([Intel XE#1619]) -> [FAIL][206] ([Intel XE#616])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [SKIP][207] ([Intel XE#1201]) -> [FAIL][208] ([Intel XE#616]) +1 other test fail
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][209] ([Intel XE#1231]) -> [DMESG-FAIL][210] ([Intel XE#1088] / [Intel XE#1330])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [SKIP][211] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][212] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         [SKIP][213] ([Intel XE#1201]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-adlp:         [SKIP][215] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][216] ([Intel XE#1201])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_chamelium_frames@hdmi-crc-single.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_chamelium_frames@hdmi-crc-single.html
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][218] ([Intel XE#1201])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-single.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-adlp:         [SKIP][219] ([Intel XE#1201]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-adlp:         [SKIP][221] ([Intel XE#1201]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#308])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-dg2-set2:     [FAIL][223] ([Intel XE#581]) -> [DMESG-WARN][224] ([Intel XE#1214] / [Intel XE#282])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][225] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][226] ([Intel XE#1201])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
    - shard-adlp:         [SKIP][227] ([Intel XE#1201] / [Intel XE#309]) -> [SKIP][228] ([Intel XE#1201])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-adlp:         [SKIP][229] ([Intel XE#1201]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#309])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [INCOMPLETE][231] ([Intel XE#1195]) -> [INCOMPLETE][232] ([Intel XE#1195] / [Intel XE#927])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-adlp:         [SKIP][233] ([Intel XE#1201]) -> [SKIP][234] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@2x-blocking-wf_vblank.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][235] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][236] ([Intel XE#1195] / [Intel XE#927])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][237] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][238] ([Intel XE#1195])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [SKIP][239] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][240] ([Intel XE#1201] / [Intel XE#651])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         [SKIP][241] ([Intel XE#1201]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#656]) +13 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         [SKIP][243] ([Intel XE#1201]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#1201]) -> [SKIP][246] ([Intel XE#1201] / [Intel XE#651])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][248] ([Intel XE#1201])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
    - shard-adlp:         [SKIP][249] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][250] ([Intel XE#1201])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][251] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][252] ([Intel XE#1201] / [Intel XE#656])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         [SKIP][253] ([Intel XE#1201]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         [SKIP][255] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][256] ([Intel XE#1201] / [Intel XE#417])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_hdmi_inject@inject-audio.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch:
    - shard-adlp:         [SKIP][257] ([Intel XE#1201]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_hdr@bpc-switch.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_hdr@bpc-switch.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [SKIP][259] ([Intel XE#1201]) -> [INCOMPLETE][260] ([Intel XE#1035] / [Intel XE#1195] / [Intel XE#927])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [FAIL][261] ([Intel XE#616]) -> [DMESG-FAIL][262] ([Intel XE#1162]) +1 other test dmesg-fail
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-dg2-set2:     [DMESG-WARN][263] ([Intel XE#1214] / [Intel XE#324]) -> [DMESG-FAIL][264] ([Intel XE#324])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_plane_lowres@tiling-4.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-464/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-dg2-set2:     [TIMEOUT][265] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][266] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][267] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][268] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#1201]) -> [INCOMPLETE][270] ([Intel XE#1195] / [Intel XE#909])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         [SKIP][271] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][272] ([Intel XE#1122] / [Intel XE#1201])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][273] ([Intel XE#1148] / [Intel XE#1204]) -> [SKIP][274] ([Intel XE#1201] / [Intel XE#734])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-adlp:         [SKIP][275] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][276] ([Intel XE#1201])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-adlp:         [SKIP][277] ([Intel XE#1201]) -> [SKIP][278] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr@fbc-pr-sprite-plane-move.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-adlp:         [SKIP][279] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][280] ([Intel XE#1201] / [Intel XE#929])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr@fbc-psr-dpms.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_psr@fbc-psr-dpms.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][281] ([Intel XE#1473] / [Intel XE#392] / [Intel XE#931]) -> [TIMEOUT][282] ([Intel XE#1473] / [Intel XE#392])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-small-multi-vm:
    - shard-adlp:         [SKIP][283] ([Intel XE#1201]) -> [SKIP][284] ([Intel XE#1201] / [Intel XE#261])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_evict@evict-beng-threads-small-multi-vm.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@xe_evict@evict-beng-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][285] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][286] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-adlp:         [SKIP][287] ([Intel XE#1201]) -> [SKIP][288] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [DMESG-FAIL][289] ([Intel XE#1162] / [Intel XE#1551]) -> [FAIL][290] ([Intel XE#1043] / [Intel XE#845])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_pm@s4-basic.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@xe_pm@s4-basic.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-adlp:         [SKIP][291] ([Intel XE#1201]) -> [SKIP][292] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_query@multigpu-query-invalid-size.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1148]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1148
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331
  [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1396
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1460]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1460
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1554]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1554
  [Intel XE#1558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558
  [Intel XE#1577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1577
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1603]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603
  [Intel XE#1605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1605
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1617]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1617
  [Intel XE#1619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619
  [Intel XE#1641]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1641
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/355
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#931]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/931
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_7806 -> IGT_7807
  * Linux: xe-1095-5f7597e990bea547bd1261170497e7476fb781bb -> xe-pw-132477v1

  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7807: 43e71eeac0fb4fe59df40df2c96fd0fdbf585c0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1095-5f7597e990bea547bd1261170497e7476fb781bb: 5f7597e990bea547bd1261170497e7476fb781bb
  xe-pw-132477v1: 132477v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/index.html

--===============6715567153708977944==
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
<tr><td><b>Series:</b></td><td>drm/xe: Per client usage</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132477/">https://patchwork.freedesktop.org/series/132477/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1095-5f7597e990bea547bd1261170497e7476fb781bb_full -&gt; xe-pw-132477v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132477v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132477v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132477v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-2} (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-2097152:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@xe_vm@large-split-binds-2097152.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@xe_vm@large-split-binds-2097152.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-8/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-7/igt@kms_fbcon_fbt@fbc.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@kms_feature_discovery@psr2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-7/igt@kms_feature_discovery@psr2.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-1/igt@kms_plane_alpha_blend@alpha-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-7/igt@kms_plane_alpha_blend@alpha-basic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-edp-1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558">Intel XE#1558</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-a-edp-1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1095-5f7597e990bea547bd1261170497e7476fb781bb_full and xe-pw-132477v1_full:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [50.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-edge@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [49.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [28.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-c-edp-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132477v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-edp-2} (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-7/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-edp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-a-hdmi-a-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341">Intel XE#1341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-434/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_plane@pixel-format@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331">Intel XE#1331</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_plane_alpha_blend@alpha-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@kms_plane_alpha_blend@alpha-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150">Intel XE#1150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-464/igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-7.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-433/igt@kms_plane_lowres@tiling-none@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-2 (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b-edp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_psr@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-464/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@xe_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-434/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@xe_evict@evict-cm-threads-large-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@xe_evict@evict-cm-threads-large-multi-vm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@xe_evict@evict-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_exec_balancer@once-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@xe_exec_balancer@once-virtual-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_exec_compute_mode@once-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@xe_exec_compute_mode@once-userptr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-gt-reset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@xe_exec_reset@cm-gt-reset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068">Intel XE#1068</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_exec_threads@threads-fd-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@xe_exec_threads@threads-fd-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-436/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3-mmap-system:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@xe_pm@d3-mmap-system.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221">Intel XE#1221</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_pm@d3hot-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@xe_pm@d3hot-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_pm@d3hot-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@xe_pm@d3hot-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@xe_pm@s4-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-63:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_addfb_basic@bad-pitch-63.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_addfb_basic@bad-pitch-63.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_big_joiner@basic-force-joiner}:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_big_joiner@basic-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_big_joiner@basic-force-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_flip@basic-plain-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-3/igt@kms_flip@basic-plain-flip.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-1/igt@kms_flip@basic-plain-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150">Intel XE#1150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_flip@basic-plain-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">PASS</a> +44 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-434/igt@kms_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@kms_vblank@wait-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-1/igt@kms_vblank@wait-forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1617">Intel XE#1617</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@invalid-property:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-6/igt@xe_exec_queue_property@invalid-property.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-4/igt@xe_exec_queue_property@invalid-property.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-4/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329">Intel XE#1329</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-7/igt@xe_exec_reset@gt-reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_module_load@many-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1554">Intel XE#1554</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_module_load@reload.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@xe_pm@d3hot-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@xe_pm@d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@xe_pm@s2idle-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@xe_pm@s2idle-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@xe_pm@s3-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-16777216:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-lnl-8/igt@xe_vm@large-userptr-binds-16777216.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-lnl-1/igt@xe_vm@large-userptr-binds-16777216.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@core_hotunplug@hotreplug.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-top-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@kms_plane_lowres@tiling-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-464/igt@kms_plane_lowres@tiling-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-435/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1148">Intel XE#1148</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-2/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/931">Intel XE#931</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_evict@evict-beng-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-1/igt@xe_evict@evict-beng-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-dg2-463/igt@xe_pm@s4-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-dg2-466/igt@xe_pm@s4-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1095-5f7597e990bea547bd1261170497e7476fb781bb/shard-adlp-2/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132477v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7806 -&gt; IGT_7807</li>
<li>Linux: xe-1095-5f7597e990bea547bd1261170497e7476fb781bb -&gt; xe-pw-132477v1</li>
</ul>
<p>IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7807: 43e71eeac0fb4fe59df40df2c96fd0fdbf585c0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1095-5f7597e990bea547bd1261170497e7476fb781bb: 5f7597e990bea547bd1261170497e7476fb781bb<br />
  xe-pw-132477v1: 132477v1</p>

</body>
</html>

--===============6715567153708977944==--
